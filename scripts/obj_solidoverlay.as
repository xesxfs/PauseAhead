package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Image;
   
   public class obj_solidoverlay extends Entity
   {
       
      
      private const OVER:Class = obj_solidoverlay_OVER;
      
      public function obj_solidoverlay()
      {
         var z:Image = null;
         super();
         layer = -8001;
         z = new Image(this.OVER);
         graphic = z;
         type = "overlay";
      }
      
      override public function update() : void
      {
         x = FP.world.camera.x;
         y = FP.world.camera.y;
      }
      
      override public function render() : void
      {
         super.render();
      }
   }
}
