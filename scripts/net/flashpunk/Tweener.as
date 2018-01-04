package net.flashpunk
{
   public class Tweener
   {
       
      
      public const PERSIST:uint = 0;
      
      public const LOOPING:uint = 1;
      
      public const ONESHOT:uint = 2;
      
      public var active:Boolean = true;
      
      public var autoClear:Boolean = false;
      
      var _tween:Tween;
      
      public function Tweener()
      {
         super();
      }
      
      public function update() : void
      {
      }
      
      public function addTween(t:Tween, start:Boolean = false) : Tween
      {
         if(t._parent)
         {
            throw new Error("Cannot add a Tween object more than once.");
         }
         t._parent = this;
         t._next = this._tween;
         if(this._tween)
         {
            this._tween._prev = t;
         }
         this._tween = t;
         if(start)
         {
            this._tween.start();
         }
         return t;
      }
      
      public function removeTween(t:Tween) : Tween
      {
         if(t._parent != this)
         {
            throw new Error("Core object does not contain Tween.");
         }
         if(t._next)
         {
            t._next._prev = t._prev;
         }
         if(t._prev)
         {
            t._prev._next = t._next;
         }
         else
         {
            this._tween = t._next;
         }
         t._prev = null;
         t._next = null;
         t._parent = null;
         t.active = false;
         return t;
      }
      
      public function clearTweens() : void
      {
         var n:Tween = null;
         var t:Tween = this._tween;
         while(t)
         {
            n = t._next;
            this.removeTween(t);
            t = n;
         }
      }
      
      public function updateTweens() : void
      {
         var n:Tween = null;
         var t:Tween = this._tween;
         while(t)
         {
            n = t._next;
            if(t.active)
            {
               t.update();
               if(t._finish)
               {
                  t.finish();
               }
            }
            t = n;
         }
      }
   }
}
