package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_landcloud extends Entity
   {
       
      
      private const DUSTCLOUD:Class = obj_landcloud_DUSTCLOUD;
      
      public var spr_jumpcloud:Spritemap;
      
      public var animation_index:Number = 0;
      
      public var animation_max:Number = 6;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.4;
      
      public function obj_landcloud(nx:int, ny:int)
      {
         this.spr_jumpcloud = new Spritemap(this.DUSTCLOUD,50,14);
         super();
         x = Math.round(nx / 2) * 2;
         y = Math.round(ny - 0.51);
         this.spr_jumpcloud.add("main",[0,1,2,3,4,5,6]);
         this.spr_jumpcloud.centerOrigin();
         this.spr_jumpcloud.originY = 15;
         this.spr_jumpcloud.scale = 2;
         graphic = this.spr_jumpcloud;
         this.spr_jumpcloud.play("main",true,this.animation_index);
         layer = -8;
         type = "obj_jumpcloud";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            this.animation_float = this.animation_float + this.animation_speed;
            if(this.animation_float >= 1)
            {
               this.animation_index = this.animation_index + 1;
               this.animation_float = 0;
            }
            if(this.animation_index > this.animation_max)
            {
               FP.world.remove(this);
            }
         }
         this.spr_jumpcloud.play("main",true,this.animation_index);
      }
   }
}
