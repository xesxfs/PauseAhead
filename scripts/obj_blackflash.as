package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_blackflash extends Entity
   {
       
      
      public var alpha:Number = 1;
      
      public function obj_blackflash()
      {
         super();
         layer = -500;
         type = "flash";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            this.alpha = this.alpha - 0.01;
            if(this.alpha <= 0)
            {
               FP.world.remove(this);
            }
            if(global.replay.play == true)
            {
               this.alpha = 0;
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(FP.camera.x,FP.camera.y,640,480,0,this.alpha,false);
      }
   }
}
