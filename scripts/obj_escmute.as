package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_escmute extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public function obj_escmute()
      {
         super();
         x = FP.camera.x + 320;
         y = FP.camera.y + 150 + 50;
         this.z = new Text("(M)UTE");
         this.z.size = 30;
         this.z.centerOrigin();
         graphic = this.z;
         layer = -6500;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            FP.world.remove(this);
         }
         if(FP.world.mouseY > y - this.z.height / 2 && FP.world.mouseY < y + this.z.height / 2 && FP.world.mouseX > x - this.z.width / 2 && FP.world.mouseX < x + this.z.width / 2)
         {
            this.z.color = 16776960;
            this.scaleplus = 0.2;
            if(Input.mousePressed)
            {
               global.muted = true;
               global.mute = !global.mute;
               if(global.mute == false)
               {
                  global.volume = global.pvolume;
               }
               else
               {
                  global.volume = 0;
               }
            }
         }
         else
         {
            this.z.color = 13421772;
            this.scaleplus = 0;
         }
         this.z.alpha = 1;
         this.z.scaleX = 1 + this.scaleplus;
         this.z.scaleY = 1 + this.scaleplus;
         this.z.angle = 0;
         graphic = this.z;
      }
   }
}
