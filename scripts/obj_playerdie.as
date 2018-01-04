package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_playerdie extends Entity
   {
       
      
      private const PLAYERDIE:Class = obj_playerdie_PLAYERDIE;
      
      private const s_sbs3:Class = obj_playerdie_s_sbs3;
      
      public var sound_die:Sfx;
      
      public var spr_playerdie:Spritemap;
      
      public var animation_index:Number = 0;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.4;
      
      public function obj_playerdie()
      {
         this.sound_die = new Sfx(this.s_sbs3);
         this.spr_playerdie = new Spritemap(this.PLAYERDIE,128,128);
         super();
         this.spr_playerdie.add("main",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]);
         graphic = this.spr_playerdie;
         this.spr_playerdie.play("playerdie",true,this.animation_index);
         layer = -56;
         type = "obj_playerdie";
         if(FP.world.typeCount("player") == 1)
         {
            global.levelTrinket = false;
            x = global.player.x - 64 + 32;
            y = global.player.y - 68;
            FP.world.remove(global.player);
            if(global.mute == false)
            {
               this.sound_die.play(global.volume * 1);
            }
            global.gamedeaths[global.level - 1] = global.gamedeaths[global.level - 1] + 1;
            global.allDeaths = global.allDeaths + 1;
            if(global.allDeaths >= 600 && global.allDeaths < 603)
            {
               global.achievementQueue.push(15);
            }
         }
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
            if(this.animation_index > 19)
            {
               FP.world.remove(this);
            }
         }
         this.spr_playerdie.play("main",true,this.animation_index);
      }
      
      override public function render() : void
      {
         super.render();
      }
   }
}
