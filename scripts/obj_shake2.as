package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   
   public class obj_shake2 extends Entity
   {
       
      
      public var alarm:int = 200;
      
      public function obj_shake2()
      {
         super();
         layer = -1;
         type = "obj_shake2";
         global.shaketimer = this.alarm;
      }
      
      override public function update() : void
      {
         if(global.pause == false && global.esc_pause == false)
         {
            this.alarm = this.alarm - 1;
            global.shaketimer = this.alarm;
         }
         if(this.alarm <= 0)
         {
            FP.world.remove(this);
         }
      }
   }
}
