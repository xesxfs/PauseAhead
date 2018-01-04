package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   
   public class obj_yesnono extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public function obj_yesnono()
      {
         super();
         x = FP.camera.x + 320 + 36 + global.pxoff;
         y = FP.camera.y + 265;
         this.z = new Text("NO");
         this.z.size = 30;
         this.z.centerOrigin();
         graphic = this.z;
         layer = -6500;
         Input.define("ESC",Key.ESCAPE);
      }
      
      override public function update() : void
      {
         super.update();
         if(global.yesno == false)
         {
            FP.world.remove(this);
         }
         if(FP.world.mouseY > y - this.z.height / 2 && FP.world.mouseY < y + this.z.height / 2 && FP.world.mouseX > x - this.z.width / 2 && FP.world.mouseX < x + this.z.width / 2)
         {
            this.z.color = 16776960;
            this.scaleplus = 0.2;
            if(Input.mousePressed)
            {
               global.yesno = false;
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
