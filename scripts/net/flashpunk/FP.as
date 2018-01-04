package net.flashpunk
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.media.SoundMixer;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import net.flashpunk.debug.Console;
   import flash.utils.ByteArray;
   import net.flashpunk.tweens.misc.MultiVarTween;
   import net.flashpunk.tweens.misc.Alarm;
   import flash.media.SoundTransform;
   import flash.display.Stage;
   import flash.geom.Matrix;
   import flash.display.Sprite;
   
   public class FP
   {
      
      public static const VERSION:String = "1.6";
      
      public static var width:uint;
      
      public static var height:uint;
      
      public static var halfWidth:Number;
      
      public static var halfHeight:Number;
      
      public static var fixed:Boolean;
      
      public static var timeInFrames:Boolean;
      
      public static var frameRate:Number;
      
      public static var assignedFrameRate:Number;
      
      public static var elapsed:Number;
      
      public static var rate:Number = 1;
      
      public static var screen:net.flashpunk.Screen;
      
      public static var buffer:BitmapData;
      
      public static var bounds:Rectangle;
      
      public static var camera:Point = new Point();
      
      public static var tweener:net.flashpunk.Tweener = new net.flashpunk.Tweener();
      
      public static var focused:Boolean = true;
      
      static var _world:World;
      
      static var _goto:World;
      
      static var _console:Console;
      
      static var _time:uint;
      
      public static var _updateTime:uint;
      
      public static var _renderTime:uint;
      
      public static var _gameTime:uint;
      
      public static var _flashTime:uint;
      
      private static var _bitmap:Dictionary = new Dictionary();
      
      private static var _seed:uint = 0;
      
      private static var _getSeed:uint;
      
      private static var _volume:Number = 1;
      
      private static var _pan:Number = 0;
      
      private static var _soundTransform:SoundTransform = new SoundTransform();
      
      public static const DEG:Number = -180 / Math.PI;
      
      public static const RAD:Number = Math.PI / -180;
      
      public static var stage:Stage;
      
      public static var engine:net.flashpunk.Engine;
      
      public static var point:Point = new Point();
      
      public static var point2:Point = new Point();
      
      public static var zero:Point = new Point();
      
      public static var rect:Rectangle = new Rectangle();
      
      public static var matrix:Matrix = new Matrix();
      
      public static var sprite:Sprite = new Sprite();
      
      public static var entity:net.flashpunk.Entity;
       
      
      public function FP()
      {
         super();
      }
      
      public static function get world() : World
      {
         return _world;
      }
      
      public static function set world(value:World) : void
      {
         if(_world == value)
         {
            return;
         }
         _goto = value;
      }
      
      public static function setCamera(x:Number = 0, y:Number = 0) : void
      {
         camera.x = x;
         camera.y = y;
      }
      
      public static function resetCamera() : void
      {
         camera.y = 0;
         camera.x = 0;
      }
      
      public static function get volume() : Number
      {
         return _volume;
      }
      
      public static function set volume(value:Number) : void
      {
         if(value < 0)
         {
            value = 0;
         }
         if(_volume == value)
         {
            return;
         }
         _soundTransform.volume = _volume = value;
         SoundMixer.soundTransform = _soundTransform;
      }
      
      public static function get pan() : Number
      {
         return _pan;
      }
      
      public static function set pan(value:Number) : void
      {
         if(value < -1)
         {
            value = -1;
         }
         if(value > 1)
         {
            value = 1;
         }
         if(_pan == value)
         {
            return;
         }
         _soundTransform.pan = _pan = value;
         SoundMixer.soundTransform = _soundTransform;
      }
      
      public static function remove(array:*, toRemove:*) : Boolean
      {
         var i:int = array.indexOf(toRemove);
         if(i >= 0)
         {
            array.splice(i,1);
            return true;
         }
         return false;
      }
      
      public static function choose(... objs) : *
      {
         var c:* = objs.length == 1 && (objs[0] is Array || objs[0] is Vector.<*>)?objs[0]:objs;
         return c[rand(c.length)];
      }
      
      public static function sign(value:Number) : int
      {
         return value < 0?int(-1):value > 0?int(1):int(0);
      }
      
      public static function approach(value:Number, target:Number, amount:Number) : Number
      {
         return value < target?target < value + amount?Number(target):Number(value + amount):target > value - amount?Number(target):Number(value - amount);
      }
      
      public static function lerp(a:Number, b:Number, t:Number = 1) : Number
      {
         return a + (b - a) * t;
      }
      
      public static function colorLerp(fromColor:uint, toColor:uint, t:Number = 1) : uint
      {
         if(t <= 0)
         {
            return fromColor;
         }
         if(t >= 1)
         {
            return toColor;
         }
         var a:uint = fromColor >> 24 & 255;
         var r:uint = fromColor >> 16 & 255;
         var g:uint = fromColor >> 8 & 255;
         var b:uint = fromColor & 255;
         var dA:int = (toColor >> 24 & 255) - a;
         var dR:int = (toColor >> 16 & 255) - r;
         var dG:int = (toColor >> 8 & 255) - g;
         var dB:int = (toColor & 255) - b;
         a = a + dA * t;
         r = r + dR * t;
         g = g + dG * t;
         b = b + dB * t;
         return a << 24 | r << 16 | g << 8 | b;
      }
      
      public static function stepTowards(object:Object, x:Number, y:Number, distance:Number = 1) : void
      {
         point.x = x - object.x;
         point.y = y - object.y;
         if(point.length <= distance)
         {
            object.x = x;
            object.y = y;
            return;
         }
         point.normalize(distance);
         object.x = object.x + point.x;
         object.y = object.y + point.y;
      }
      
      public static function anchorTo(object:Object, anchor:Object, distance:Number = 0) : void
      {
         point.x = object.x - anchor.x;
         point.y = object.y - anchor.y;
         if(point.length > distance)
         {
            point.normalize(distance);
         }
         object.x = anchor.x + point.x;
         object.y = anchor.y + point.y;
      }
      
      public static function angle(x1:Number, y1:Number, x2:Number, y2:Number) : Number
      {
         var a:Number = Math.atan2(y2 - y1,x2 - x1) * DEG;
         return a < 0?Number(a + 360):Number(a);
      }
      
      public static function angleXY(object:Object, angle:Number, length:Number = 1, x:Number = 0, y:Number = 0) : void
      {
         angle = angle * RAD;
         object.x = Math.cos(angle) * length + x;
         object.y = Math.sin(angle) * length + y;
      }
      
      public static function rotateAround(object:Object, anchor:Object, angle:Number = 0, relative:Boolean = true) : void
      {
         if(relative)
         {
            angle = angle + FP.angle(anchor.x,anchor.y,object.x,object.y);
         }
         FP.angleXY(object,angle,FP.distance(anchor.x,anchor.y,object.x,object.y),anchor.x,anchor.y);
      }
      
      public static function angleDiff(a:Number, b:Number) : Number
      {
         for(var diff:Number = b - a; diff > 180; )
         {
            diff = diff - 360;
         }
         while(diff <= -180)
         {
            diff = diff + 360;
         }
         return diff;
      }
      
      public static function distance(x1:Number, y1:Number, x2:Number = 0, y2:Number = 0) : Number
      {
         return Math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
      }
      
      public static function distanceRects(x1:Number, y1:Number, w1:Number, h1:Number, x2:Number, y2:Number, w2:Number, h2:Number) : Number
      {
         if(x1 < x2 + w2 && x2 < x1 + w1)
         {
            if(y1 < y2 + h2 && y2 < y1 + h1)
            {
               return 0;
            }
            if(y1 > y2)
            {
               return y1 - (y2 + h2);
            }
            return y2 - (y1 + h1);
         }
         if(y1 < y2 + h2 && y2 < y1 + h1)
         {
            if(x1 > x2)
            {
               return x1 - (x2 + w2);
            }
            return x2 - (x1 + w1);
         }
         if(x1 > x2)
         {
            if(y1 > y2)
            {
               return distance(x1,y1,x2 + w2,y2 + h2);
            }
            return distance(x1,y1 + h1,x2 + w2,y2);
         }
         if(y1 > y2)
         {
            return distance(x1 + w1,y1,x2,y2 + h2);
         }
         return distance(x1 + w1,y1 + h1,x2,y2);
      }
      
      public static function distanceRectPoint(px:Number, py:Number, rx:Number, ry:Number, rw:Number, rh:Number) : Number
      {
         if(px >= rx && px <= rx + rw)
         {
            if(py >= ry && py <= ry + rh)
            {
               return 0;
            }
            if(py > ry)
            {
               return py - (ry + rh);
            }
            return ry - py;
         }
         if(py >= ry && py <= ry + rh)
         {
            if(px > rx)
            {
               return px - (rx + rw);
            }
            return rx - px;
         }
         if(px > rx)
         {
            if(py > ry)
            {
               return distance(px,py,rx + rw,ry + rh);
            }
            return distance(px,py,rx + rw,ry);
         }
         if(py > ry)
         {
            return distance(px,py,rx,ry + rh);
         }
         return distance(px,py,rx,ry);
      }
      
      public static function clamp(value:Number, min:Number, max:Number) : Number
      {
         if(max > min)
         {
            value = value < max?Number(value):Number(max);
            return value > min?Number(value):Number(min);
         }
         value = value < min?Number(value):Number(min);
         return value > max?Number(value):Number(max);
      }
      
      public static function clampInRect(object:Object, x:Number, y:Number, width:Number, height:Number, padding:Number = 0) : void
      {
         object.x = clamp(object.x,x + padding,x + width - padding);
         object.y = clamp(object.y,y + padding,y + height - padding);
      }
      
      public static function scale(value:Number, min:Number, max:Number, min2:Number, max2:Number) : Number
      {
         return min2 + (value - min) / (max - min) * (max2 - min2);
      }
      
      public static function scaleClamp(value:Number, min:Number, max:Number, min2:Number, max2:Number) : Number
      {
         value = min2 + (value - min) / (max - min) * (max2 - min2);
         if(max2 > min2)
         {
            value = value < max2?Number(value):Number(max2);
            return value > min2?Number(value):Number(min2);
         }
         value = value < min2?Number(value):Number(min2);
         return value > max2?Number(value):Number(max2);
      }
      
      public static function get randomSeed() : uint
      {
         return _getSeed;
      }
      
      public static function set randomSeed(value:uint) : void
      {
         _seed = clamp(value,1,2147483646);
         _getSeed = _seed;
      }
      
      public static function randomizeSeed() : void
      {
         randomSeed = 2147483647 * Math.random();
      }
      
      public static function get random() : Number
      {
         _seed = _seed * 16807 % 2147483647;
         return _seed / 2147483647;
      }
      
      public static function rand(amount:uint) : uint
      {
         _seed = _seed * 16807 % 2147483647;
         return _seed / 2147483647 * amount;
      }
      
      public static function next(current:*, options:Array, loop:Boolean = true) : *
      {
         if(loop)
         {
            return options[(options.indexOf(current) + 1) % options.length];
         }
         return options[Math.max(options.indexOf(current) + 1,options.length - 1)];
      }
      
      public static function prev(current:*, options:Array, loop:Boolean = true) : *
      {
         if(loop)
         {
            return options[(options.indexOf(current) - 1 + options.length) % options.length];
         }
         return options[Math.max(options.indexOf(current) - 1,0)];
      }
      
      public static function swap(current:*, a:*, b:*) : *
      {
         return current == a?b:a;
      }
      
      public static function getColorRGB(R:uint = 0, G:uint = 0, B:uint = 0) : uint
      {
         return R << 16 | G << 8 | B;
      }
      
      public static function getColorHSV(h:Number, s:Number, v:Number) : uint
      {
         h = h < 0?Number(0):h > 1?Number(1):Number(h);
         s = s < 0?Number(0):s > 1?Number(1):Number(s);
         v = v < 0?Number(0):v > 1?Number(1):Number(v);
         h = int(h * 360);
         var hi:int = int(h / 60) % 6;
         var f:Number = h / 60 - int(h / 60);
         var p:Number = v * (1 - s);
         var q:Number = v * (1 - f * s);
         var t:Number = v * (1 - (1 - f) * s);
         switch(hi)
         {
            case 0:
               return int(v * 255) << 16 | int(t * 255) << 8 | int(p * 255);
            case 1:
               return int(q * 255) << 16 | int(v * 255) << 8 | int(p * 255);
            case 2:
               return int(p * 255) << 16 | int(v * 255) << 8 | int(t * 255);
            case 3:
               return int(p * 255) << 16 | int(q * 255) << 8 | int(v * 255);
            case 4:
               return int(t * 255) << 16 | int(p * 255) << 8 | int(v * 255);
            case 5:
               return int(v * 255) << 16 | int(p * 255) << 8 | int(q * 255);
            default:
               return 0;
         }
      }
      
      public static function getRed(color:uint) : uint
      {
         return color >> 16 & 255;
      }
      
      public static function getGreen(color:uint) : uint
      {
         return color >> 8 & 255;
      }
      
      public static function getBlue(color:uint) : uint
      {
         return color & 255;
      }
      
      public static function getBitmap(source:Class) : BitmapData
      {
         if(_bitmap[source])
         {
            return _bitmap[source];
         }
         return _bitmap[source] = new source().bitmapData;
      }
      
      public static function clearBitmapCache() : void
      {
         _bitmap = new Dictionary();
      }
      
      public static function timeFlag() : uint
      {
         var t:uint = getTimer();
         var e:uint = t - _time;
         _time = t;
         return e;
      }
      
      public static function get console() : Console
      {
         if(!_console)
         {
            _console = new Console();
         }
         return _console;
      }
      
      public static function log(... data) : void
      {
         var i:int = 0;
         var s:String = null;
         if(_console)
         {
            if(data.length > 1)
            {
               i = 0;
               s = "";
               while(i < data.length)
               {
                  if(i > 0)
                  {
                     s = s + " ";
                  }
                  s = s + data[i++].toString();
               }
               _console.log(s);
            }
            else
            {
               _console.log(data[0]);
            }
         }
      }
      
      public static function watch(... properties) : void
      {
         if(_console)
         {
            if(properties.length > 1)
            {
               _console.watch(properties);
            }
            else
            {
               _console.watch(properties[0]);
            }
         }
      }
      
      public static function getXML(file:Class) : XML
      {
         var bytes:ByteArray = new file();
         return XML(bytes.readUTFBytes(bytes.length));
      }
      
      public static function tween(object:Object, values:Object, duration:Number, options:Object = null) : MultiVarTween
      {
         var delay:Number = NaN;
         if(options && options.hasOwnProperty("delay"))
         {
            delay = options.delay;
            delete options.delay;
            FP.alarm(delay,function():void
            {
               FP.tween(object,values,duration,options);
            });
            return null;
         }
         var type:uint = Tween.ONESHOT;
         var complete:Function = null;
         var ease:Function = null;
         var tweener:net.flashpunk.Tweener = FP.tweener;
         if(object is Tweener)
         {
            tweener = object as Tweener;
         }
         if(options)
         {
            if(options is Function)
            {
               complete = options as Function;
            }
            if(options.hasOwnProperty("type"))
            {
               type = options.type;
            }
            if(options.hasOwnProperty("complete"))
            {
               complete = options.complete;
            }
            if(options.hasOwnProperty("ease"))
            {
               ease = options.ease;
            }
            if(options.hasOwnProperty("tweener"))
            {
               tweener = options.tweener;
            }
         }
         var tween:MultiVarTween = new MultiVarTween(complete,type);
         tween.tween(object,values,duration,ease);
         tweener.addTween(tween);
         return tween;
      }
      
      public static function alarm(delay:Number, callback:Function, type:uint = 2, tweener:net.flashpunk.Tweener = null) : Alarm
      {
         if(!tweener)
         {
            tweener = FP.tweener;
         }
         var alarm:Alarm = new Alarm(delay,callback,type);
         tweener.addTween(alarm,true);
         return alarm;
      }
      
      public static function frames(from:int, to:int, skip:int = 0) : Array
      {
         var a:Array = [];
         skip++;
         if(from < to)
         {
            while(from <= to)
            {
               a.push(from);
               from = from + skip;
            }
         }
         else
         {
            while(from >= to)
            {
               a.push(from);
               from = from - skip;
            }
         }
         return a;
      }
      
      public static function shuffle(a:Object) : void
      {
         var i:int = 0;
         var j:int = 0;
         var t:* = undefined;
         if(a is Array || a is Vector.<*>)
         {
            i = a.length;
            while(--i)
            {
               t = a[i];
               a[i] = a[j = int(FP.rand(i + 1))];
               a[j] = t;
            }
         }
      }
      
      public static function sort(object:Object, ascending:Boolean = true) : void
      {
         if(object is Array || object is Vector.<*>)
         {
            quicksort(object,0,object.length - 1,ascending);
         }
      }
      
      public static function sortBy(object:Object, property:String, ascending:Boolean = true) : void
      {
         if(object is Array || object is Vector.<*>)
         {
            quicksortBy(object,0,object.length - 1,ascending,property);
         }
      }
      
      private static function quicksort(a:Object, left:int, right:int, ascending:Boolean) : void
      {
         var t:Number = NaN;
         var i:int = left;
         var j:int = right;
         var p:* = a[Math.round((left + right) * 0.5)];
         if(ascending)
         {
            while(i <= j)
            {
               while(a[i] < p)
               {
                  i++;
               }
               while(a[j] > p)
               {
                  j--;
               }
               if(i <= j)
               {
                  t = a[i];
                  a[i++] = a[j];
                  a[j--] = t;
               }
            }
         }
         else
         {
            while(i <= j)
            {
               while(a[i] > p)
               {
                  i++;
               }
               while(a[j] < p)
               {
                  j--;
               }
               if(i <= j)
               {
                  t = a[i];
                  a[i++] = a[j];
                  a[j--] = t;
               }
            }
         }
         if(left < j)
         {
            quicksort(a,left,j,ascending);
         }
         if(i < right)
         {
            quicksort(a,i,right,ascending);
         }
      }
      
      private static function quicksortBy(a:Object, left:int, right:int, ascending:Boolean, property:String) : void
      {
         var t:Object = null;
         var i:int = left;
         var j:int = right;
         var p:* = a[Math.round((left + right) * 0.5)][property];
         if(ascending)
         {
            while(i <= j)
            {
               while(a[i][property] < p)
               {
                  i++;
               }
               while(a[j][property] > p)
               {
                  j--;
               }
               if(i <= j)
               {
                  t = a[i];
                  a[i++] = a[j];
                  a[j--] = t;
               }
            }
         }
         else
         {
            while(i <= j)
            {
               while(a[i][property] > p)
               {
                  i++;
               }
               while(a[j][property] < p)
               {
                  j--;
               }
               if(i <= j)
               {
                  t = a[i];
                  a[i++] = a[j];
                  a[j--] = t;
               }
            }
         }
         if(left < j)
         {
            quicksortBy(a,left,j,ascending,property);
         }
         if(i < right)
         {
            quicksortBy(a,i,right,ascending,property);
         }
      }
   }
}
