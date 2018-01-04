package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   
   public class obj_trinket extends Entity
   {
       
      
      private const H:Class = obj_trinket_H;
      
      public var spr_trinket:Spritemap;
      
      private const s_collect:Class = obj_trinket_s_collect;
      
      public var sound_collect:Sfx;
      
      public var animation_index:int = 0;
      
      public var animation_float:Number = 0;
      
      public var basey:int = 0;
      
      public var vsp:Number = 0;
      
      public function obj_trinket(nx:int, ny:int)
      {
         this.spr_trinket = new Spritemap(this.H,16,16);
         this.sound_collect = new Sfx(this.s_collect);
         super();
         this.spr_trinket = new Spritemap(this.H,16,16);
         x = nx;
         y = ny;
         y = y + 8;
         x = x + 0;
         this.basey = y;
         y = y + 4;
         this.spr_trinket.add("main",[0,1,2,3,4,5,6,7,8,9]);
         graphic = this.spr_trinket;
         this.spr_trinket.play("main",true,this.animation_index);
         this.spr_trinket.scale = 2;
         setHitbox(32,32,0,0);
         layer = 0;
         type = "obj_trinket";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false)
         {
            if(y > this.basey)
            {
               this.vsp = this.vsp - 0.05;
            }
            if(y < this.basey)
            {
               this.vsp = this.vsp + 0.05;
            }
            y = y + this.vsp;
            this.animation_float = this.animation_float + 0.3;
            if(this.animation_float >= 1)
            {
               this.animation_index = this.animation_index + 1;
               this.animation_float = 0;
            }
            if(this.animation_index > 9)
            {
               this.animation_index = 0;
            }
         }
         if(collide("player",x,y) && global.pause == false && global.esc_pause == false)
         {
            if(global.mute == false)
            {
               this.sound_collect.play(global.volume * 1);
            }
            global.levelTrinket = true;
            FP.world.remove(this);
         }
         this.spr_trinket.play("main",true,this.animation_index);
         graphic = this.spr_trinket;
      }
   }
}
