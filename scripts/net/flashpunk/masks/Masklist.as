package net.flashpunk.masks
{
   import flash.display.Graphics;
   import net.flashpunk.*;
   
   public class Masklist extends Hitbox
   {
       
      
      private var _masks:Vector.<Mask>;
      
      private var _temp:Vector.<Mask>;
      
      private var _count:uint;
      
      public function Masklist(... mask)
      {
         var m:Mask = null;
         this._masks = new Vector.<Mask>();
         this._temp = new Vector.<Mask>();
         super();
         for each(m in mask)
         {
            this.add(m);
         }
      }
      
      override public function collide(mask:Mask) : Boolean
      {
         var m:Mask = null;
         for each(m in this._masks)
         {
            if(m.collide(mask))
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function collideMasklist(other:Masklist) : Boolean
      {
         var a:Mask = null;
         var b:Mask = null;
         for each(a in this._masks)
         {
            for each(b in other._masks)
            {
               if(a.collide(b))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function add(mask:Mask) : Mask
      {
         var _loc2_:* = this._count++;
         this._masks[_loc2_] = mask;
         mask.list = this;
         mask.parent = parent;
         this.update();
         return mask;
      }
      
      public function remove(mask:Mask) : Mask
      {
         var m:Mask = null;
         var temp:Vector.<Mask> = null;
         if(this._masks.indexOf(mask) < 0)
         {
            return mask;
         }
         this._temp.length = 0;
         for each(m in this._masks)
         {
            if(m == mask)
            {
               mask.list = null;
               mask.parent = null;
               this._count--;
               this.update();
            }
            else
            {
               this._temp[this._temp.length] = m;
            }
         }
         temp = this._masks;
         this._masks = this._temp;
         this._temp = temp;
         return mask;
      }
      
      public function removeAt(index:uint = 0) : void
      {
         this._temp.length = 0;
         var i:int = this._masks.length;
         index = index % i;
         while(i--)
         {
            if(i == index)
            {
               this._masks[index].list = null;
               this._count--;
               this.update();
            }
            else
            {
               this._temp[this._temp.length] = this._masks[index];
            }
         }
         var temp:Vector.<Mask> = this._masks;
         this._masks = this._temp;
         this._temp = temp;
      }
      
      public function removeAll() : void
      {
         var m:Mask = null;
         for each(m in this._masks)
         {
            m.list = null;
         }
         this._masks.length = this._temp.length = this._count = 0;
         this.update();
      }
      
      public function getMask(index:uint = 0) : Mask
      {
         return this._masks[index % this._masks.length];
      }
      
      override public function assignTo(parent:Entity) : void
      {
         var m:Mask = null;
         for each(m in this._masks)
         {
            m.parent = parent;
         }
         super.assignTo(parent);
      }
      
      override protected function update() : void
      {
         var t:int = 0;
         var l:int = 0;
         var r:int = 0;
         var b:int = 0;
         var h:Hitbox = null;
         var i:int = this._count;
         while(i--)
         {
            if(h = this._masks[i] as Hitbox)
            {
               if(h._x < l)
               {
                  l = h._x;
               }
               if(h._y < t)
               {
                  t = h._y;
               }
               if(h._x + h._width > r)
               {
                  r = h._x + h._width;
               }
               if(h._y + h._height > b)
               {
                  b = h._y + h._height;
               }
            }
         }
         _x = l;
         _y = t;
         _width = r - l;
         _height = b - t;
         super.update();
      }
      
      override public function renderDebug(g:Graphics) : void
      {
         var m:Mask = null;
         for each(m in this._masks)
         {
            m.renderDebug(g);
         }
      }
      
      public function get count() : uint
      {
         return this._count;
      }
   }
}
