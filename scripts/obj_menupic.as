package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_menupic extends Entity
   {
       
      
      private const MP:Class = obj_menupic_MP;
      
      private const MP2:Class = obj_menupic_MP2;
      
      public var base_y:int = 232.0;
      
      public var vsp:Number = 0;
      
      public var z:Image;
      
      public var a:Image;
      
      public function obj_menupic()
      {
         super();
         type = "menupic";
         x = 112;
         y = 32 + 200 + 30;
         this.base_y = 32 + 200;
         this.a = new Image(this.MP2);
         this.z = new Image(this.MP);
         this.z.centerOrigin();
         this.a.centerOrigin();
         if(global.sunglasses)
         {
            graphic = this.a;
         }
         else
         {
            graphic = this.z;
         }
      }
      
      override public function update() : void
      {
         if(global.sunglasses_unlocked)
         {
            if(FP.world.mouseX > x - this.z.width / 2 && FP.world.mouseY > y - this.z.height / 2 && FP.world.mouseX < x + this.z.width / 2 && FP.world.mouseY < y + this.z.height / 2)
            {
               if(Input.mousePressed)
               {
                  global.sunglasses = !global.sunglasses;
               }
            }
         }
         super.update();
         if(y > this.base_y)
         {
            this.vsp = this.vsp - 0.2;
         }
         if(y < this.base_y)
         {
            this.vsp = this.vsp + 0.2;
         }
         y = y + this.vsp;
         if(this.vsp < -20)
         {
            this.vsp = -20;
         }
         if(this.vsp > 10)
         {
            this.vsp = 10;
         }
         if(global.sunglasses)
         {
            graphic = this.a;
         }
         else
         {
            graphic = this.z;
         }
         this.z.alpha = 0.8 + Math.random() * 0.2;
         this.z.scaleX = 0.98 + Math.random() * 0.02;
         this.z.scaleY = 0.98 + Math.random() * 0.02;
         this.z.angle = Math.random() - Math.random();
         this.a.alpha = 0.8 + Math.random() * 0.2;
         this.a.scaleX = 0.98 + Math.random() * 0.02;
         this.a.scaleY = 0.98 + Math.random() * 0.02;
         this.a.angle = Math.random() - Math.random();
      }
   }
}
