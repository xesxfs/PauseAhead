package net.flashpunk
{
   import flash.utils.Dictionary;
   import flash.geom.Point;
   
   public class World extends Tweener
   {
      
      private static var _recycled:Dictionary = new Dictionary();
       
      
      public var visible:Boolean = true;
      
      public var camera:Point;
      
      private var _add:Vector.<net.flashpunk.Entity>;
      
      private var _remove:Vector.<net.flashpunk.Entity>;
      
      private var _recycle:Vector.<net.flashpunk.Entity>;
      
      private var _updateFirst:net.flashpunk.Entity;
      
      private var _count:uint;
      
      private var _renderFirst:Array;
      
      private var _renderLast:Array;
      
      private var _layerList:Array;
      
      private var _layerCount:Array;
      
      private var _layerSort:Boolean;
      
      private var _classCount:Dictionary;
      
      var _typeFirst:Object;
      
      private var _typeCount:Object;
      
      var _entityNames:Dictionary;
      
      public function World()
      {
         this.camera = new Point();
         this._add = new Vector.<Entity>();
         this._remove = new Vector.<Entity>();
         this._recycle = new Vector.<Entity>();
         this._renderFirst = [];
         this._renderLast = [];
         this._layerList = [];
         this._layerCount = [];
         this._classCount = new Dictionary();
         this._typeFirst = {};
         this._typeCount = {};
         this._entityNames = new Dictionary();
         super();
      }
      
      public static function clearRecycled(classType:Class) : void
      {
         var n:net.flashpunk.Entity = null;
         var e:net.flashpunk.Entity = _recycled[classType];
         while(e)
         {
            n = e._recycleNext;
            e._recycleNext = null;
            e = n;
         }
         delete _recycled[classType];
      }
      
      public static function clearRecycledAll() : void
      {
         var classType:* = null;
         for(classType in _recycled)
         {
            clearRecycled(classType as Class);
         }
      }
      
      private static function squareRects(x1:Number, y1:Number, w1:Number, h1:Number, x2:Number, y2:Number, w2:Number, h2:Number) : Number
      {
         if(x1 < x2 + w2 && x2 < x1 + w1)
         {
            if(y1 < y2 + h2 && y2 < y1 + h1)
            {
               return 0;
            }
            if(y1 > y2)
            {
               return (y1 - (y2 + h2)) * (y1 - (y2 + h2));
            }
            return (y2 - (y1 + h1)) * (y2 - (y1 + h1));
         }
         if(y1 < y2 + h2 && y2 < y1 + h1)
         {
            if(x1 > x2)
            {
               return (x1 - (x2 + w2)) * (x1 - (x2 + w2));
            }
            return (x2 - (x1 + w1)) * (x2 - (x1 + w1));
         }
         if(x1 > x2)
         {
            if(y1 > y2)
            {
               return squarePoints(x1,y1,x2 + w2,y2 + h2);
            }
            return squarePoints(x1,y1 + h1,x2 + w2,y2);
         }
         if(y1 > y2)
         {
            return squarePoints(x1 + w1,y1,x2,y2 + h2);
         }
         return squarePoints(x1 + w1,y1 + h1,x2,y2);
      }
      
      private static function squarePoints(x1:Number, y1:Number, x2:Number, y2:Number) : Number
      {
         return (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2);
      }
      
      private static function squarePointRect(px:Number, py:Number, rx:Number, ry:Number, rw:Number, rh:Number) : Number
      {
         if(px >= rx && px <= rx + rw)
         {
            if(py >= ry && py <= ry + rh)
            {
               return 0;
            }
            if(py > ry)
            {
               return (py - (ry + rh)) * (py - (ry + rh));
            }
            return (ry - py) * (ry - py);
         }
         if(py >= ry && py <= ry + rh)
         {
            if(px > rx)
            {
               return (px - (rx + rw)) * (px - (rx + rw));
            }
            return (rx - px) * (rx - px);
         }
         if(px > rx)
         {
            if(py > ry)
            {
               return squarePoints(px,py,rx + rw,ry + rh);
            }
            return squarePoints(px,py,rx + rw,ry);
         }
         if(py > ry)
         {
            return squarePoints(px,py,rx,ry + rh);
         }
         return squarePoints(px,py,rx,ry);
      }
      
      public function begin() : void
      {
      }
      
      public function end() : void
      {
      }
      
      override public function update() : void
      {
         var e:net.flashpunk.Entity = this._updateFirst;
         while(e)
         {
            if(e.active)
            {
               if(e._tween)
               {
                  e.updateTweens();
               }
               e.update();
            }
            if(e._graphic && e._graphic.active)
            {
               e._graphic.update();
            }
            e = e._updateNext;
         }
      }
      
      public function render() : void
      {
         var e:net.flashpunk.Entity = null;
         var i:int = this._layerList.length;
         while(i--)
         {
            e = this._renderLast[this._layerList[i]];
            while(e)
            {
               if(e.visible)
               {
                  e.render();
               }
               e = e._renderPrev;
            }
         }
      }
      
      public function focusGained() : void
      {
      }
      
      public function focusLost() : void
      {
      }
      
      public function get mouseX() : int
      {
         return FP.screen.mouseX + this.camera.x;
      }
      
      public function get mouseY() : int
      {
         return FP.screen.mouseY + this.camera.y;
      }
      
      public function add(e:net.flashpunk.Entity) : net.flashpunk.Entity
      {
         this._add[this._add.length] = e;
         return e;
      }
      
      public function remove(e:net.flashpunk.Entity) : net.flashpunk.Entity
      {
         this._remove[this._remove.length] = e;
         return e;
      }
      
      public function removeAll() : void
      {
         var e:net.flashpunk.Entity = this._updateFirst;
         while(e)
         {
            this._remove[this._remove.length] = e;
            e = e._updateNext;
         }
      }
      
      public function addList(... list) : void
      {
         var e:net.flashpunk.Entity = null;
         if(list[0] is Array || list[0] is Vector.<*>)
         {
            for each(e in list[0])
            {
               this.add(e);
            }
            return;
         }
         for each(e in list)
         {
            this.add(e);
         }
      }
      
      public function removeList(... list) : void
      {
         var e:net.flashpunk.Entity = null;
         if(list[0] is Array || list[0] is Vector.<*>)
         {
            for each(e in list[0])
            {
               this.remove(e);
            }
            return;
         }
         for each(e in list)
         {
            this.remove(e);
         }
      }
      
      public function addGraphic(graphic:Graphic, layer:int = 0, x:int = 0, y:int = 0) : net.flashpunk.Entity
      {
         var e:net.flashpunk.Entity = new net.flashpunk.Entity(x,y,graphic);
         if(layer != 0)
         {
            e.layer = layer;
         }
         e.active = false;
         return this.add(e);
      }
      
      public function addMask(mask:Mask, type:String, x:int = 0, y:int = 0) : net.flashpunk.Entity
      {
         var e:net.flashpunk.Entity = new net.flashpunk.Entity(x,y,null,mask);
         if(type)
         {
            e.type = type;
         }
         e.visible = false;
         e.active = false;
         return this.add(e);
      }
      
      public function create(classType:Class, addToWorld:Boolean = true) : net.flashpunk.Entity
      {
         var e:net.flashpunk.Entity = _recycled[classType];
         if(e)
         {
            _recycled[classType] = e._recycleNext;
            e._recycleNext = null;
         }
         else
         {
            e = new classType();
         }
         if(addToWorld)
         {
            return this.add(e);
         }
         return e;
      }
      
      public function recycle(e:net.flashpunk.Entity) : net.flashpunk.Entity
      {
         this._recycle[this._recycle.length] = e;
         return this.remove(e);
      }
      
      public function bringToFront(e:net.flashpunk.Entity) : Boolean
      {
         if(e._world !== this || !e._renderPrev)
         {
            return false;
         }
         e._renderPrev._renderNext = e._renderNext;
         if(e._renderNext)
         {
            e._renderNext._renderPrev = e._renderPrev;
         }
         else
         {
            this._renderLast[e._layer] = e._renderPrev;
         }
         e._renderNext = this._renderFirst[e._layer];
         e._renderNext._renderPrev = e;
         this._renderFirst[e._layer] = e;
         e._renderPrev = null;
         return true;
      }
      
      public function sendToBack(e:net.flashpunk.Entity) : Boolean
      {
         if(e._world !== this || !e._renderNext)
         {
            return false;
         }
         e._renderNext._renderPrev = e._renderPrev;
         if(e._renderPrev)
         {
            e._renderPrev._renderNext = e._renderNext;
         }
         else
         {
            this._renderFirst[e._layer] = e._renderNext;
         }
         e._renderPrev = this._renderLast[e._layer];
         e._renderPrev._renderNext = e;
         this._renderLast[e._layer] = e;
         e._renderNext = null;
         return true;
      }
      
      public function bringForward(e:net.flashpunk.Entity) : Boolean
      {
         if(e._world !== this || !e._renderPrev)
         {
            return false;
         }
         e._renderPrev._renderNext = e._renderNext;
         if(e._renderNext)
         {
            e._renderNext._renderPrev = e._renderPrev;
         }
         else
         {
            this._renderLast[e._layer] = e._renderPrev;
         }
         e._renderNext = e._renderPrev;
         e._renderPrev = e._renderPrev._renderPrev;
         e._renderNext._renderPrev = e;
         if(e._renderPrev)
         {
            e._renderPrev._renderNext = e;
         }
         else
         {
            this._renderFirst[e._layer] = e;
         }
         return true;
      }
      
      public function sendBackward(e:net.flashpunk.Entity) : Boolean
      {
         if(e._world !== this || !e._renderNext)
         {
            return false;
         }
         e._renderNext._renderPrev = e._renderPrev;
         if(e._renderPrev)
         {
            e._renderPrev._renderNext = e._renderNext;
         }
         else
         {
            this._renderFirst[e._layer] = e._renderNext;
         }
         e._renderPrev = e._renderNext;
         e._renderNext = e._renderNext._renderNext;
         e._renderPrev._renderNext = e;
         if(e._renderNext)
         {
            e._renderNext._renderPrev = e;
         }
         else
         {
            this._renderLast[e._layer] = e;
         }
         return true;
      }
      
      public function isAtFront(e:net.flashpunk.Entity) : Boolean
      {
         return e._renderPrev == null;
      }
      
      public function isAtBack(e:net.flashpunk.Entity) : Boolean
      {
         return e._renderNext == null;
      }
      
      public function collideRect(type:String, rX:Number, rY:Number, rWidth:Number, rHeight:Number) : net.flashpunk.Entity
      {
         var e:net.flashpunk.Entity = this._typeFirst[type];
         while(e)
         {
            if(e.collideRect(e.x,e.y,rX,rY,rWidth,rHeight))
            {
               return e;
            }
            e = e._typeNext;
         }
         return null;
      }
      
      public function collidePoint(type:String, pX:Number, pY:Number) : net.flashpunk.Entity
      {
         var e:net.flashpunk.Entity = this._typeFirst[type];
         while(e)
         {
            if(e.collidePoint(e.x,e.y,pX,pY))
            {
               return e;
            }
            e = e._typeNext;
         }
         return null;
      }
      
      public function collideLine(type:String, fromX:int, fromY:int, toX:int, toY:int, precision:uint = 1, p:Point = null) : net.flashpunk.Entity
      {
         var e:net.flashpunk.Entity = null;
         if(precision < 1)
         {
            precision = 1;
         }
         if(FP.distance(fromX,fromY,toX,toY) < precision)
         {
            if(p)
            {
               if(fromX == toX && fromY == toY)
               {
                  p.x = toX;
                  p.y = toY;
                  return this.collidePoint(type,toX,toY);
               }
               return this.collideLine(type,fromX,fromY,toX,toY,1,p);
            }
            return this.collidePoint(type,fromX,toY);
         }
         var xDelta:int = Math.abs(toX - fromX);
         var yDelta:int = Math.abs(toY - fromY);
         var xSign:Number = toX > fromX?Number(precision):Number(-precision);
         var ySign:Number = toY > fromY?Number(precision):Number(-precision);
         var x:Number = fromX;
         var y:Number = fromY;
         if(xDelta > yDelta)
         {
            ySign = ySign * (yDelta / xDelta);
            if(xSign > 0)
            {
               while(x < toX)
               {
                  if(e = this.collidePoint(type,x,y))
                  {
                     if(!p)
                     {
                        return e;
                     }
                     if(precision < 2)
                     {
                        p.x = x - xSign;
                        p.y = y - ySign;
                        return e;
                     }
                     return this.collideLine(type,x - xSign,y - ySign,toX,toY,1,p);
                  }
                  x = x + xSign;
                  y = y + ySign;
               }
            }
            else
            {
               while(x > toX)
               {
                  if(e = this.collidePoint(type,x,y))
                  {
                     if(!p)
                     {
                        return e;
                     }
                     if(precision < 2)
                     {
                        p.x = x - xSign;
                        p.y = y - ySign;
                        return e;
                     }
                     return this.collideLine(type,x - xSign,y - ySign,toX,toY,1,p);
                  }
                  x = x + xSign;
                  y = y + ySign;
               }
            }
         }
         else
         {
            xSign = xSign * (xDelta / yDelta);
            if(ySign > 0)
            {
               while(y < toY)
               {
                  if(e = this.collidePoint(type,x,y))
                  {
                     if(!p)
                     {
                        return e;
                     }
                     if(precision < 2)
                     {
                        p.x = x - xSign;
                        p.y = y - ySign;
                        return e;
                     }
                     return this.collideLine(type,x - xSign,y - ySign,toX,toY,1,p);
                  }
                  x = x + xSign;
                  y = y + ySign;
               }
            }
            else
            {
               while(y > toY)
               {
                  if(e = this.collidePoint(type,x,y))
                  {
                     if(!p)
                     {
                        return e;
                     }
                     if(precision < 2)
                     {
                        p.x = x - xSign;
                        p.y = y - ySign;
                        return e;
                     }
                     return this.collideLine(type,x - xSign,y - ySign,toX,toY,1,p);
                  }
                  x = x + xSign;
                  y = y + ySign;
               }
            }
         }
         if(precision > 1)
         {
            if(!p)
            {
               return this.collidePoint(type,toX,toY);
            }
            if(this.collidePoint(type,toX,toY))
            {
               return this.collideLine(type,x - xSign,y - ySign,toX,toY,1,p);
            }
         }
         if(p)
         {
            p.x = toX;
            p.y = toY;
         }
         return null;
      }
      
      public function collideRectInto(type:String, rX:Number, rY:Number, rWidth:Number, rHeight:Number, into:Object) : void
      {
         var e:net.flashpunk.Entity = null;
         var n:uint = 0;
         if(into is Array || into is Vector.<*>)
         {
            e = this._typeFirst[type];
            n = into.length;
            while(e)
            {
               if(e.collideRect(e.x,e.y,rX,rY,rWidth,rHeight))
               {
                  into[n++] = e;
               }
               e = e._typeNext;
            }
         }
      }
      
      public function collidePointInto(type:String, pX:Number, pY:Number, into:Object) : void
      {
         var e:net.flashpunk.Entity = null;
         var n:uint = 0;
         if(into is Array || into is Vector.<*>)
         {
            e = this._typeFirst[type];
            n = into.length;
            while(e)
            {
               if(e.collidePoint(e.x,e.y,pX,pY))
               {
                  into[n++] = e;
               }
               e = e._typeNext;
            }
         }
      }
      
      public function nearestToRect(type:String, x:Number, y:Number, width:Number, height:Number, ignore:net.flashpunk.Entity = null) : net.flashpunk.Entity
      {
         var near:net.flashpunk.Entity = null;
         var dist:Number = NaN;
         var n:net.flashpunk.Entity = this._typeFirst[type];
         var nearDist:Number = Number.MAX_VALUE;
         while(n)
         {
            if(n != ignore)
            {
               dist = squareRects(x,y,width,height,n.x - n.originX,n.y - n.originY,n.width,n.height);
               if(dist < nearDist)
               {
                  nearDist = dist;
                  near = n;
               }
            }
            n = n._typeNext;
         }
         return near;
      }
      
      public function nearestToEntity(type:String, e:net.flashpunk.Entity, useHitboxes:Boolean = false) : net.flashpunk.Entity
      {
         var near:net.flashpunk.Entity = null;
         var dist:Number = NaN;
         if(useHitboxes)
         {
            return this.nearestToRect(type,e.x - e.originX,e.y - e.originY,e.width,e.height);
         }
         var n:net.flashpunk.Entity = this._typeFirst[type];
         var nearDist:Number = Number.MAX_VALUE;
         var x:Number = e.x - e.originX;
         var y:Number = e.y - e.originY;
         while(n)
         {
            if(n != e)
            {
               dist = (x - n.x) * (x - n.x) + (y - n.y) * (y - n.y);
               if(dist < nearDist)
               {
                  nearDist = dist;
                  near = n;
               }
            }
            n = n._typeNext;
         }
         return near;
      }
      
      public function nearestToPoint(type:String, x:Number, y:Number, useHitboxes:Boolean = false) : net.flashpunk.Entity
      {
         var near:net.flashpunk.Entity = null;
         var dist:Number = NaN;
         var n:net.flashpunk.Entity = this._typeFirst[type];
         var nearDist:Number = Number.MAX_VALUE;
         if(useHitboxes)
         {
            while(n)
            {
               dist = squarePointRect(x,y,n.x - n.originX,n.y - n.originY,n.width,n.height);
               if(dist < nearDist)
               {
                  nearDist = dist;
                  near = n;
               }
               n = n._typeNext;
            }
            return near;
         }
         while(n)
         {
            dist = (x - n.x) * (x - n.x) + (y - n.y) * (y - n.y);
            if(dist < nearDist)
            {
               nearDist = dist;
               near = n;
            }
            n = n._typeNext;
         }
         return near;
      }
      
      public function get count() : uint
      {
         return this._count;
      }
      
      public function typeCount(type:String) : uint
      {
         return this._typeCount[type] as uint;
      }
      
      public function classCount(c:Class) : uint
      {
         return this._classCount[c] as uint;
      }
      
      public function layerCount(layer:int) : uint
      {
         return this._layerCount[layer] as uint;
      }
      
      public function get first() : net.flashpunk.Entity
      {
         return this._updateFirst;
      }
      
      public function get layers() : uint
      {
         return this._layerList.length;
      }
      
      public function typeFirst(type:String) : net.flashpunk.Entity
      {
         if(!this._updateFirst)
         {
            return null;
         }
         return this._typeFirst[type] as Entity;
      }
      
      public function classFirst(c:Class) : net.flashpunk.Entity
      {
         if(!this._updateFirst)
         {
            return null;
         }
         var e:net.flashpunk.Entity = this._updateFirst;
         while(e)
         {
            if(e is c)
            {
               return e;
            }
            e = e._updateNext;
         }
         return null;
      }
      
      public function layerFirst(layer:int) : net.flashpunk.Entity
      {
         if(!this._updateFirst)
         {
            return null;
         }
         return this._renderFirst[layer] as Entity;
      }
      
      public function layerLast(layer:int) : net.flashpunk.Entity
      {
         if(!this._updateFirst)
         {
            return null;
         }
         return this._renderLast[layer] as Entity;
      }
      
      public function get farthest() : net.flashpunk.Entity
      {
         if(!this._updateFirst)
         {
            return null;
         }
         return this._renderLast[this._layerList[this._layerList.length - 1] as int] as Entity;
      }
      
      public function get nearest() : net.flashpunk.Entity
      {
         if(!this._updateFirst)
         {
            return null;
         }
         return this._renderFirst[this._layerList[0] as int] as Entity;
      }
      
      public function get layerFarthest() : int
      {
         if(!this._updateFirst)
         {
            return 0;
         }
         return this._layerList[this._layerList.length - 1] as int;
      }
      
      public function get layerNearest() : int
      {
         if(!this._updateFirst)
         {
            return 0;
         }
         return this._layerList[0] as int;
      }
      
      public function get uniqueTypes() : uint
      {
         var type:* = null;
         var i:uint = 0;
         for(type in this._typeCount)
         {
            i++;
         }
         return i;
      }
      
      public function getType(type:String, into:Object) : void
      {
         var e:net.flashpunk.Entity = null;
         var n:uint = 0;
         if(into is Array || into is Vector.<*>)
         {
            e = this._typeFirst[type];
            n = into.length;
            while(e)
            {
               into[n++] = e;
               e = e._typeNext;
            }
         }
      }
      
      public function getClass(c:Class, into:Object) : void
      {
         var e:net.flashpunk.Entity = null;
         var n:uint = 0;
         if(into is Array || into is Vector.<*>)
         {
            e = this._updateFirst;
            n = into.length;
            while(e)
            {
               if(e is c)
               {
                  into[n++] = e;
               }
               e = e._updateNext;
            }
         }
      }
      
      public function getLayer(layer:int, into:Object) : void
      {
         var e:net.flashpunk.Entity = null;
         var n:uint = 0;
         if(into is Array || into is Vector.<*>)
         {
            e = this._renderLast[layer];
            n = into.length;
            while(e)
            {
               into[n++] = e;
               e = e._renderPrev;
            }
         }
      }
      
      public function getAll(into:Object) : void
      {
         var e:net.flashpunk.Entity = null;
         var n:uint = 0;
         if(into is Array || into is Vector.<*>)
         {
            e = this._updateFirst;
            n = into.length;
            while(e)
            {
               into[n++] = e;
               e = e._updateNext;
            }
         }
      }
      
      public function getInstance(name:String) : *
      {
         return this._entityNames[name];
      }
      
      public function updateLists() : void
      {
         var e:net.flashpunk.Entity = null;
         if(this._remove.length)
         {
            for each(e in this._remove)
            {
               if(!e._world)
               {
                  if(this._add.indexOf(e) >= 0)
                  {
                     this._add.splice(this._add.indexOf(e),1);
                  }
               }
               else if(e._world === this)
               {
                  e.removed();
                  e._world = null;
                  this.removeUpdate(e);
                  this.removeRender(e);
                  if(e._type)
                  {
                     this.removeType(e);
                  }
                  if(e._name)
                  {
                     this.unregisterName(e);
                  }
                  if(e.autoClear && e._tween)
                  {
                     e.clearTweens();
                  }
               }
            }
            this._remove.length = 0;
         }
         if(this._add.length)
         {
            for each(e in this._add)
            {
               if(!e._world)
               {
                  this.addUpdate(e);
                  this.addRender(e);
                  if(e._type)
                  {
                     this.addType(e);
                  }
                  if(e._name)
                  {
                     this.registerName(e);
                  }
                  e._world = this;
                  e.added();
               }
            }
            this._add.length = 0;
         }
         if(this._recycle.length)
         {
            for each(e in this._recycle)
            {
               if(!(e._world || e._recycleNext))
               {
                  e._recycleNext = _recycled[e._class];
                  _recycled[e._class] = e;
               }
            }
            this._recycle.length = 0;
         }
         if(this._layerSort)
         {
            if(this._layerList.length > 1)
            {
               FP.sort(this._layerList,true);
            }
            this._layerSort = false;
         }
      }
      
      private function addUpdate(e:net.flashpunk.Entity) : void
      {
         if(this._updateFirst)
         {
            this._updateFirst._updatePrev = e;
            e._updateNext = this._updateFirst;
         }
         else
         {
            e._updateNext = null;
         }
         e._updatePrev = null;
         this._updateFirst = e;
         this._count++;
         if(!this._classCount[e._class])
         {
            this._classCount[e._class] = 0;
         }
         this._classCount[e._class]++;
      }
      
      private function removeUpdate(e:net.flashpunk.Entity) : void
      {
         if(this._updateFirst == e)
         {
            this._updateFirst = e._updateNext;
         }
         if(e._updateNext)
         {
            e._updateNext._updatePrev = e._updatePrev;
         }
         if(e._updatePrev)
         {
            e._updatePrev._updateNext = e._updateNext;
         }
         e._updateNext = e._updatePrev = null;
         this._count--;
         this._classCount[e._class]--;
      }
      
      function addRender(e:net.flashpunk.Entity) : void
      {
         var f:net.flashpunk.Entity = this._renderFirst[e._layer];
         if(f)
         {
            e._renderNext = f;
            f._renderPrev = e;
            this._layerCount[e._layer]++;
         }
         else
         {
            this._renderLast[e._layer] = e;
            this._layerList[this._layerList.length] = e._layer;
            this._layerSort = true;
            e._renderNext = null;
            this._layerCount[e._layer] = 1;
         }
         this._renderFirst[e._layer] = e;
         e._renderPrev = null;
      }
      
      function removeRender(e:net.flashpunk.Entity) : void
      {
         if(e._renderNext)
         {
            e._renderNext._renderPrev = e._renderPrev;
         }
         else
         {
            this._renderLast[e._layer] = e._renderPrev;
         }
         if(e._renderPrev)
         {
            e._renderPrev._renderNext = e._renderNext;
         }
         else
         {
            this._renderFirst[e._layer] = e._renderNext;
            if(!e._renderNext)
            {
               if(this._layerList.length > 1)
               {
                  this._layerList[this._layerList.indexOf(e._layer)] = this._layerList[this._layerList.length - 1];
                  this._layerSort = true;
               }
               this._layerList.length--;
            }
         }
         this._layerCount[e._layer]--;
         e._renderNext = e._renderPrev = null;
      }
      
      function addType(e:net.flashpunk.Entity) : void
      {
         if(this._typeFirst[e._type])
         {
            this._typeFirst[e._type]._typePrev = e;
            e._typeNext = this._typeFirst[e._type];
            this._typeCount[e._type]++;
         }
         else
         {
            e._typeNext = null;
            this._typeCount[e._type] = 1;
         }
         e._typePrev = null;
         this._typeFirst[e._type] = e;
      }
      
      function removeType(e:net.flashpunk.Entity) : void
      {
         if(this._typeFirst[e._type] == e)
         {
            this._typeFirst[e._type] = e._typeNext;
         }
         if(e._typeNext)
         {
            e._typeNext._typePrev = e._typePrev;
         }
         if(e._typePrev)
         {
            e._typePrev._typeNext = e._typeNext;
         }
         e._typeNext = e._typePrev = null;
         this._typeCount[e._type]--;
      }
      
      function registerName(e:net.flashpunk.Entity) : void
      {
         this._entityNames[e._name] = e;
      }
      
      function unregisterName(e:net.flashpunk.Entity) : void
      {
         if(this._entityNames[e._name] == e)
         {
            delete this._entityNames[e._name];
         }
      }
   }
}
