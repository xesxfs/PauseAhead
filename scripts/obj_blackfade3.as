package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_blackfade3 extends Entity
   {
       
      
      public var alpha:Number = 0;
      
      public function obj_blackfade3()
      {
         super();
         layer = -60;
         type = "obj_blackfade3";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            global.blackfadevol = this.alpha;
            this.alpha = this.alpha + 0.003;
            if(this.alpha >= 1)
            {
               FP.world.remove(global.muteObj);
               FP.world = new hell_ending();
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(FP.camera.x - 5,FP.camera.y - 5,650,490,0,this.alpha);
      }
   }
}
