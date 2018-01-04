package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import flash.net.SharedObject;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   
   public class obj_achievement extends Entity
   {
       
      
      private const s_sbs3:Class = obj_achievement_s_sbs3;
      
      public var sound_achievement:Sfx;
      
      private var sharedOBJ:SharedObject;
      
      private const SPIKES:Class = obj_achievement_SPIKES;
      
      public var spr_icon:Spritemap;
      
      private const TB:Class = obj_achievement_TB;
      
      private const W:Class = obj_achievement_W;
      
      public var spr_box:Image;
      
      public var spr_white:Image;
      
      public var text:String = "";
      
      public var offset:Number = 0;
      
      public var up:Boolean = true;
      
      public var timer:int = 0;
      
      public var myTxt:Text;
      
      public var die:Boolean = false;
      
      public var wait:Boolean = false;
      
      public var myId:int;
      
      public var whiteAlpha:Number = 1;
      
      public var vsp:Number = 0;
      
      public function obj_achievement(id:int)
      {
         this.sound_achievement = new Sfx(this.s_sbs3);
         this.spr_icon = new Spritemap(this.SPIKES,20,20);
         this.myTxt = new Text("");
         super();
         this.myId = id;
         layer = -7998;
         type = "obj_achievement";
         if(id == 1)
         {
            this.text = "Thick Skull";
            if(global.achievement_1 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_1 = true;
            }
         }
         if(id == 2)
         {
            this.text = "Runaway Saw";
            if(global.achievement_2 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_2 = true;
            }
         }
         if(id == 3)
         {
            this.text = "See No Evil";
            if(global.achievement_3 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_3 = true;
            }
         }
         if(id == 4)
         {
            this.text = "Hear No Evil";
            if(global.achievement_4 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_4 = true;
            }
         }
         if(id == 5)
         {
            this.text = "Speak No Evil";
            if(global.achievement_5 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_5 = true;
            }
         }
         if(id == 6)
         {
            this.text = "Pushing Daisies";
            if(global.achievement_6 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_6 = true;
            }
         }
         if(id == 7)
         {
            this.text = "Treasure Hunter";
            if(global.achievement_7 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_7 = true;
            }
         }
         if(id == 8)
         {
            this.text = "You Hold The Key";
            if(global.achievement_8 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_8 = true;
            }
         }
         if(id == 9)
         {
            this.text = "Corrupt Beginnings";
            if(global.achievement_9 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_9 = true;
            }
         }
         if(id == 10)
         {
            this.text = "Escape";
            if(global.achievement_10 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_10 = true;
            }
         }
         if(id == 11)
         {
            this.text = "Sly";
            if(global.achievement_11 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_11 = true;
            }
         }
         if(id == 12)
         {
            this.text = "Untouchable";
            if(global.achievement_12 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_12 = true;
            }
         }
         if(id == 13)
         {
            this.text = "Slowpoke";
            if(global.achievement_13 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_13 = true;
            }
         }
         if(id == 14)
         {
            this.text = "King of Hell";
            if(global.achievement_14 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_14 = true;
            }
         }
         if(id == 15)
         {
            this.text = "Glutton For Punishment";
            if(global.achievement_15 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_15 = true;
            }
         }
         if(id == 16)
         {
            this.text = "Fast";
            if(global.achievement_16 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_16 = true;
            }
         }
         if(id == 17)
         {
            this.text = "Faster";
            if(global.achievement_17 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_17 = true;
            }
         }
         if(id == 18)
         {
            this.text = "Fastest";
            if(global.achievement_18 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_18 = true;
            }
         }
         if(id == 19)
         {
            this.text = "Trinket Collector";
            if(global.achievement_19 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_19 = true;
            }
         }
         if(id == 20)
         {
            this.text = "Champion";
            if(global.achievement_20 == true)
            {
               this.die = true;
            }
            else
            {
               global.achievement_20 = true;
            }
         }
         if(this.die == false)
         {
            this.sharedOBJ = SharedObject.getLocal("ld");
            this.Save();
            this.spr_icon.add("main",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);
            this.spr_icon.scale = 2;
            this.spr_box = new Image(this.TB);
            this.spr_box.scale = 2;
            this.spr_white = new Image(this.W);
            this.spr_white.scaleX = 2;
            this.spr_white.scaleY = 2;
            this.myTxt.size = 20;
            this.myTxt.text = this.text;
            graphic = this.myTxt;
            if(global.mute == false)
            {
               this.sound_achievement.play(global.volume);
            }
         }
      }
      
      public function Save() : void
      {
         this.sharedOBJ.data.achievement_1 = global.achievement_1;
         this.sharedOBJ.data.achievement_2 = global.achievement_2;
         this.sharedOBJ.data.achievement_3 = global.achievement_3;
         this.sharedOBJ.data.achievement_4 = global.achievement_4;
         this.sharedOBJ.data.achievement_5 = global.achievement_5;
         this.sharedOBJ.data.achievement_6 = global.achievement_6;
         this.sharedOBJ.data.achievement_7 = global.achievement_7;
         this.sharedOBJ.data.achievement_8 = global.achievement_8;
         this.sharedOBJ.data.achievement_9 = global.achievement_9;
         this.sharedOBJ.data.achievement_10 = global.achievement_10;
         this.sharedOBJ.data.achievement_11 = global.achievement_11;
         this.sharedOBJ.data.achievement_12 = global.achievement_12;
         this.sharedOBJ.data.achievement_13 = global.achievement_13;
         this.sharedOBJ.data.achievement_14 = global.achievement_14;
         this.sharedOBJ.data.achievement_15 = global.achievement_15;
         this.sharedOBJ.data.achievement_16 = global.achievement_16;
         this.sharedOBJ.data.achievement_17 = global.achievement_17;
         this.sharedOBJ.data.achievement_18 = global.achievement_18;
         this.sharedOBJ.data.achievement_19 = global.achievement_19;
         this.sharedOBJ.data.achievement_20 = global.achievement_20;
         this.sharedOBJ.data.allDeaths = global.allDeaths;
         this.sharedOBJ.data.flowerRub = global.flowerRub;
         this.sharedOBJ.data.speedrun_unlocked = global.speedrun_unlocked;
         this.sharedOBJ.data.sunglasses = global.sunglasses;
         this.sharedOBJ.data.sunglasses_unlocked = global.sunglasses_unlocked;
         this.sharedOBJ.data.music_unlocked = global.music_unlocked;
         this.sharedOBJ.flush();
      }
      
      override public function update() : void
      {
         super.update();
         if(this.die == false)
         {
            if(this.up == true)
            {
               this.spr_white.alpha = this.whiteAlpha;
               this.whiteAlpha = this.whiteAlpha - 0.02;
               if(this.whiteAlpha <= 0)
               {
                  this.timer = this.timer + 1;
                  this.whiteAlpha = 0;
               }
               this.offset = 32;
               if(this.timer > 90)
               {
                  this.whiteAlpha = 0;
                  this.up = false;
               }
            }
            else
            {
               this.vsp = this.vsp + 0.2;
               this.offset = this.offset - this.vsp;
               if(this.offset <= -64)
               {
                  this.die = true;
               }
            }
            this.spr_icon.play("main",true,this.myId);
         }
         if(this.die == true)
         {
            FP.world.remove(this);
         }
      }
      
      override public function render() : void
      {
         if(this.die == true)
         {
            FP.world.remove(this);
         }
         else
         {
            y = FP.camera.y + this.offset;
            x = FP.camera.x + 147;
            graphic = this.spr_box;
            super.render();
            y = FP.camera.y + this.offset - this.myTxt.height / 2 + 30 + 10;
            x = FP.camera.x + 320 - this.myTxt.width / 2 + 22;
            graphic = this.myTxt;
            super.render();
            graphic = this.spr_icon;
            y = FP.camera.y + this.offset + 32 - 20;
            x = FP.camera.x + 147 + 16;
            super.render();
            if(this.whiteAlpha > 0)
            {
               graphic = this.spr_white;
               y = FP.camera.y + this.offset;
               x = FP.camera.x + 147;
               super.render();
            }
         }
      }
   }
}
