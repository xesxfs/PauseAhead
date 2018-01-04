package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   
   public class obj_menucredit extends Entity
   {
       
      
      public var z:Text;
      
      public function obj_menucredit()
      {
         super();
         x = 426;
         y = 480 - 24;
         this.z = new Text("Askiisoft - 2013");
         this.z.size = 20;
         this.z.color = 16748800;
         this.z.centerOrigin();
         graphic = this.z;
      }
      
      override public function update() : void
      {
         super.update();
         this.z.alpha = 0.8 + Math.random() * 0.2;
         this.z.scaleX = 0.98 + Math.random() * 0.02;
         this.z.scaleY = 0.98 + Math.random() * 0.02 + 0.3;
         this.z.angle = Math.random() - Math.random();
         graphic = this.z;
      }
   }
}
