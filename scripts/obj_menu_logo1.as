package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   
   public class obj_menu_logo1 extends Entity
   {
       
      
      private const MP:Class = obj_menu_logo1_MP;
      
      public var z:Image;
      
      public var scaleplus:Number = 0;
      
      public function obj_menu_logo1()
      {
         super();
         x = 578;
         y = 410;
         this.z = new Image(this.MP);
         this.z.centerOrigin();
         graphic = this.z;
         layer = -1;
      }
      
      override public function update() : void
      {
         super.update();
         if(FP.world.mouseY > y - this.z.height / 2 && FP.world.mouseY < y + this.z.height / 2 && FP.world.mouseX > x - this.z.width / 2 && FP.world.mouseX < x + this.z.width / 2 && global.yesno == false)
         {
            this.z.color = 16776960;
            this.scaleplus = 0.2;
            if(Input.mousePressed)
            {
               if(FP.world.typeCount("obj_transition") == 0)
               {
                  navigateToURL(new URLRequest("http://games.adultswim.com/"),"_blank");
               }
            }
         }
         else
         {
            this.z.color = 16777215;
            this.scaleplus = 0;
         }
         this.z.alpha = 1;
         this.z.scaleX = 0.98 + Math.random() * 0.02 + this.scaleplus;
         this.z.scaleY = 0.98 + Math.random() * 0.02 + this.scaleplus;
         this.z.angle = Math.random() - Math.random();
      }
   }
}
