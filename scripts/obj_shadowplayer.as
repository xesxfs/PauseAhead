package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_shadowplayer extends Entity
   {
       
      
      private const PLAYER:Class = obj_shadowplayer_PLAYER;
      
      private const PLAYER2:Class = obj_shadowplayer_PLAYER2;
      
      public var sprite_index:Spritemap;
      
      public var frame:int;
      
      public var i:Number = 0;
      
      public var player_id:int;
      
      public var z:Number;
      
      public var alpha:Number = 0;
      
      public var die:Boolean = false;
      
      public var grace:int = 0;
      
      public var pause:Array;
      
      public function obj_shadowplayer()
      {
         this.frame = Math.max(global.replay.frame - 100 * (FP.world.classCount(obj_shadowplayer) + 1),0);
         this.player_id = global.recording_id;
         this.pause = new Array();
         super();
         if(global.sunglasses == true)
         {
            this.sprite_index = new Spritemap(this.PLAYER2,64,62);
         }
         else
         {
            this.sprite_index = new Spritemap(this.PLAYER,64,62);
         }
         this.sprite_index.add("spr_runright",[0,1,2,3,4,5,6,7,8,9]);
         this.sprite_index.add("spr_standright",[10]);
         this.sprite_index.add("spr_jumpright",[11,12]);
         this.sprite_index.add("spr_fallright",[13,14]);
         this.sprite_index.add("spr_runleft",[15,16,17,18,19,20,21,22,23,24]);
         this.sprite_index.add("spr_standleft",[25]);
         this.sprite_index.add("spr_jumpleft",[26,27]);
         this.sprite_index.add("spr_fallleft",[28,29]);
         this.sprite_index.originX = 32;
         graphic = this.sprite_index;
         layer = 0;
         type = "obj_shadowplayer";
         setHitbox(41 - 22,59 - 14,-22 + 32,-14);
      }
      
      override public function update() : void
      {
         var thing:obj_playerdie2 = null;
         super.update();
         if(global.esc_pause == false && global.pause == false && global.master.player_freeze == false)
         {
            this.grace = this.grace - 1;
            if(this.alpha < 1)
            {
               this.alpha = this.alpha + 0.05;
            }
            if(this.alpha > 1)
            {
               this.alpha = 1;
            }
            if(collide("player",x,y) && this.alpha >= 1 && this.grace <= 0)
            {
               global.player.dead = true;
            }
            this.frame = this.frame + 1;
         }
         if(FP.world.classCount(obj_whiteflash) != 0)
         {
            this.die = true;
         }
         if(global.playersprite1[this.player_id][Math.min(this.frame,global.frame[this.player_id])] != "playerdie" && this.die == false)
         {
            this.sprite_index.play(global.playersprite1[this.player_id][Math.min(this.frame,global.frame[this.player_id])],true,global.playerframe1[this.player_id][Math.min(this.frame,global.frame[this.player_id])]);
            x = global.playerx1[this.player_id][Math.min(this.frame,global.frame[this.player_id])];
            y = global.playery1[this.player_id][Math.min(this.frame,global.frame[this.player_id])];
         }
         else
         {
            thing = new obj_playerdie2();
            world.add(thing);
            thing.x = global.playerx1[this.player_id][Math.min(this.frame - 1,global.frame[this.player_id])] - 64 + 32;
            thing.y = global.playery1[this.player_id][Math.min(this.frame - 1,global.frame[this.player_id])] - 68;
            FP.world.remove(this);
         }
         if(global.replay.pause[this.frame] == true)
         {
            this.grace = 26;
         }
      }
      
      override public function render() : void
      {
         if(this.frame > 1)
         {
            x = x + 32;
            this.sprite_index.alpha = this.alpha;
            this.sprite_index.color = 5263440;
            super.render();
            this.sprite_index.scaleX = Math.round(Math.random() * 2);
            this.sprite_index.alpha = this.alpha - Math.random();
            this.sprite_index.color = 16777215;
            super.render();
            this.sprite_index.scaleX = 1;
            if(this.grace > 0)
            {
               this.sprite_index.alpha = this.alpha - 0.3;
               this.sprite_index.color = 2370;
               super.render();
               this.sprite_index.scaleX = 1;
            }
            if(this.grace <= 0)
            {
               this.z = y + 14 + Math.random() * (62 - 14);
               Draw.linePlus(x + Math.random() * 32 - Math.random() * 32,this.z,x + Math.random() * 32 - Math.random() * 32,this.z,16777215,this.alpha - (Math.random() - 0.3),2);
               this.z = y + 14 + Math.random() * (62 - 14);
               Draw.linePlus(x + Math.random() * 32 - Math.random() * 32,this.z,x + Math.random() * 32 - Math.random() * 32,this.z,16777215,this.alpha - (Math.random() - 0.3),2);
               this.z = y + 14 + Math.random() * (62 - 14);
               Draw.linePlus(x + Math.random() * 32 - Math.random() * 32,this.z,x + Math.random() * 32 - Math.random() * 32,this.z,16777215,this.alpha - (Math.random() - 0.3),2);
            }
            else
            {
               this.z = y + 14 + Math.random() * (62 - 14);
               Draw.linePlus(x + Math.random() * 32 - Math.random() * 32,this.z,x + Math.random() * 32 - Math.random() * 32,this.z,2370,this.alpha - (Math.random() - 0.3),2);
               this.z = y + 14 + Math.random() * (62 - 14);
               Draw.linePlus(x + Math.random() * 32 - Math.random() * 32,this.z,x + Math.random() * 32 - Math.random() * 32,this.z,2370,this.alpha - (Math.random() - 0.3),2);
               this.z = y + 14 + Math.random() * (62 - 14);
               Draw.linePlus(x + Math.random() * 32 - Math.random() * 32,this.z,x + Math.random() * 32 - Math.random() * 32,this.z,2370,this.alpha - (Math.random() - 0.3),2);
            }
         }
      }
   }
}
