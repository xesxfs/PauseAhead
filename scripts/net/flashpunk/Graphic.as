package net.flashpunk
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class Graphic
   {
       
      
      public var active:Boolean = false;
      
      public var visible:Boolean = true;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var scrollX:Number = 1;
      
      public var scrollY:Number = 1;
      
      public var relative:Boolean = true;
      
      var _assign:Function;
      
      protected var _point:Point;
      
      public function Graphic()
      {
         this._point = new Point();
         super();
      }
      
      public function update() : void
      {
      }
      
      public function render(target:BitmapData, point:Point, camera:Point) : void
      {
      }
      
      protected function get assign() : Function
      {
         return this._assign;
      }
      
      protected function set assign(value:Function) : void
      {
         this._assign = value;
      }
   }
}
