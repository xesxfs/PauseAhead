package net.flashpunk.tweens.misc
{
   import net.flashpunk.Tween;
   
   public class Alarm extends Tween
   {
       
      
      public function Alarm(duration:Number, complete:Function = null, type:uint = 0)
      {
         super(duration,type,complete,null);
      }
      
      public function reset(duration:Number) : void
      {
         _target = duration;
         start();
      }
      
      public function get elapsed() : Number
      {
         return _time;
      }
      
      public function get duration() : Number
      {
         return _target;
      }
      
      public function get remaining() : Number
      {
         return _target - _time;
      }
   }
}
