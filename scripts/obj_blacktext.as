package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_blacktext extends Entity
   {
       
      
      public var wait:int = 1;
      
      public function obj_blacktext()
      {
         super();
         layer = -99;
         type = "obj_blacktext";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            this.wait = this.wait + 1;
            if(this.wait > 5)
            {
               if(global.master.player_freeze == false)
               {
                  FP.world.add(new obj_blackflash());
                  FP.world.remove(this);
               }
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(FP.camera.x,FP.camera.y,640,480,0,1,false);
      }
   }
}
