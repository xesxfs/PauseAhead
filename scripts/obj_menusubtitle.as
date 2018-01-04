package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   
   public class obj_menusubtitle extends Entity
   {
       
      
      public var z:Text;
      
      public function obj_menusubtitle()
      {
         super();
         x = 426;
         y = 320;
         this.z = new Text("PAUSE AHEAD");
         this.z.size = 40;
         this.z.color = 16763525;
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
