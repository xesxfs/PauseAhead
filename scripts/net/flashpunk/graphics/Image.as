package net.flashpunk.graphics
{
   import net.flashpunk.Graphic;
   import flash.display.BitmapData;
   import net.flashpunk.FP;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.display.Bitmap;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   
   public class Image extends Graphic
   {
      
      public static const TINTING_MULTIPLY:Number = 0;
      
      public static const TINTING_COLORIZE:Number = 1;
      
      protected static var _flips:Object = {};
       
      
      public var angle:Number = 0;
      
      public var scale:Number = 1;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var originX:Number = 0;
      
      public var originY:Number = 0;
      
      public var blend:String;
      
      public var smooth:Boolean;
      
      protected var _locked:Boolean = false;
      
      protected var _needsClear:Boolean = false;
      
      protected var _needsUpdate:Boolean = false;
      
      protected var _source:BitmapData;
      
      protected var _sourceRect:Rectangle;
      
      protected var _buffer:BitmapData;
      
      protected var _bufferRect:Rectangle;
      
      protected var _bitmap:Bitmap;
      
      protected var _alpha:Number = 1;
      
      protected var _color:uint = 16777215;
      
      protected var _tintFactor:Number = 1.0;
      
      protected var _tintMode:Number = 0.0;
      
      protected var _tint:ColorTransform;
      
      protected var _colorTransform:ColorTransform;
      
      protected var _matrix:Matrix;
      
      protected var _drawMask:BitmapData;
      
      protected var _class:String;
      
      protected var _flipped:Boolean;
      
      protected var _flip:BitmapData;
      
      public function Image(source:*, clipRect:Rectangle = null)
      {
         this._bitmap = new Bitmap();
         this._colorTransform = new ColorTransform();
         this._matrix = FP.matrix;
         super();
         if(source is Class)
         {
            this._source = FP.getBitmap(source);
            this._class = String(source);
         }
         else if(source is BitmapData)
         {
            this._source = source;
         }
         if(!this._source)
         {
            throw new Error("Invalid source image.");
         }
         this._sourceRect = this._source.rect;
         if(clipRect)
         {
            if(!clipRect.width)
            {
               clipRect.width = this._sourceRect.width;
            }
            if(!clipRect.height)
            {
               clipRect.height = this._sourceRect.height;
            }
            this._sourceRect = clipRect;
         }
         this.createBuffer();
         this.updateBuffer();
      }
      
      public static function createRect(width:uint, height:uint, color:uint = 16777215, alpha:Number = 1) : Image
      {
         var source:BitmapData = new BitmapData(width,height,true,4294967295);
         var image:Image = new Image(source);
         image.color = color;
         image.alpha = alpha;
         return image;
      }
      
      public static function createCircle(radius:uint, color:uint = 16777215, alpha:Number = 1) : Image
      {
         FP.sprite.graphics.clear();
         FP.sprite.graphics.beginFill(16777215);
         FP.sprite.graphics.drawCircle(radius,radius,radius);
         var data:BitmapData = new BitmapData(radius * 2,radius * 2,true,0);
         data.draw(FP.sprite);
         var image:Image = new Image(data);
         image.color = color;
         image.alpha = alpha;
         return image;
      }
      
      protected function createBuffer() : void
      {
         if(this._buffer)
         {
            this._buffer.dispose();
            this._buffer = null;
         }
         this._buffer = new BitmapData(this._sourceRect.width,this._sourceRect.height,true,0);
         this._bufferRect = this._buffer.rect;
         this._bitmap.bitmapData = this._buffer;
      }
      
      override public function render(target:BitmapData, point:Point, camera:Point) : void
      {
         if(!this._buffer)
         {
            return;
         }
         _point.x = point.x + x - this.originX - camera.x * scrollX;
         _point.y = point.y + y - this.originY - camera.y * scrollY;
         if(this.angle == 0 && this.scaleX * this.scale == 1 && this.scaleY * this.scale == 1 && !this.blend)
         {
            target.copyPixels(this._buffer,this._bufferRect,_point,null,null,true);
            return;
         }
         this._matrix.c = 0;
         this._matrix.b = 0;
         this._matrix.a = this.scaleX * this.scale;
         this._matrix.d = this.scaleY * this.scale;
         this._matrix.tx = -this.originX * this._matrix.a;
         this._matrix.ty = -this.originY * this._matrix.d;
         if(this.angle != 0)
         {
            this._matrix.rotate(this.angle * FP.RAD);
         }
         this._matrix.tx = this._matrix.tx + (this.originX + _point.x);
         this._matrix.ty = this._matrix.ty + (this.originY + _point.y);
         this._bitmap.smoothing = this.smooth;
         target.draw(this._bitmap,this._matrix,null,this.blend,null,this.smooth);
      }
      
      public function updateBuffer(clearBefore:Boolean = false) : void
      {
         if(this.locked)
         {
            this._needsUpdate = true;
            if(clearBefore)
            {
               this._needsClear = true;
            }
            return;
         }
         if(!this._source)
         {
            return;
         }
         if(clearBefore)
         {
            this._buffer.fillRect(this._bufferRect,0);
         }
         this._buffer.copyPixels(this._source,this._sourceRect,FP.zero,this._drawMask,FP.zero);
         if(this._tint)
         {
            this._buffer.colorTransform(this._bufferRect,this._tint);
         }
      }
      
      public function clear() : void
      {
         this._buffer.fillRect(this._bufferRect,0);
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(value:Number) : void
      {
         value = value < 0?Number(0):value > 1?Number(1):Number(value);
         if(this._alpha == value)
         {
            return;
         }
         this._alpha = value;
         this.updateColorTransform();
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(value:uint) : void
      {
         value = value & 16777215;
         if(this._color == value)
         {
            return;
         }
         this._color = value;
         this.updateColorTransform();
      }
      
      public function get tinting() : Number
      {
         return this._tintFactor;
      }
      
      public function set tinting(value:Number) : void
      {
         if(this._tintFactor == value)
         {
            return;
         }
         this._tintFactor = value;
         this.updateColorTransform();
      }
      
      public function get tintMode() : Number
      {
         return this._tintMode;
      }
      
      public function set tintMode(value:Number) : void
      {
         if(this._tintMode == value)
         {
            return;
         }
         this._tintMode = value;
         this.updateColorTransform();
      }
      
      protected function updateColorTransform() : void
      {
         if(this._alpha == 1)
         {
            if(this._tintFactor == 0)
            {
               this._tint = null;
               return this.updateBuffer();
            }
            if(this._tintMode == TINTING_MULTIPLY && this._color == 16777215)
            {
               this._tint = null;
               return this.updateBuffer();
            }
         }
         this._tint = this._colorTransform;
         this._tint.redMultiplier = this._tintMode * (1 - this._tintFactor) + (1 - this._tintMode) * (this._tintFactor * (Number(this._color >> 16 & 255) / 255 - 1) + 1);
         this._tint.greenMultiplier = this._tintMode * (1 - this._tintFactor) + (1 - this._tintMode) * (this._tintFactor * (Number(this._color >> 8 & 255) / 255 - 1) + 1);
         this._tint.blueMultiplier = this._tintMode * (1 - this._tintFactor) + (1 - this._tintMode) * (this._tintFactor * (Number(this._color & 255) / 255 - 1) + 1);
         this._tint.redOffset = (this._color >> 16 & 255) * this._tintFactor * this._tintMode;
         this._tint.greenOffset = (this._color >> 8 & 255) * this._tintFactor * this._tintMode;
         this._tint.blueOffset = (this._color & 255) * this._tintFactor * this._tintMode;
         this._tint.alphaMultiplier = this._alpha;
         this.updateBuffer();
      }
      
      public function get flipped() : Boolean
      {
         return this._flipped;
      }
      
      public function set flipped(value:Boolean) : void
      {
         if(this._flipped == value)
         {
            return;
         }
         this._flipped = value;
         var temp:BitmapData = this._source;
         if(this._flip)
         {
            this._source = this._flip;
            this._flip = temp;
            this.updateBuffer();
         }
         if(this._class && _flips[this._class])
         {
            this._source = _flips[this._class];
            this._flip = temp;
            this.updateBuffer();
         }
         this._source = new BitmapData(this._source.width,this._source.height,true,0);
         this._flip = temp;
         FP.matrix.identity();
         FP.matrix.a = -1;
         FP.matrix.tx = this._source.width;
         this._source.draw(temp,FP.matrix);
         if(this._class)
         {
            _flips[this._class] = this._source;
         }
         this.updateBuffer();
      }
      
      public function get drawMask() : BitmapData
      {
         return this._drawMask;
      }
      
      public function set drawMask(value:BitmapData) : void
      {
         this._drawMask = value;
         this.updateBuffer(true);
      }
      
      public function centerOrigin() : void
      {
         this.originX = this._bufferRect.width / 2;
         this.originY = this._bufferRect.height / 2;
      }
      
      public function centerOO() : void
      {
         this.centerOrigin();
      }
      
      public function get width() : uint
      {
         return this._bufferRect.width;
      }
      
      public function get height() : uint
      {
         return this._bufferRect.height;
      }
      
      public function get scaledWidth() : uint
      {
         return this._bufferRect.width * this.scaleX * this.scale;
      }
      
      public function get scaledHeight() : uint
      {
         return this._bufferRect.height * this.scaleY * this.scale;
      }
      
      public function get clipRect() : Rectangle
      {
         return this._sourceRect;
      }
      
      protected function get source() : BitmapData
      {
         return this._source;
      }
      
      public function lock() : void
      {
         this._locked = true;
      }
      
      public function unlock() : void
      {
         this._locked = false;
         if(this._needsUpdate)
         {
            this.updateBuffer(this._needsClear);
         }
         this._needsClear = false;
         this._needsUpdate = false;
      }
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
   }
}
