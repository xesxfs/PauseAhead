package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_escpause extends Entity
   {
       
      
      public function obj_escpause()
      {
         super();
         layer = -6000;
         type = "obj_escpause";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            FP.world.remove(this);
         }
      }
      
      override public function render() : void
      {
         super.render();
         Draw.rect(0,0,global.room_width,global.room_height,0,0.6,false);
         Draw.rectPlus(FP.camera.x + 320 - 100,FP.camera.y + 240 - 140,200,250,0,1,true,4,5);
         Draw.rectPlus(FP.camera.x + 320 - 90,FP.camera.y + 240 - 130,180,230,13421772,1,false,4,5);
         Draw.rectPlus(FP.camera.x + 320 - 100,FP.camera.y + 240 - 140,200,250,13421772,1,false,4,5);
      }
   }
}
