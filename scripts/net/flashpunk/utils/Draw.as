package net.flashpunk.utils
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import net.flashpunk.FP;
   import flash.display.LineScaleMode;
   import flash.display.JointStyle;
   import net.flashpunk.Entity;
   import net.flashpunk.Graphic;
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   
   public class Draw
   {
      
      public static var blend:String;
      
      private static var _target:BitmapData;
      
      private static var _camera:Point;
      
      private static var _graphics:Graphics = FP.sprite.graphics;
      
      private static var _rect:Rectangle = FP.rect;
       
      
      public function Draw()
      {
         super();
      }
      
      public static function setTarget(target:BitmapData, camera:Point = null, blend:String = null) : void
      {
         _target = target;
         _camera = Boolean(camera)?camera:FP.zero;
         Draw.blend = blend;
      }
      
      public static function resetTarget() : void
      {
         _target = FP.buffer;
         _camera = FP.camera;
         Draw.blend = null;
      }
      
      public static function line(x1:int, y1:int, x2:int, y2:int, color:uint = 16777215, alpha:Number = 1.0) : void
      {
         var xx:int = 0;
         var yy:int = 0;
         var slope:Number = NaN;
         color = uint(alpha * 255) << 24 | color & 16777215;
         x1 = x1 - _camera.x;
         y1 = y1 - _camera.y;
         x2 = x2 - _camera.x;
         y2 = y2 - _camera.y;
         var screen:BitmapData = _target;
         var X:Number = Math.abs(x2 - x1);
         var Y:Number = Math.abs(y2 - y1);
         if(X == 0)
         {
            if(Y == 0)
            {
               screen.setPixel32(x1,y1,color);
               return;
            }
            yy = y2 > y1?int(1):int(-1);
            while(y1 != y2)
            {
               screen.setPixel32(x1,y1,color);
               y1 = y1 + yy;
            }
            screen.setPixel32(x2,y2,color);
            return;
         }
         if(Y == 0)
         {
            xx = x2 > x1?int(1):int(-1);
            while(x1 != x2)
            {
               screen.setPixel32(x1,y1,color);
               x1 = x1 + xx;
            }
            screen.setPixel32(x2,y2,color);
            return;
         }
         xx = x2 > x1?int(1):int(-1);
         yy = y2 > y1?int(1):int(-1);
         var c:Number = 0;
         if(X > Y)
         {
            slope = Y / X;
            c = 0.5;
            while(x1 != x2)
            {
               screen.setPixel32(x1,y1,color);
               x1 = x1 + xx;
               c = c + slope;
               if(c >= 1)
               {
                  y1 = y1 + yy;
                  c = c - 1;
               }
            }
            screen.setPixel32(x2,y2,color);
         }
         else
         {
            slope = X / Y;
            c = 0.5;
            while(y1 != y2)
            {
               screen.setPixel32(x1,y1,color);
               y1 = y1 + yy;
               c = c + slope;
               if(c >= 1)
               {
                  x1 = x1 + xx;
                  c = c - 1;
               }
            }
            screen.setPixel32(x2,y2,color);
         }
      }
      
      public static function linePlus(x1:Number, y1:Number, x2:Number, y2:Number, color:uint = 4.27819008E9, alpha:Number = 1, thick:Number = 1) : void
      {
         _graphics.clear();
         _graphics.lineStyle(thick,color,alpha,false,LineScaleMode.NONE);
         _graphics.moveTo(x1 - _camera.x,y1 - _camera.y);
         _graphics.lineTo(x2 - _camera.x,y2 - _camera.y);
         _target.draw(FP.sprite,null,null,blend);
      }
      
      public static function rect(x:Number, y:Number, width:Number, height:Number, color:uint = 16777215, alpha:Number = 1, overwrite:Boolean = false) : void
      {
         if(!overwrite && (alpha < 1 || blend))
         {
            _graphics.clear();
            _graphics.beginFill(color & 16777215,alpha);
            _graphics.drawRect(x - _camera.x,y - _camera.y,width,height);
            _target.draw(FP.sprite,null,null,blend);
            return;
         }
         color = uint(alpha * 255) << 24 | color & 16777215;
         _rect.x = x - _camera.x;
         _rect.y = y - _camera.y;
         _rect.width = width;
         _rect.height = height;
         _target.fillRect(_rect,color);
      }
      
      public static function rectPlus(x:Number, y:Number, width:Number, height:Number, color:uint = 16777215, alpha:Number = 1, fill:Boolean = true, thick:Number = 1, radius:Number = 0) : void
      {
         if(color > 16777215)
         {
            color = 16777215 & color;
         }
         _graphics.clear();
         if(fill)
         {
            _graphics.beginFill(color,alpha);
         }
         else
         {
            _graphics.lineStyle(thick,color,alpha,false,LineScaleMode.NORMAL,null,JointStyle.MITER);
         }
         if(radius <= 0)
         {
            _graphics.drawRect(x - _camera.x,y - _camera.y,width,height);
         }
         else
         {
            _graphics.drawRoundRect(x - _camera.x,y - _camera.y,width,height,radius);
         }
         _target.draw(FP.sprite,null,null,blend);
      }
      
      public static function circle(x:int, y:int, radius:int, color:uint = 16777215) : void
      {
         if(color < 4278190080)
         {
            color = 4278190080 | color;
         }
         x = x - _camera.x;
         y = y - _camera.y;
         var f:int = 1 - radius;
         var fx:int = 1;
         var fy:int = -2 * radius;
         var xx:int = 0;
         var yy:int = radius;
         _target.setPixel32(x,y + radius,color);
         _target.setPixel32(x,y - radius,color);
         _target.setPixel32(x + radius,y,color);
         _target.setPixel32(x - radius,y,color);
         while(xx < yy)
         {
            if(f >= 0)
            {
               yy--;
               fy = fy + 2;
               f = f + fy;
            }
            xx++;
            fx = fx + 2;
            f = f + fx;
            _target.setPixel32(x + xx,y + yy,color);
            _target.setPixel32(x - xx,y + yy,color);
            _target.setPixel32(x + xx,y - yy,color);
            _target.setPixel32(x - xx,y - yy,color);
            _target.setPixel32(x + yy,y + xx,color);
            _target.setPixel32(x - yy,y + xx,color);
            _target.setPixel32(x + yy,y - xx,color);
            _target.setPixel32(x - yy,y - xx,color);
         }
      }
      
      public static function circlePlus(x:Number, y:Number, radius:Number, color:uint = 16777215, alpha:Number = 1, fill:Boolean = true, thick:Number = 1) : void
      {
         _graphics.clear();
         if(fill)
         {
            _graphics.beginFill(color & 16777215,alpha);
            _graphics.drawCircle(x - _camera.x,y - _camera.y,radius);
            _graphics.endFill();
         }
         else
         {
            _graphics.lineStyle(thick,color & 16777215,alpha);
            _graphics.drawCircle(x - _camera.x,y - _camera.y,radius);
         }
         _target.draw(FP.sprite,null,null,blend);
      }
      
      public static function hitbox(e:Entity, outline:Boolean = true, color:uint = 16777215, alpha:Number = 1) : void
      {
         var x:int = 0;
         var y:int = 0;
         if(outline)
         {
            if(color < 4278190080)
            {
               color = 4278190080 | color;
            }
            x = e.x - e.originX - _camera.x;
            y = e.y - e.originY - _camera.y;
            _rect.x = x;
            _rect.y = y;
            _rect.width = e.width;
            _rect.height = 1;
            _target.fillRect(_rect,color);
            _rect.y = _rect.y + (e.height - 1);
            _target.fillRect(_rect,color);
            _rect.y = y;
            _rect.width = 1;
            _rect.height = e.height;
            _target.fillRect(_rect,color);
            _rect.x = _rect.x + (e.width - 1);
            _target.fillRect(_rect,color);
            return;
         }
         if(alpha >= 1 && !blend)
         {
            if(color < 4278190080)
            {
               color = 4278190080 | color;
            }
            _rect.x = e.x - e.originX - _camera.x;
            _rect.y = e.y - e.originY - _camera.y;
            _rect.width = e.width;
            _rect.height = e.height;
            _target.fillRect(_rect,color);
            return;
         }
         if(color > 16777215)
         {
            color = 16777215 & color;
         }
         _graphics.clear();
         _graphics.beginFill(color,alpha);
         _graphics.drawRect(e.x - e.originX - _camera.x,e.y - e.originY - _camera.y,e.width,e.height);
         _target.draw(FP.sprite,null,null,blend);
      }
      
      public static function curve(x1:Number, y1:Number, x2:Number, y2:Number, x3:Number, y3:Number, color:uint = 0, alpha:Number = 1, thick:Number = 1) : void
      {
         _graphics.clear();
         _graphics.lineStyle(thick,color & 16777215,alpha);
         _graphics.moveTo(x1 - _camera.x,y1 - _camera.y);
         _graphics.curveTo(x2 - _camera.x,y2 - _camera.y,x3 - _camera.x,y3 - _camera.y);
         _target.draw(FP.sprite,null,null,blend);
      }
      
      public static function graphic(g:Graphic, x:int = 0, y:int = 0) : void
      {
         if(g.visible)
         {
            if(g.relative)
            {
               FP.point.x = x;
               FP.point.y = y;
            }
            else
            {
               FP.point.y = 0;
               FP.point.x = 0;
            }
            FP.point2.x = _camera.x;
            FP.point2.y = _camera.y;
            g.render(_target,FP.point,FP.point2);
         }
      }
      
      public static function entity(e:Entity, x:int = 0, y:int = 0, addEntityPosition:Boolean = false) : void
      {
         if(e.visible && e.graphic)
         {
            if(addEntityPosition)
            {
               graphic(e.graphic,x + e.x,y + e.y);
            }
            else
            {
               graphic(e.graphic,x,y);
            }
         }
      }
   }
}
