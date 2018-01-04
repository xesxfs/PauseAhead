package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   
   public class obj_clouds extends Entity
   {
       
      
      private const C:Class = obj_clouds_C;
      
      public var ax:int = 0;
      
      public var spd:int = 1;
      
      public var z:Image;
      
      public function obj_clouds()
      {
         super();
         this.z = new Image(this.C);
         graphic = this.z;
         layer = 150;
         type = "background2";
      }
      
      override public function update() : void
      {
         if(global.pause == false && global.esc_pause == false)
         {
            this.ax = this.ax - this.spd;
            if(this.ax < 0)
            {
               this.ax = 640 + this.ax;
            }
         }
         super.update();
      }
      
      override public function render() : void
      {
         var z:int = 0;
         z = -1;
         while(z <= 1)
         {
            x = this.ax + 640 * z;
            super.render();
            z = z + 1;
         }
      }
   }
}
