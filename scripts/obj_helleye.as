package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   
   public class obj_helleye extends Entity
   {
       
      
      private const HE:Class = obj_helleye_HE;
      
      public var alpha:Number = 1;
      
      public var up:Boolean = false;
      
      public var spr_eye:Image;
      
      public function obj_helleye(nx:int, ny:int)
      {
         super();
         x = nx;
         y = ny;
         this.spr_eye = new Image(this.HE);
         this.spr_eye.scale = 2;
         graphic = this.spr_eye;
         type = "obj_helleye";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(this.up == true)
            {
               this.alpha = this.alpha + 0.005;
            }
            if(this.up == false)
            {
               this.alpha = this.alpha - 0.005;
            }
            if(this.alpha > 1.2)
            {
               this.up = false;
            }
            if(this.alpha < 0.3)
            {
               this.up = true;
            }
            this.spr_eye.alpha = this.alpha;
            if(global.level == 13)
            {
               this.spr_eye.alpha = this.alpha / 2;
            }
         }
      }
   }
}
