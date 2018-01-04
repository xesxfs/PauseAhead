package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_whitefade extends Entity
   {
       
      
      public var alpha:Number = -0.25;
      
      public function obj_whitefade()
      {
         super();
         layer = -12;
         type = "obj_flash";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            this.alpha = this.alpha + 0.005;
            if(this.alpha >= 1)
            {
               if(FP.world.classCount(obj_slide4) == 0)
               {
                  FP.world.add(new obj_slide4());
               }
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(0,0,640,480,16776919,this.alpha);
      }
   }
}
