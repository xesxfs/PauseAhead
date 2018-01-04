package net.flashpunk
{
   public class Tween
   {
      
      public static const PERSIST:uint = 0;
      
      public static const LOOPING:uint = 1;
      
      public static const ONESHOT:uint = 2;
       
      
      public var active:Boolean;
      
      public var complete:Function;
      
      private var _type:uint;
      
      protected var _ease:Function;
      
      protected var _t:Number = 0;
      
      protected var _time:Number;
      
      protected var _target:Number;
      
      var _finish:Boolean;
      
      var _parent:Tweener;
      
      var _prev:Tween;
      
      var _next:Tween;
      
      public function Tween(duration:Number, type:uint = 0, complete:Function = null, ease:Function = null)
      {
         super();
         this._target = duration;
         this._type = type;
         this.complete = complete;
         this._ease = ease;
      }
      
      public function update() : void
      {
         this._time = this._time + (!!FP.timeInFrames?1:FP.elapsed);
         this._t = this._time / this._target;
         if(this._ease != null && this._t > 0 && this._t < 1)
         {
            this._t = this._ease(this._t);
         }
         if(this._time >= this._target)
         {
            this._t = 1;
            this._finish = true;
         }
      }
      
      public function start() : void
      {
         this._time = 0;
         if(this._target == 0)
         {
            this.active = false;
            return;
         }
         this.active = true;
      }
      
      public function cancel() : void
      {
         this.active = false;
         if(this._parent)
         {
            this._parent.removeTween(this);
         }
      }
      
      function finish() : void
      {
         switch(this._type)
         {
            case PERSIST:
               this._time = this._target;
               this.active = false;
               break;
            case LOOPING:
               this._time = this._time % this._target;
               this._t = this._time / this._target;
               if(this._ease != null && this._t > 0 && this._t < 1)
               {
                  this._t = this._ease(this._t);
               }
               this.start();
               break;
            case ONESHOT:
               this._time = this._target;
               this.active = false;
               this._parent.removeTween(this);
         }
         this._finish = false;
         if(this.complete != null)
         {
            this.complete();
         }
      }
      
      public function get percent() : Number
      {
         return this._time / this._target;
      }
      
      public function set percent(value:Number) : void
      {
         this._time = this._target * value;
      }
      
      public function get scale() : Number
      {
         return this._t;
      }
   }
}
