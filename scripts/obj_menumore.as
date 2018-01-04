package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   
   public class obj_menumore extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public function obj_menumore()
      {
         super();
         x = 260 + 130 + 25 + 6;
         y = 450 - 40;
         this.z = new Text("MORE GAMES");
         this.z.size = 30;
         this.z.centerOrigin();
         graphic = this.z;
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
               navigateToURL(new URLRequest("http://games.adultswim.com/"),"_blank");
            }
         }
         else
         {
            this.z.color = 16777215;
            this.scaleplus = 0;
         }
         this.z.alpha = 0.8 + Math.random() * 0.2;
         this.z.scaleX = 0.98 + Math.random() * 0.02 + this.scaleplus;
         this.z.scaleY = 0.98 + Math.random() * 0.02 + 0.3 + this.scaleplus;
         this.z.angle = Math.random() - Math.random();
         graphic = this.z;
      }
   }
}
