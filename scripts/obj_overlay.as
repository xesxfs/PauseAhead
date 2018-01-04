package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Image;
   
   public class obj_overlay extends Entity
   {
       
      
      private const OVER:Class = obj_overlay_OVER;
      
      public var a:Boolean = false;
      
      public function obj_overlay()
      {
         var z:Image = null;
         super();
         layer = -8000;
         z = new Image(this.OVER);
         z.blend = "overlay";
         graphic = z;
         type = "overlay";
      }
      
      override public function update() : void
      {
         if(this.a == false)
         {
            FP.world.add(new obj_scanlines());
            this.a = true;
         }
         x = FP.world.camera.x;
         y = FP.world.camera.y;
      }
      
      override public function render() : void
      {
         if(global.blur == false)
         {
            super.render();
         }
      }
   }
}
