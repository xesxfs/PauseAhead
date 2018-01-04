package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Image;
   
   public class obj_scanlines extends Entity
   {
       
      
      private const S:Class = obj_scanlines_S;
      
      public var ay:int = 0;
      
      public var spd:Number = 1;
      
      public function obj_scanlines()
      {
         var z:Image = null;
         super();
         z = new Image(this.S);
         graphic = z;
         layer = -7999;
         type = "scanlines";
      }
      
      override public function update() : void
      {
         this.spd = Math.random() * 2;
         this.ay = this.ay - this.spd;
         if(this.ay < 0)
         {
            this.ay = 480 + this.ay;
         }
         super.update();
      }
      
      override public function render() : void
      {
         var z:int = 0;
         if(global.blur == false)
         {
            z = -1;
            x = FP.world.camera.x;
            while(z <= 1)
            {
               y = FP.world.camera.y + this.ay + 480 * z;
               super.render();
               z = z + 1;
            }
         }
      }
   }
}
