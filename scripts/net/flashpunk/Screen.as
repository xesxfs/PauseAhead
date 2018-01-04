package net.flashpunk
{
   import net.flashpunk.graphics.Image;
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.geom.Matrix;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   
   public class Screen
   {
       
      
      private var _sprite:Sprite;
      
      private var _bitmap:Vector.<Bitmap>;
      
      private var _current:int = 0;
      
      private var _matrix:Matrix;
      
      private var _x:int;
      
      private var _y:int;
      
      private var _width:uint;
      
      private var _height:uint;
      
      private var _originX:int;
      
      private var _originY:int;
      
      private var _scaleX:Number = 1;
      
      private var _scaleY:Number = 1;
      
      private var _scale:Number = 1;
      
      private var _angle:Number = 0;
      
      private var _color:uint = 4.280295456E9;
      
      public function Screen()
      {
         this._sprite = new Sprite();
         this._bitmap = new Vector.<Bitmap>(2);
         this._matrix = new Matrix();
         super();
         this._bitmap[0] = new Bitmap(new BitmapData(FP.width,FP.height,false,this._color),PixelSnapping.NEVER);
         this._bitmap[1] = new Bitmap(new BitmapData(FP.width,FP.height,false,this._color),PixelSnapping.NEVER);
         FP.engine.addChild(this._sprite);
         this._sprite.addChild(this._bitmap[0]).visible = true;
         this._sprite.addChild(this._bitmap[1]).visible = false;
         FP.buffer = this._bitmap[0].bitmapData;
         this._width = FP.width;
         this._height = FP.height;
         this.update();
      }
      
      public function swap() : void
      {
         this._current = 1 - this._current;
         FP.buffer = this._bitmap[this._current].bitmapData;
      }
      
      public function refresh() : void
      {
         FP.buffer.fillRect(FP.bounds,this._color);
      }
      
      public function redraw() : void
      {
         this._bitmap[this._current].visible = true;
         this._bitmap[1 - this._current].visible = false;
      }
      
      public function update() : void
      {
         this._matrix.c = 0;
         this._matrix.b = 0;
         this._matrix.a = this._scaleX * this._scale;
         this._matrix.d = this._scaleY * this._scale;
         this._matrix.tx = -this._originX * this._matrix.a;
         this._matrix.ty = -this._originY * this._matrix.d;
         if(this._angle != 0)
         {
            this._matrix.rotate(this._angle);
         }
         this._matrix.tx = this._matrix.tx + (this._originX * this._scaleX * this._scale + this._x);
         this._matrix.ty = this._matrix.ty + (this._originY * this._scaleX * this._scale + this._y);
         this._sprite.transform.matrix = this._matrix;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(value:uint) : void
      {
         this._color = 4278190080 | value;
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
         this.update();
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
         this.update();
      }
      
      public function get originX() : int
      {
         return this._originX;
      }
      
      public function set originX(value:int) : void
      {
         if(this._originX == value)
         {
            return;
         }
         this._originX = value;
         this.update();
      }
      
      public function get originY() : int
      {
         return this._originY;
      }
      
      public function set originY(value:int) : void
      {
         if(this._originY == value)
         {
            return;
         }
         this._originY = value;
         this.update();
      }
      
      public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      public function set scaleX(value:Number) : void
      {
         if(this._scaleX == value)
         {
            return;
         }
         this._scaleX = value;
         this.update();
      }
      
      public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      public function set scaleY(value:Number) : void
      {
         if(this._scaleY == value)
         {
            return;
         }
         this._scaleY = value;
         this.update();
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      public function set scale(value:Number) : void
      {
         if(this._scale == value)
         {
            return;
         }
         this._scale = value;
         this.update();
      }
      
      public function get angle() : Number
      {
         return this._angle * FP.DEG;
      }
      
      public function set angle(value:Number) : void
      {
         if(this._angle == value * FP.RAD)
         {
            return;
         }
         this._angle = value * FP.RAD;
         this.update();
      }
      
      public function get smoothing() : Boolean
      {
         return this._bitmap[0].smoothing;
      }
      
      public function set smoothing(value:Boolean) : void
      {
         this._bitmap[0].smoothing = this._bitmap[1].smoothing = value;
      }
      
      public function get width() : uint
      {
         return this._width;
      }
      
      public function get height() : uint
      {
         return this._height;
      }
      
      public function get mouseX() : int
      {
         return (FP.stage.mouseX - this._x) / (this._scaleX * this._scale);
      }
      
      public function get mouseY() : int
      {
         return (FP.stage.mouseY - this._y) / (this._scaleY * this._scale);
      }
      
      public function capture() : Image
      {
         return new Image(this._bitmap[this._current].bitmapData.clone());
      }
   }
}
