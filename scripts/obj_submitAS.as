package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_submitAS extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public var time:int = 0;
      
      public function obj_submitAS(myTime:int)
      {
         super();
         this.time = myTime;
         x = 320;
         y = 450 - 40 + 160;
         this.z = new Text("SUBMIT TIME");
         this.z.size = 30;
         this.z.centerOrigin();
         graphic = this.z;
         layer = -50;
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
               world.add(new obj_AS(this.time));
            }
         }
         else
         {
            this.z.color = 16777215;
            this.scaleplus = 0;
         }
         this.z.scaleX = 1 + this.scaleplus;
         this.z.scaleY = 1 + this.scaleplus;
         graphic = this.z;
      }
   }
}
