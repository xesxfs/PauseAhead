package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_menuach extends Entity
   {
       
      
      private const MP:Class = obj_menuach_MP;
      
      public var z:Image;
      
      public var scaleplus:Number = 0;
      
      public function obj_menuach()
      {
         super();
         x = 584 - 320 - 4;
         y = 320 - 4;
         this.z = new Image(this.MP);
         this.z.scale = 2;
         this.z.centerOrigin();
         graphic = this.z;
         layer = -1;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         super.update();
         if(FP.world.mouseY > y - this.z.height * this.z.scale / 2 && FP.world.mouseY < y + this.z.height * this.z.scale / 2 && FP.world.mouseX > x - this.z.width * this.z.scale / 2 && FP.world.mouseX < x + this.z.width * this.z.scale / 2 && global.yesno == false)
         {
            this.z.color = 16776960;
            this.scaleplus = 0.2;
            if(Input.mousePressed)
            {
               if(FP.world.typeCount("obj_transition") == 0)
               {
                  t = new obj_transition();
                  world.add(t);
                  t.clear = true;
                  t.goto = -2;
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
         this.z.angle = Math.random() * 2 - Math.random() * 2;
      }
   }
}
