package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   
   public class obj_shake extends Entity
   {
       
      
      public var alarm:int = 20;
      
      public function obj_shake()
      {
         super();
         layer = -1;
         type = "obj_shake";
      }
      
      override public function update() : void
      {
         if(global.replay.play == true || global.pause == true || global.esc_pause == true)
         {
            FP.world.remove(this);
         }
         this.alarm = this.alarm - 1;
         if(this.alarm <= 0)
         {
            FP.world.remove(this);
         }
      }
   }
}
