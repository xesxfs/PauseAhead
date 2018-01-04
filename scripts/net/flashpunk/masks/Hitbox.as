package net.flashpunk.masks
{
   import net.flashpunk.Mask;
   
   public class Hitbox extends Mask
   {
       
      
      var _width:uint;
      
      var _height:uint;
      
      var _x:int;
      
      var _y:int;
      
      public function Hitbox(width:uint = 1, height:uint = 1, x:int = 0, y:int = 0)
      {
         super();
         this._width = width;
         this._height = height;
         this._x = x;
         this._y = y;
         _check[Mask] = this.collideMask;
         _check[Hitbox] = this.collideHitbox;
      }
      
      private function collideMask(other:Mask) : Boolean
      {
         return parent.x + this._x + this._width > other.parent.x - other.parent.originX && parent.y + this._y + this._height > other.parent.y - other.parent.originY && parent.x + this._x < other.parent.x - other.parent.originX + other.parent.width && parent.y + this._y < other.parent.y - other.parent.originY + other.parent.height;
      }
      
      private function collideHitbox(other:Hitbox) : Boolean
      {
         return parent.x + this._x + this._width > other.parent.x + other._x && parent.y + this._y + this._height > other.parent.y + other._y && parent.x + this._x < other.parent.x + other._x + other._width && parent.y + this._y < other.parent.y + other._y + other._height;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function set x(value:int) : void
      {
         if(this._x == value)
         {
            return;
         }
         this._x = value;
         if(list)
         {
            list.update();
         }
         else if(parent)
         {
            this.update();
         }
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function set y(value:int) : void
      {
         if(this._y == value)
         {
            return;
         }
         this._y = value;
         if(list)
         {
            list.update();
         }
         else if(parent)
         {
            this.update();
         }
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set width(value:int) : void
      {
         if(this._width == value)
         {
            return;
         }
         this._width = value;
         if(list)
         {
            list.update();
         }
         else if(parent)
         {
            this.update();
         }
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function set height(value:int) : void
      {
         if(this._height == value)
         {
            return;
         }
         this._height = value;
         if(list)
         {
            list.update();
         }
         else if(parent)
         {
            this.update();
         }
      }
      
      override protected function update() : void
      {
         if(list)
         {
            list.update();
         }
         else if(parent)
         {
            parent.originX = -this._x;
            parent.originY = -this._y;
            parent.width = this._width;
            parent.height = this._height;
         }
      }
   }
}
