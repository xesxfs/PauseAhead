package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_ceilingsawleft extends Entity
   {
       
      
      private const SAW3:Class = obj_ceilingsawleft_SAW3;
      
      public var sprite_index:Spritemap;
      
      public var animation_index:Number = 0;
      
      public var animation_max:Number = 3;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.3;
      
      public var image_xscale:Number = 1;
      
      public var dir:String = "left";
      
      public var basex:Number = 0;
      
      public var delay:int = 0;
      
      public function obj_ceilingsawleft(nx:int, ny:int)
      {
         this.sprite_index = new Spritemap(this.SAW3,56,56);
         super();
         x = nx;
         y = ny;
         this.basex = x;
         this.sprite_index.add("main",[0,1,2,3]);
         graphic = this.sprite_index;
         this.sprite_index.play("main",true,this.animation_index);
         setHitbox(55,20,0,-28);
         layer = -2;
         type = "obj_saw";
      }
      
      override public function update() : void
      {
         super.update();
         if(collide("player",x,y) && global.pause == false && global.esc_pause == false)
         {
            global.player.dead = true;
         }
         if(global.esc_pause == false)
         {
            this.delay = this.delay - 1;
         }
         if(global.pause == false && global.master.player_freeze == false && global.delay <= 0 && global.esc_pause == false && this.delay <= 0)
         {
            if(this.dir == "right")
            {
               this.image_xscale = 1;
               x = x + 2;
               if(collide("solid",x + 2,y))
               {
                  this.dir = "left";
               }
            }
            else
            {
               this.image_xscale = -1;
               x = x - 2;
               if(collide("solid",x - 2,y))
               {
                  this.dir = "right";
               }
            }
            this.animation_speed = 0.3;
         }
         else
         {
            this.animation_speed = 0;
         }
         this.animation_float = this.animation_float + this.animation_speed;
         if(this.animation_float >= 1)
         {
            this.animation_index = this.animation_index + 1;
            this.animation_float = 0;
         }
         if(this.animation_index > this.animation_max)
         {
            this.animation_index = 0;
         }
         if(this.image_xscale == 1)
         {
            this.sprite_index.flipped = false;
         }
         else
         {
            this.sprite_index.flipped = true;
         }
         this.sprite_index.play("main",true,this.animation_index);
      }
      
      override public function render() : void
      {
         if(x > FP.camera.x - 40 && x < FP.camera.x + 640 + 40 && y > FP.camera.y - 40 && y < FP.camera.y + 480 + 40)
         {
            super.render();
         }
      }
   }
}
