package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   
   public class obj_menutitle extends Entity
   {
       
      
      private const MT:Class = obj_menutitle_MT;
      
      public var z:Image;
      
      public function obj_menutitle()
      {
         super();
         x = 432;
         y = 150;
         this.z = new Image(this.MT);
         this.z.centerOrigin();
         graphic = this.z;
      }
      
      override public function update() : void
      {
         super.update();
         this.z.alpha = 0.8 + Math.random() * 0.2;
         this.z.scaleX = 0.98 + Math.random() * 0.02;
         this.z.scaleY = 0.98 + Math.random() * 0.02;
         this.z.angle = Math.random() - Math.random();
         graphic = this.z;
      }
   }
}
