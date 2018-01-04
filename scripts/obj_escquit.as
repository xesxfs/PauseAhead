package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_escquit extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public function obj_escquit()
      {
         super();
         x = FP.camera.x + 320;
         y = FP.camera.y + 150 + 150;
         this.z = new Text("QUIT");
         this.z.size = 30;
         this.z.centerOrigin();
         graphic = this.z;
         layer = -6500;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
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
               t = new obj_transition();
               world.add(t);
               t.clear = false;
               t.goto = -1;
               global.pause = false;
               global.esc_pause = false;
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
