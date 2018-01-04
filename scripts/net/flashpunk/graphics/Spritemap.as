package net.flashpunk.graphics
{
   import net.flashpunk.FP;
   import flash.geom.Rectangle;
   
   public class Spritemap extends Image
   {
       
      
      public var complete:Boolean = true;
      
      public var callback:Function;
      
      public var rate:Number = 1;
      
      protected var _rect:Rectangle;
      
      protected var _width:uint;
      
      protected var _height:uint;
      
      private var _columns:uint;
      
      private var _rows:uint;
      
      private var _frameCount:uint;
      
      private var _anims:Object;
      
      private var _anim:net.flashpunk.graphics.Anim;
      
      private var _index:uint;
      
      protected var _frame:uint;
      
      private var _timer:Number = 0;
      
      public function Spritemap(source:*, frameWidth:uint = 0, frameHeight:uint = 0, callback:Function = null)
      {
         this._anims = {};
         this._rect = new Rectangle(0,0,frameWidth,frameHeight);
         super(source,this._rect);
         if(!frameWidth)
         {
            this._rect.width = this.source.width;
         }
         if(!frameHeight)
         {
            this._rect.height = this.source.height;
         }
         this._width = this.source.width;
         this._height = this.source.height;
         this._columns = this._width / this._rect.width;
         this._rows = this._height / this._rect.height;
         this._frameCount = this._columns * this._rows;
         this.callback = callback;
         this.updateBuffer();
         active = true;
      }
      
      override public function updateBuffer(clearBefore:Boolean = false) : void
      {
         this._rect.x = this._rect.width * (this._frame % this._columns);
         this._rect.y = this._rect.height * uint(this._frame / this._columns);
         if(_flipped)
         {
            this._rect.x = this._width - this._rect.width - this._rect.x;
         }
         super.updateBuffer(clearBefore);
      }
      
      override public function update() : void
      {
         if(this._anim && !this.complete)
         {
            this._timer = this._timer + (!!FP.timeInFrames?this._anim._frameRate:this._anim._frameRate * FP.elapsed) * this.rate;
            if(this._timer >= 1)
            {
               while(this._timer >= 1)
               {
                  this._timer--;
                  this._index++;
                  if(this._index == this._anim._frameCount)
                  {
                     if(this._anim._loop)
                     {
                        this._index = 0;
                        if(this.callback != null)
                        {
                           this.callback();
                        }
                        continue;
                     }
                     this._index = this._anim._frameCount - 1;
                     this.complete = true;
                     if(this.callback != null)
                     {
                        this.callback();
                     }
                     break;
                  }
               }
               if(this._anim)
               {
                  this._frame = uint(this._anim._frames[this._index]);
               }
               this.updateBuffer();
            }
         }
      }
      
      public function add(name:String, frames:Array, frameRate:Number = 0, loop:Boolean = true) : net.flashpunk.graphics.Anim
      {
         if(this._anims[name])
         {
            throw new Error("Cannot have multiple animations with the same name");
         }
         (this._anims[name] = new net.flashpunk.graphics.Anim(name,frames,frameRate,loop))._parent = this;
         return this._anims[name];
      }
      
      public function play(name:String = "", reset:Boolean = false, frame:int = 0) : net.flashpunk.graphics.Anim
      {
         if(!reset && this._anim && this._anim._name == name)
         {
            return this._anim;
         }
         this._anim = this._anims[name];
         if(!this._anim)
         {
            this._index = 0;
            this._frame = 0;
            this.complete = true;
            this.updateBuffer();
            return null;
         }
         this._index = 0;
         this._timer = 0;
         this._frame = uint(this._anim._frames[frame % this._anim._frameCount]);
         this.complete = false;
         this.updateBuffer();
         return this._anim;
      }
      
      public function getFrame(column:uint = 0, row:uint = 0) : uint
      {
         return row % this._rows * this._columns + column % this._columns;
      }
      
      public function setFrame(column:uint = 0, row:uint = 0) : void
      {
         this._anim = null;
         var frame:uint = row % this._rows * this._columns + column % this._columns;
         if(this._frame == frame)
         {
            return;
         }
         this._frame = frame;
         this._timer = 0;
         this.updateBuffer();
      }
      
      public function randFrame() : void
      {
         this.frame = FP.rand(this._frameCount);
      }
      
      public function setAnimFrame(name:String, index:int) : void
      {
         var frames:Array = this._anims[name]._frames;
         index = index % frames.length;
         if(index < 0)
         {
            index = index + frames.length;
         }
         this.frame = frames[index];
      }
      
      public function get frame() : int
      {
         return this._frame;
      }
      
      public function set frame(value:int) : void
      {
         this._anim = null;
         value = value % this._frameCount;
         if(value < 0)
         {
            value = this._frameCount + value;
         }
         if(this._frame == value)
         {
            return;
         }
         this._frame = value;
         this._timer = 0;
         this.updateBuffer();
      }
      
      public function get index() : uint
      {
         return Boolean(this._anim)?uint(this._index):uint(0);
      }
      
      public function set index(value:uint) : void
      {
         if(!this._anim)
         {
            return;
         }
         value = value % this._anim._frameCount;
         if(this._index == value)
         {
            return;
         }
         this._index = value;
         this._frame = uint(this._anim._frames[this._index]);
         this._timer = 0;
         this.updateBuffer();
      }
      
      public function get frameCount() : uint
      {
         return this._frameCount;
      }
      
      public function get columns() : uint
      {
         return this._columns;
      }
      
      public function get rows() : uint
      {
         return this._rows;
      }
      
      public function get currentAnim() : String
      {
         return Boolean(this._anim)?this._anim._name:"";
      }
   }
}
