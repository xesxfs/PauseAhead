package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.Sfx;
   import net.flashpunk.utils.Input;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Key;
   
   public class obj_player extends Entity
   {
       
      
      private const PLAYER:Class = obj_player_PLAYER;
      
      private const PLAYER2:Class = obj_player_PLAYER2;
      
      public var spr_player:Spritemap;
      
      private const s_sbs3:Class = obj_player_s_sbs3;
      
      public var sound_jump:Sfx;
      
      private const s_sbs4:Class = obj_player_s_sbs4;
      
      public var sound_land:Sfx;
      
      private const s_sbs5:Class = obj_player_s_sbs5;
      
      public var sound_step1:Sfx;
      
      private const s_sbs6:Class = obj_player_s_sbs6;
      
      public var sound_step2:Sfx;
      
      public var sprite_index:String = "spr_standright";
      
      public var hsp:Number = 0;
      
      public var vsp:Number = 0;
      
      public var jumping:Boolean = false;
      
      public var dead:Boolean = false;
      
      public var animation_index:Number = 0;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.3;
      
      public var animation_max:Number = 5;
      
      public var dir:Number = 0;
      
      public var buffer:Number = 0;
      
      public var buffer2:Number = 0;
      
      public var buffermax:Number = 7;
      
      public var slope_tolerance:Number = 10;
      
      public var can_move:Boolean = false;
      
      public var hor_check:Boolean = false;
      
      public var step:Boolean = false;
      
      public var pausejump:int = 0;
      
      public function obj_player(nx:int, ny:int)
      {
         this.sound_jump = new Sfx(this.s_sbs3);
         this.sound_land = new Sfx(this.s_sbs4);
         this.sound_step1 = new Sfx(this.s_sbs5);
         this.sound_step2 = new Sfx(this.s_sbs6);
         super();
         x = nx;
         y = ny;
         if(global.sunglasses == true)
         {
            this.spr_player = new Spritemap(this.PLAYER2,64,62);
         }
         else
         {
            this.spr_player = new Spritemap(this.PLAYER,64,62);
         }
         this.spr_player.add("spr_runright",[0,1,2,3,4,5,6,7,8,9]);
         this.spr_player.add("spr_standright",[10]);
         this.spr_player.add("spr_jumpright",[11,12]);
         this.spr_player.add("spr_fallright",[13,14]);
         this.spr_player.add("spr_runleft",[15,16,17,18,19,20,21,22,23,24]);
         this.spr_player.add("spr_standleft",[25]);
         this.spr_player.add("spr_jumpleft",[26,27]);
         this.spr_player.add("spr_fallleft",[28,29]);
         graphic = this.spr_player;
         this.spr_player.play("spr_standright",true,this.animation_index);
         setHitbox(41 - 22,59 - 14,-22,-14);
         layer = -10;
         type = "player";
         Input.define("ACTION",Key.DOWN,Key.SPACE,Key.ENTER);
         Input.define("JUMP",Key.UP,Key.SPACE,Key.Z,Key.W);
         Input.define("DOWN",Key.S,Key.DOWN);
         Input.define("RIGHT",Key.D,Key.RIGHT);
         Input.define("LEFT",Key.A,Key.LEFT);
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         var st:Number = NaN;
         global.playerdust = 0;
         super.update();
         if(global.esc_pause == false && this.dead == false)
         {
            if(global.pause == true || global.master.player_freeze == true)
            {
               this.can_move = false;
            }
            else
            {
               this.can_move = true;
            }
            if(!collide("solid",x,y + 1))
            {
               this.buffer = this.buffer + 1;
            }
            else
            {
               this.buffer = 0;
            }
            if(this.can_move == true)
            {
               if(!collide("solid",x,y + 1))
               {
                  this.buffer2 = this.buffer2 + 1;
               }
               else
               {
                  this.buffer2 = 0;
               }
               st = this.slope_tolerance;
               if(this.buffer >= this.buffermax)
               {
                  this.slope_tolerance = 0;
               }
               if(Input.check("LEFT") && !Input.check("RIGHT") && !collide("solid",x - 1,y - this.slope_tolerance) && (this.vsp >= 0 && !collide("obj_spikes",x - 2,y) || this.vsp < 0 && !collide("obj_invertspikes",x - 2,y)))
               {
                  if(this.hsp > 0)
                  {
                     this.hsp = 0;
                  }
                  this.dir = 1;
                  this.hsp = this.hsp - 0.4;
               }
               if(Input.check("RIGHT") && !Input.check("LEFT") && !collide("solid",x + 1,y - this.slope_tolerance) && (this.vsp >= 0 && !collide("obj_spikes",x + 2,y) || this.vsp < 0 && !collide("obj_invertspikes",x + 2,y)))
               {
                  if(this.hsp < 0)
                  {
                     this.hsp = 0;
                  }
                  this.dir = 0;
                  this.hsp = this.hsp + 0.4;
               }
               this.slope_tolerance = st;
               if(this.buffer2 > this.buffermax)
               {
                  if(this.vsp < 0)
                  {
                     this.vsp = this.vsp + 0.2;
                  }
                  else
                  {
                     this.vsp = this.vsp + 0.3;
                  }
               }
               if(this.buffer > this.buffermax && this.vsp < 0 && this.jumping == true)
               {
                  if(Input.released("JUMP"))
                  {
                     this.vsp = Math.round(this.vsp / 3);
                  }
               }
               if(this.buffer < this.buffermax)
               {
                  this.jumping = false;
                  if(Input.pressed("JUMP") || Input.check("JUMP") && this.pausejump > 0)
                  {
                     global.playerdust = 1;
                     FP.world.add(new obj_jumpcloud(x + 32,y + 62));
                     this.vsp = -6.2;
                     y = y - 6.2;
                     this.jumping = true;
                     this.buffer = this.buffermax + 1;
                     this.buffer2 = this.buffermax + 1;
                     if(global.mute == false)
                     {
                        this.sound_jump.play(global.volume * 0.9);
                     }
                  }
               }
               if(this.hsp > 4)
               {
                  this.hsp = 4;
               }
               if(this.hsp < -4)
               {
                  this.hsp = -4;
               }
               if(this.vsp > 12)
               {
                  this.vsp = 12;
               }
               if(this.vsp < -7)
               {
                  this.vsp = -7;
               }
               if(this.buffer < this.buffermax)
               {
                  if(!Input.check("RIGHT") && !Input.check("LEFT"))
                  {
                     if(this.hsp > 0)
                     {
                        this.hsp = this.hsp - 0.4;
                     }
                     if(this.hsp < 0)
                     {
                        this.hsp = this.hsp + 0.4;
                     }
                     if(this.hsp < 0.4 && this.hsp > -0.4)
                     {
                        this.hsp = 0;
                     }
                  }
                  else
                  {
                     if(Input.check("RIGHT") && Input.check("LEFT"))
                     {
                        if(this.hsp < 0.4 && this.hsp > -0.4)
                        {
                           this.hsp = 0;
                        }
                     }
                     if(this.hsp > 0)
                     {
                        this.hsp = this.hsp - 0.2;
                     }
                     if(this.hsp < 0)
                     {
                        this.hsp = this.hsp + 0.2;
                     }
                  }
               }
               else
               {
                  if(!Input.check("RIGHT") && !Input.check("LEFT"))
                  {
                     if(this.hsp < 0.4 && this.hsp > -0.4)
                     {
                        this.hsp = 0;
                     }
                  }
                  if(this.hsp > 0)
                  {
                     this.hsp = this.hsp - 0.1;
                  }
                  if(this.hsp < 0)
                  {
                     this.hsp = this.hsp + 0.1;
                  }
               }
               if(!collide("solid",x + this.hsp + 1,y) && this.hsp > 0 && this.jumping == false)
               {
                  if(collide("solid",x + this.hsp + 1,y + this.slope_tolerance))
                  {
                     while(!collide("solid",x + this.hsp + 1,y))
                     {
                        y = y + 1;
                     }
                  }
               }
               if(!collide("solid",x + this.hsp - 1,y) && this.hsp < 0 && this.jumping == false)
               {
                  if(collide("solid",x + this.hsp - 1,y + this.slope_tolerance))
                  {
                     while(!collide("solid",x + this.hsp - 1,y))
                     {
                        y = y + 1;
                     }
                  }
               }
            }
            this.pausejump = this.pausejump - 1;
            if(this.buffer < this.buffermax && Input.pressed("JUMP") && global.pause == true)
            {
               this.pausejump = 9;
            }
            if(collide("solid",x + this.hsp + 1,y) && this.hsp > 0 && this.jumping == false)
            {
               if(!collide("solid",x + this.hsp + 1,y - this.slope_tolerance))
               {
                  while(collide("solid",x + this.hsp + 1,y))
                  {
                     y = y - 1;
                  }
               }
            }
            if(collide("solid",x + this.hsp - 1,y) && this.hsp < 0 && this.jumping == false)
            {
               if(!collide("solid",x + this.hsp - 1,y - this.slope_tolerance))
               {
                  while(collide("solid",x + this.hsp - 1,y))
                  {
                     y = y - 1;
                  }
               }
            }
            this.hor_check = false;
            if(this.hsp > 0 && collide("solid",x + this.hsp + 1,y))
            {
               this.hsp = Math.round(this.hsp);
               while(collide("solid",x + this.hsp + 1,y))
               {
                  this.hsp = this.hsp - 1;
               }
               if(this.hsp < 0)
               {
                  this.hsp = 0;
               }
               this.hor_check = true;
               x = x + this.hsp;
            }
            if(this.hsp < 0 && collide("solid",x + this.hsp - 1,y))
            {
               this.hsp = Math.round(this.hsp);
               while(collide("solid",x + this.hsp - 1,y))
               {
                  this.hsp = this.hsp + 1;
               }
               if(this.hsp > 0)
               {
                  this.hsp = 0;
               }
               this.hor_check = true;
               x = x + this.hsp;
            }
            if(this.can_move == true)
            {
               if(this.vsp <= 0 && this.hsp > 0 && collide("obj_spikes",x + this.hsp + 1,y))
               {
                  this.hsp = Math.round(this.hsp);
                  while(collide("obj_spikes",x + this.hsp + 1,y))
                  {
                     this.hsp = this.hsp - 1;
                  }
                  if(this.hsp < 0)
                  {
                     this.hsp = 0;
                  }
                  this.hor_check = true;
                  x = x + this.hsp;
               }
               if(this.vsp <= 0 && this.hsp < 0 && collide("obj_spikes",x + this.hsp - 1,y))
               {
                  this.hsp = Math.round(this.hsp);
                  while(collide("obj_spikes",x + this.hsp - 1,y))
                  {
                     this.hsp = this.hsp + 1;
                  }
                  if(this.hsp > 0)
                  {
                     this.hsp = 0;
                  }
                  this.hor_check = true;
                  x = x + this.hsp;
               }
               if(this.vsp > 0 && this.hsp > 0 && collide("obj_invertspikes",x + this.hsp + 1,y))
               {
                  this.hsp = Math.round(this.hsp);
                  while(collide("obj_invertspikes",x + this.hsp + 1,y))
                  {
                     this.hsp = this.hsp - 1;
                  }
                  if(this.hsp < 0)
                  {
                     this.hsp = 0;
                  }
                  this.hor_check = true;
                  x = x + this.hsp;
               }
               if(this.vsp > 0 && this.hsp < 0 && collide("obj_invertspikes",x + this.hsp - 1,y))
               {
                  this.hsp = Math.round(this.hsp);
                  while(collide("obj_invertspikes",x + this.hsp - 1,y))
                  {
                     this.hsp = this.hsp + 1;
                  }
                  if(this.hsp > 0)
                  {
                     this.hsp = 0;
                  }
                  this.hor_check = true;
                  x = x + this.hsp;
               }
            }
            if(this.hor_check == false)
            {
               x = x + this.hsp;
            }
            if(collide("solid",x,y + this.vsp - 1) && this.vsp < 0)
            {
               this.vsp = Math.round(this.vsp);
               while(collide("solid",x,y + this.vsp - 1))
               {
                  this.vsp = this.vsp + 1;
               }
               if(this.vsp > 0)
               {
                  this.vsp = 0;
               }
            }
            if(collide("solid",x,y + this.vsp) && this.vsp > 0)
            {
               this.vsp = Math.round(this.vsp);
               while(collide("solid",x,y + this.vsp))
               {
                  this.vsp = this.vsp - 1;
               }
               if(FP.world.classCount(obj_landcloud) == 0 && global.pause == false)
               {
                  global.playerdust = 2;
                  FP.world.add(new obj_landcloud(x + 32,y + 62 + this.vsp));
                  if(global.mute == false && global.pause == false)
                  {
                     this.sound_land.play(global.volume * 1);
                  }
               }
            }
            y = y + this.vsp;
            if(x > global.room_width - 50)
            {
               x = global.room_width - 50;
               this.hsp = 0;
            }
            if(x < -15)
            {
               x = -15;
               this.hsp = 0;
            }
            if(global.level != 22)
            {
               if(y > global.room_height)
               {
                  y = global.room_height;
                  this.vsp = 0;
               }
            }
            if(global.level == 19)
            {
               if(y >= global.room_height)
               {
                  global.pause = false;
                  FP.world.remove(global.player);
                  if(FP.world.typeCount("obj_transition") == 0)
                  {
                     t = new obj_transition();
                     world.add(t);
                     t.clear = true;
                     t.goto = 26;
                  }
               }
            }
            if(global.level == 22)
            {
               if(y >= global.room_height)
               {
                  global.pause = false;
                  FP.world.remove(global.player);
                  if(FP.world.typeCount("obj_transition") == 0)
                  {
                     t = new obj_transition();
                     world.add(t);
                     t.clear = true;
                     t.goto = 27;
                  }
               }
            }
            if(global.level != 6)
            {
               if(y < -30)
               {
                  y = -30;
                  this.vsp = 0;
               }
            }
            if(global.level == 6)
            {
               if(y < -30)
               {
                  global.pause = false;
                  FP.world.remove(global.player);
                  if(FP.world.typeCount("obj_transition") == 0)
                  {
                     t = new obj_transition();
                     world.add(t);
                     t.clear = true;
                     t.goto = 24;
                  }
               }
            }
            if(global.pause == false)
            {
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
               if(this.animation_float == 0 && (this.sprite_index == "spr_runright" || this.sprite_index == "spr_runleft"))
               {
                  if(this.animation_index == 4 || this.animation_index == 9)
                  {
                     this.step = !this.step;
                     if(global.mute == false)
                     {
                        if(this.step == true)
                        {
                           this.sound_step1.play(global.volume * 1);
                        }
                        else
                        {
                           this.sound_step2.play(global.volume * 1);
                        }
                     }
                  }
               }
               if(this.hsp == 0 && this.buffer <= this.buffermax)
               {
                  if(this.sprite_index != "spr_standright" && this.sprite_index != "spr_standleft")
                  {
                     this.animation_index = 0;
                     this.animation_float = 0;
                     this.animation_speed = 0;
                     this.animation_max = 0;
                  }
                  if(this.dir == 0)
                  {
                     this.sprite_index = "spr_standright";
                  }
                  else
                  {
                     this.sprite_index = "spr_standleft";
                  }
               }
               if(this.hsp != 0 && this.buffer <= this.buffermax)
               {
                  if(this.sprite_index != "spr_runright" && this.sprite_index != "spr_runleft")
                  {
                     this.animation_index = 0;
                     this.animation_float = 0;
                     this.animation_speed = 0.3;
                     this.animation_max = 9;
                  }
                  if(this.dir == 0)
                  {
                     this.sprite_index = "spr_runright";
                  }
                  else
                  {
                     this.sprite_index = "spr_runleft";
                  }
               }
               if(this.buffer > this.buffermax && this.vsp <= 0)
               {
                  if(this.sprite_index != "spr_jumpright" && this.sprite_index != "spr_jumpleft")
                  {
                     this.animation_index = 0;
                     this.animation_float = 0;
                     this.animation_speed = 0.3;
                     this.animation_max = 1;
                  }
                  if(this.dir == 0)
                  {
                     this.sprite_index = "spr_jumpright";
                  }
                  else
                  {
                     this.sprite_index = "spr_jumpleft";
                  }
               }
               if(this.buffer > this.buffermax && this.vsp > 0)
               {
                  if(this.sprite_index != "spr_fallright" && this.sprite_index != "spr_fallleft")
                  {
                     this.animation_index = 0;
                     this.animation_float = 0;
                     this.animation_speed = 0.3;
                     this.animation_max = 1;
                  }
                  if(this.dir == 0)
                  {
                     this.sprite_index = "spr_fallright";
                  }
                  else
                  {
                     this.sprite_index = "spr_fallleft";
                  }
               }
            }
         }
         if(global.esc_pause == false && this.dead == true)
         {
            if(FP.world.typeCount("obj_playerdie") == 0)
            {
               if(global.sunglasses)
               {
                  FP.world.add(new obj_sunglasses(x + 32,y + 10,this.dir));
               }
               FP.world.add(new obj_playerdie());
            }
         }
         this.spr_player.play(this.sprite_index,true,this.animation_index);
      }
      
      override public function render() : void
      {
         var realx:Number = x;
         var realy:Number = y;
         x = Math.round(x);
         y = Math.round(y - 0.51);
         super.render();
         x = realx;
         y = realy;
      }
   }
}
