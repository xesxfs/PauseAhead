package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   
   public class obj_replay extends Entity
   {
       
      
      private const REPLAY:Class = obj_replay_REPLAY;
      
      private const PLAYER2:Class = obj_replay_PLAYER2;
      
      public var sprite_index:Spritemap;
      
      public var frame:int = 0;
      
      public var record:Boolean = true;
      
      public var play:Boolean = false;
      
      public var a:Number = 0;
      
      public var i:Number = 0;
      
      public var pause:Array;
      
      public function obj_replay()
      {
         this.pause = new Array();
         super();
         if(global.sunglasses)
         {
            this.sprite_index = new Spritemap(this.PLAYER2,64,62);
         }
         else
         {
            this.sprite_index = new Spritemap(this.REPLAY,64,62);
         }
         global.recording_id = global.recording_id + 1;
         this.sprite_index.add("spr_runright",[0,1,2,3,4,5,6,7,8,9]);
         this.sprite_index.add("spr_standright",[10]);
         this.sprite_index.add("spr_jumpright",[11,12]);
         this.sprite_index.add("spr_fallright",[13,14]);
         this.sprite_index.add("spr_runleft",[15,16,17,18,19,20,21,22,23,24]);
         this.sprite_index.add("spr_standleft",[25]);
         this.sprite_index.add("spr_jumpleft",[26,27]);
         this.sprite_index.add("spr_fallleft",[28,29]);
         graphic = this.sprite_index;
         layer = -50;
         type = "obj_replay";
         Input.define("SPACE",Key.SPACE,Key.DOWN);
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         super.update();
         if(global.pause == false && this.record == true && global.master.player_freeze == false && global.esc_pause == false)
         {
            if(FP.world.typeCount("player") != 0)
            {
               global.playerdust2.push(global.playerdust);
               global.playerdust1[global.recording_id] = global.playerdust2;
               global.playerx2.push(global.player.x);
               global.playerx1[global.recording_id] = global.playerx2;
               global.playery2.push(Math.round(global.player.y - 0.51));
               global.playery1[global.recording_id] = global.playery2;
               global.playersprite2.push(global.player.sprite_index);
               global.playersprite1[global.recording_id] = global.playersprite2;
               global.playerframe2.push(global.player.animation_index);
               global.playerframe1[global.recording_id] = global.playerframe2;
               this.frame = this.frame + 1;
            }
            if(FP.world.typeCount("obj_playerdie") != 0)
            {
               global.playersprite2.push("playerdie");
               global.playersprite1[global.recording_id] = global.playersprite2;
            }
         }
         if(this.record == true && global.master.player_freeze == false && global.esc_pause == false)
         {
            if(global.pause == false)
            {
               this.pause.push(false);
            }
            else
            {
               this.pause[Math.max(this.frame - 13,0)] = true;
            }
         }
         global.frame[global.recording_id] = this.frame + 1;
         if(this.play == true)
         {
            this.a = this.a + 1;
         }
         if(this.play == true && this.a > 5 && Input.pressed("SPACE") && global.esc_pause == false)
         {
            if(FP.world.typeCount("obj_transition") == 0)
            {
               t = new obj_transition();
               world.add(t);
               t.clear = true;
               t.goto = global.level + 1;
               if(global.level == 24)
               {
                  t.goto = 7;
               }
               if(global.level == 25)
               {
                  t.goto = 14;
               }
               if(global.level == 26)
               {
                  t.goto = 20;
               }
            }
         }
      }
      
      override public function render() : void
      {
         var b:int = 0;
         var z:int = 0;
         var thing:obj_playerdie = null;
         var t:obj_transition = null;
         var newstr:String = null;
         if(this.play == true && global.master.player_freeze == false)
         {
            b = 0;
            z = 0;
            while(z < global.recording_id)
            {
               z = z + 1;
               if(this.i < global.frame[z])
               {
                  if(global.playersprite1[z][Math.min(this.i,global.frame[z])] != "playerdie")
                  {
                     this.sprite_index.play(global.playersprite1[z][Math.min(this.i,global.frame[z])],true,global.playerframe1[z][Math.min(this.i,global.frame[z])]);
                     x = global.playerx1[z][Math.min(this.i,global.frame[z])];
                     y = global.playery1[z][Math.min(this.i,global.frame[z])];
                     super.render();
                     if(this.i > 0)
                     {
                        if(global.playerdust1[z][Math.min(this.i,global.frame[z])] == 2)
                        {
                           FP.world.add(new obj_landcloud(x + 32,y + 62));
                        }
                        if(global.playerdust1[z][Math.min(this.i,global.frame[z])] == 1)
                        {
                           x = global.playerx1[z][Math.min(this.i,global.frame[z])];
                           y = global.playery1[z][Math.min(this.i,global.frame[z])];
                           FP.world.add(new obj_jumpcloud(x + 32,y + 62 + 12.4));
                        }
                     }
                  }
                  else
                  {
                     if(global.sunglasses)
                     {
                        newstr = global.playersprite1[z][Math.min(this.i - 1,global.frame[z])];
                        if(newstr.charAt(newstr.length - 2) == "h")
                        {
                           FP.world.add(new obj_sunglasses(global.playerx1[z][Math.min(this.i - 1,global.frame[z])] + 32,global.playery1[z][Math.min(this.i - 1,global.frame[z])] + 10,0));
                        }
                        else
                        {
                           FP.world.add(new obj_sunglasses(global.playerx1[z][Math.min(this.i - 1,global.frame[z])] + 32,global.playery1[z][Math.min(this.i - 1,global.frame[z])] + 10,1));
                        }
                     }
                     thing = new obj_playerdie();
                     world.add(thing);
                     thing.x = global.playerx1[z][Math.min(this.i - 1,global.frame[z])] - 64 + 32;
                     thing.y = global.playery1[z][Math.min(this.i - 1,global.frame[z])] - 68;
                  }
               }
               if(this.i > global.frame[z] + 10)
               {
                  b = b + 1;
               }
            }
            if(b == global.recording_id)
            {
               if(FP.world.typeCount("obj_transition") == 0)
               {
                  t = new obj_transition();
                  world.add(t);
                  t.clear = true;
                  t.goto = global.level + 1;
                  if(global.level == 24)
                  {
                     t.goto = 7;
                  }
                  if(global.level == 25)
                  {
                     t.goto = 14;
                  }
                  if(global.level == 26)
                  {
                     t.goto = 20;
                  }
               }
            }
            global.mycamera.ax = global.playerx1[global.recording_id][Math.min(this.i,global.frame[global.recording_id])];
            global.mycamera.ay = global.playery1[global.recording_id][Math.min(this.i,global.frame[global.recording_id])];
            if(global.pause == false && global.esc_pause == false)
            {
               this.i = this.i + 1;
            }
         }
      }
   }
}
