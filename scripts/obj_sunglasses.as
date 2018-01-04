package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   
   public class obj_sunglasses extends Entity
   {
       
      
      private const FIREFLY:Class = obj_sunglasses_FIREFLY;
      
      public var hsp:Number = 0;
      
      public var vsp:Number = 0;
      
      public var z:Image;
      
      public var dir:int = 0;
      
      public function obj_sunglasses(nx:int, ny:int, d:int)
      {
         super();
         this.dir = d;
         x = nx;
         y = ny;
         this.hsp = 0;
         this.vsp = -6;
         this.z = new Image(this.FIREFLY);
         this.z.scaleY = 2;
         if(this.dir == 0)
         {
            this.z.scaleX = 2;
         }
         else
         {
            this.z.scaleX = -2;
         }
         this.z.centerOrigin();
         graphic = this.z;
         layer = -56;
         type = "obj_shades";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(this.dir == 0)
            {
               this.z.angle = this.z.angle + 8;
            }
            else
            {
               this.z.angle = this.z.angle - 8;
            }
            if(this.z.scaleY < 3)
            {
               this.z.scaleY = this.z.scaleY + 0.02;
               if(this.dir == 0)
               {
                  this.z.scaleX = this.z.scaleX + 0.02;
               }
               else
               {
                  this.z.scaleX = this.z.scaleX - 0.02;
               }
            }
            if(this.vsp > 10)
            {
               this.vsp = 10;
            }
            this.vsp = this.vsp + 0.2;
            x = x + this.hsp;
            y = y + this.vsp;
         }
      }
   }
}
