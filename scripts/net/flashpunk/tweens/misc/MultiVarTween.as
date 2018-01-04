package net.flashpunk.tweens.misc
{
   import net.flashpunk.Tween;
   
   public class MultiVarTween extends Tween
   {
       
      
      private var _object:Object;
      
      private var _vars:Vector.<String>;
      
      private var _start:Vector.<Number>;
      
      private var _range:Vector.<Number>;
      
      public function MultiVarTween(complete:Function = null, type:uint = 0)
      {
         this._vars = new Vector.<String>();
         this._start = new Vector.<Number>();
         this._range = new Vector.<Number>();
         super(0,type,complete);
      }
      
      public function tween(object:Object, values:Object, duration:Number, ease:Function = null) : void
      {
         var p:* = null;
         var a:* = undefined;
         this._object = object;
         this._vars.length = 0;
         this._start.length = 0;
         this._range.length = 0;
         _target = duration;
         _ease = ease;
         for(p in values)
         {
            if(!object.hasOwnProperty(p))
            {
               throw new Error("The Object does not have the property\"" + p + "\", or it is not accessible.");
            }
            a = this._object[p] as Number;
            if(a == null)
            {
               throw new Error("The property \"" + p + "\" is not numeric.");
            }
            this._vars.push(p);
            this._start.push(a);
            this._range.push(values[p] - a);
         }
         start();
      }
      
      override public function update() : void
      {
         super.update();
         for(var i:int = this._vars.length; i--; )
         {
            this._object[this._vars[i]] = this._start[i] + this._range[i] * _t;
         }
      }
   }
}
