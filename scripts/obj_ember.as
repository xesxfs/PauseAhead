package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_ember extends Entity
   {
       
      
      private const FIREFLY:Class = obj_ember_FIREFLY;
      
      public var base_x:int;
      
      public var base_y:int;
      
      public var hsp:Number = 0;
      
      public var vsp:Number = 0;
      
      public var dest_x:int;
      
      public var dest_y:int;
      
      public var z:Image;
      
      public function obj_ember(nx:int, ny:int)
      {
         super();
         this.base_x = nx;
         this.base_y = ny;
         x = nx + this.random(10) - this.random(10);
         y = ny + this.random(10) - this.random(10);
         this.hsp = this.random(6) - this.random(6);
         this.vsp = this.random(6) - this.random(6);
         this.z = new Image(this.FIREFLY);
         this.z.alpha = 0.8 + this.random(0.2);
         this.z.scale = 0.8 + this.random(0.2);
         graphic = this.z;
         setHitbox(32,32,0,0);
         layer = -56;
         type = "obj_ember";
      }
      
      public function random(max:Number) : Number
      {
         return Math.random() * max;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            this.dest_x = this.base_x + this.random(10) - this.random(10);
            this.dest_y = -100;
            if(x > this.dest_x)
            {
               this.hsp = this.hsp - 0.1;
            }
            if(x < this.dest_x)
            {
               this.hsp = this.hsp + 0.1;
            }
            if(y > this.dest_y)
            {
               this.vsp = this.vsp - 0.1;
            }
            if(y < this.dest_y)
            {
               this.vsp = this.vsp + 0.1;
            }
            x = x + this.hsp;
            y = y + this.vsp;
            this.z.alpha = 0.6 + this.random(0.4);
            this.z.scale = 0.6 + this.random(0.4);
            graphic = this.z;
            if(y < FP.camera.y - 10)
            {
               FP.world.remove(this);
            }
         }
      }
   }
}
