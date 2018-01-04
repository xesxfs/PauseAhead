package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_whiteflash extends Entity
   {
       
      
      public var alpha:Number = 0.8;
      
      public function obj_whiteflash()
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
         Draw.blend = "add";
         Draw.rect(FP.camera.x,FP.camera.y,640,480,16777215,this.alpha,false);
         Draw.blend = "normal";
      }
   }
}
