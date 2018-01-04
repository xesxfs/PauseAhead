package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.utils.Draw;
   
   public class obj_master extends Entity
   {
       
      
      private const TB:Class = obj_master_TB;
      
      public var spr_timerback:Image;
      
      private const LB:Class = obj_master_LB;
      
      public var spr_levelback:Image;
      
      private const PP:Class = obj_master_PP;
      
      public var spr_pause:Image;
      
      public var i:Number = 0;
      
      public var textbox:obj_textbox;
      
      public var player_freeze:Boolean = false;
      
      public var counter:Number = 0;
      
      public var timeout:Boolean = false;
      
      public var time:String = "";
      
      public var minute:Number = 1;
      
      public var second:Number = 0;
      
      public var ptxt:String = "GAME PAUSED";
      
      public var pnum:String = "";
      
      public var myTxt:Text;
      
      public var aaaa:Boolean = false;
      
      public var statsTxt:Text;
      
      public var stats:String = "";
      
      private const TICK1:Class = obj_master_TICK1;
      
      public var sound_tick1:Sfx;
      
      private const TICK2:Class = obj_master_TICK2;
      
      public var sound_tick2:Sfx;
      
      private const TICK3:Class = obj_master_TICK3;
      
      public var sound_tick3:Sfx;
      
      private const PAUZ:Class = obj_master_PAUZ;
      
      public var sound_pause:Sfx;
      
      public function obj_master()
      {
         this.myTxt = new Text("");
         this.statsTxt = new Text("");
         this.sound_tick1 = new Sfx(this.TICK1);
         this.sound_tick2 = new Sfx(this.TICK2);
         this.sound_tick3 = new Sfx(this.TICK3);
         this.sound_pause = new Sfx(this.PAUZ);
         super();
         this.spr_timerback = new Image(this.TB);
         this.spr_levelback = new Image(this.LB);
         this.spr_pause = new Image(this.PP);
         this.spr_pause.scaleX = 640 + 10;
         this.spr_pause.scaleY = 480 + 10;
         global.pause = false;
         global.esc_pause = false;
         if(global.level == 1)
         {
            this.minute = 0;
            this.second = 20;
            if(global.level_1_text == true)
            {
               this.i = 20;
            }
            global.level_1_text = true;
         }
         if(global.level == 2)
         {
            this.minute = 0;
            this.second = 25;
            if(global.level_2_text == true)
            {
               this.i = 20;
            }
            global.level_2_text = true;
         }
         if(global.level == 3)
         {
            this.minute = 0;
            this.second = 15;
            if(global.level_3_text == true)
            {
               this.i = 20;
            }
            global.level_3_text = true;
         }
         if(global.level == 4)
         {
            this.minute = 0;
            this.second = 30;
            if(global.level_4_text == true)
            {
               this.i = 20;
            }
            global.level_4_text = true;
         }
         if(global.level == 5)
         {
            global.gaplevel++;
            this.minute = 0;
            this.second = 20;
            if(global.level_5_text == true)
            {
            }
            global.level_5_text = true;
         }
         if(global.level == 6)
         {
            this.minute = 0;
            this.second = 30;
            if(global.level_6_text == true)
            {
               this.i = 20;
            }
            global.level_6_text = true;
         }
         if(global.level == 7)
         {
            this.minute = 0;
            this.second = 20;
            if(global.level_7_text == true)
            {
               this.i = 20;
            }
            global.level_7_text = true;
         }
         if(global.level == 8)
         {
            this.minute = 0;
            this.second = 15;
            if(global.level_8_text == true)
            {
               this.i = 20;
            }
            global.level_8_text = true;
         }
         if(global.level == 9)
         {
            this.minute = 0;
            this.second = 25;
            if(global.level_9_text == true)
            {
               this.i = 20;
            }
            global.level_9_text = true;
         }
         if(global.level == 10)
         {
            this.minute = 1;
            this.second = 0;
            if(global.level_10_text == true)
            {
               this.i = 20;
            }
            global.level_10_text = true;
         }
         if(global.level == 11)
         {
            this.minute = 0;
            this.second = 20;
            if(global.level_11_text == true)
            {
               this.i = 20;
            }
            global.level_11_text = true;
         }
         if(global.level == 12)
         {
            this.minute = 0;
            this.second = 20;
            if(global.level_12_text == true)
            {
               this.i = 20;
            }
            global.level_12_text = true;
         }
         if(global.level == 13)
         {
            this.minute = 0;
            this.second = 20;
            if(global.level_13_text == true)
            {
               this.i = 20;
            }
            global.level_13_text = true;
         }
         if(global.level == 14)
         {
            this.minute = 0;
            this.second = 1;
            if(global.level_14_text == true)
            {
               this.i = 20;
            }
            global.level_14_text = true;
         }
         if(global.level == 15)
         {
            this.minute = 0;
            this.second = 1;
            if(global.level_15_text == true)
            {
               this.i = 20;
            }
            global.level_15_text = true;
         }
         if(global.level == 16)
         {
            this.minute = 0;
            this.second = 1;
            if(global.level_16_text == true)
            {
               this.i = 20;
            }
            global.level_16_text = true;
         }
         if(global.level == 17)
         {
            this.minute = 0;
            this.second = 1;
            if(global.level_17_text == true)
            {
               this.i = 20;
            }
            global.level_17_text = true;
         }
         if(global.level == 18)
         {
            this.minute = 0;
            this.second = 1;
            if(global.level_18_text == true)
            {
               this.i = 20;
            }
            global.level_18_text = true;
         }
         if(global.level == 19)
         {
            this.minute = 2;
            this.second = 45;
            if(global.level_19_text == true)
            {
               this.i = 20;
            }
            global.level_19_text = true;
         }
         if(global.level == 20)
         {
            this.minute = 9;
            this.second = 45;
            if(global.level_20_text == true)
            {
               this.i = 20;
            }
            global.level_20_text = true;
         }
         if(global.level == 21)
         {
            this.minute = 9;
            this.second = 45;
            if(global.level_21_text == true)
            {
               this.i = 20;
            }
            global.level_21_text = true;
         }
         if(global.level == 22)
         {
            this.minute = 9;
            this.second = 45;
            if(global.level_22_text == true)
            {
               this.i = 20;
            }
            global.level_22_text = true;
         }
         if(global.level == 23)
         {
            this.minute = 9;
            this.second = 45;
            if(global.level_23_text == true)
            {
               this.i = 20;
            }
            global.level_23_text = true;
         }
         if(global.level == 24)
         {
            this.minute = 9;
            this.second = 45;
            this.i = 20;
         }
         if(global.level == 25)
         {
            this.minute = 9;
            this.second = 45;
            this.i = 20;
         }
         if(global.level == 26)
         {
            this.minute = 9;
            this.second = 45;
            this.i = 20;
         }
         if(global.level == 27)
         {
            this.minute = 9;
            this.second = 45;
            global.level_27_text = true;
            if(global.helltext != 0 && global.helltext != 2 && global.helltext != 4)
            {
               this.i = 20;
            }
         }
         if(global.speedrunning == true)
         {
            if(global.level != 1)
            {
               this.i = 20;
            }
         }
         layer = -500;
         type = "master";
         Input.define("PAUSE",Key.SHIFT,Key.C);
         Input.define("PAUSE2",Key.ESCAPE);
         Input.define("SPACE",Key.SPACE,Key.DOWN);
         this.pnum = "";
         if(global.playernumber < 10)
         {
            this.pnum = this.pnum + "0";
         }
         this.pnum = this.pnum + global.playernumber;
      }
      
      public function god_text(numb:int, txt:String) : void
      {
         if(this.i == numb)
         {
            if(FP.world.typeCount("obj_textbox") == 0)
            {
               this.textbox = new obj_textbox(txt);
               world.add(this.textbox);
            }
            else if(FP.world.typeCount("obj_textbox") != 0 && (Input.pressed("SPACE") || Input.pressed(Key.S) || Input.pressed(Key.Z) || Input.pressed(Key.DOWN)) && this.textbox.destroy == false && this.textbox.text == txt)
            {
               this.textbox.destroy = true;
               this.i = numb + 1;
            }
         }
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         var zz:obj_escpause = null;
         var myListz:Array = null;
         var bbz:obj_shadowplayer = null;
         if(FP.world.typeCount("obj_textbox") != 0)
         {
            this.aaaa = true;
         }
         if(global.esc_pause == false)
         {
            if(this.player_freeze == false)
            {
               global.delay = global.delay - 1;
            }
            super.update();
            if(global.level == 1 && global.speedrunning == false)
            {
               if(global.sunglasses)
               {
                  if(global.achievement_5 == false)
                  {
                     global.achievementQueue.push(5);
                  }
                  this.god_text(0,"[Press SPACE or\nDOWN to continue]");
                  this.god_text(1,"I awake in a dark place.");
                  this.god_text(2,"Even darker than usual.");
                  this.god_text(3,"The number \'" + this.pnum + "\' is tatooed\nacross my shoulder.");
                  this.god_text(4,"I should probably go through\nthat door at some point.");
                  this.god_text(5,"If I feel like jumping, I\'ll\n press [UP] or [SPACE]");
                  this.god_text(6,"And press [DOWN] or\n[SPACE] at the door.");
               }
               else
               {
                  this.god_text(0,"[Press SPACE or\nDOWN to continue]");
                  this.god_text(1,"I awake in a dark place.");
                  this.god_text(2,"The number \'" + this.pnum + "\' is branded\non my palm.");
                  this.god_text(3,"My thoughts are not on\nhow I arrived");
                  this.god_text(4,"But how I escape.");
                  this.god_text(5,"Perhaps pressing [UP] or\n[SPACE] to jump ");
                  this.god_text(6,"And pressing [DOWN] or\n[SPACE] at the door.");
               }
               if(this.i <= 6)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 1 && global.speedrunning == true)
            {
               this.god_text(0,"Welcome to speedrun mode.");
               this.god_text(1,"There will be no dialogue\nin this mode.");
               this.god_text(2,"The counter will keep ticking\nwhile the game is paused.");
               this.god_text(3,"Pressing [ESC] will reset\nyou here.");
               this.god_text(4,"Collect the trinkets.");
               this.god_text(5,"Good luck!");
               if(this.i <= 5)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 2)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Looking at the sheer drop,\nI realize");
                  this.god_text(1,"My hair will almost certainly\nbe messed up.");
                  this.god_text(2,"I just ran out of product too.");
               }
               else
               {
                  this.god_text(0,"Well, that didn\'t help much.");
                  this.god_text(1,"Looking at the sheer drop,\nI realize");
                  this.god_text(2,"At least I won\'t come this\nway again.");
               }
               if(this.i <= 2)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 3)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"I feel a rush of deja vu.");
                  this.god_text(1,"I feel a rush of deja vu.");
                  this.god_text(2,"I feel a rush of........");
                  this.god_text(3,"Deja vu.");
                  if(this.i <= 3)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"I feel a rush of deja vu");
                  this.god_text(1,"Not of memories, but of\npast lives");
                  this.god_text(2,"Most of which did not\nlast long.");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 4)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"I borrowed these from my\nfriend Bowser.");
                  this.god_text(1,"Really livens up the place,\ndon\'t you think?");
               }
               else
               {
                  this.god_text(0,"Whoever thought to keep\nme here");
                  this.god_text(1,"Is trying much too hard.");
               }
               if(this.i <= 1)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 5)
            {
               if(global.gaplevel == 1)
               {
                  if(global.sunglasses)
                  {
                     this.god_text(0,"Bridging this gap will\nrequire some hax.");
                     this.god_text(1,"Press [SHIFT] or [C] to break\nthe game at any time, you\ndirty cheater.");
                  }
                  else
                  {
                     this.god_text(0,"Bridging this gap will\nrequire some rest.");
                     this.god_text(1,"Press [SHIFT] or [C]\nto pause at any time.");
                  }
                  if(this.i <= 1)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 3)
               {
                  this.god_text(0,"I remind myself to press\n[SHIFT] or [C] to pause.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 5)
               {
                  this.god_text(0,"Pressing [SHIFT] or [C] to\npause might help me\ncross this gap.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 7)
               {
                  this.god_text(0,"I really should consider pressing\n[SHIFT] or [C] to pause.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 9)
               {
                  this.god_text(0,"You can\'t be serious.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 11)
               {
                  this.god_text(0,"My perseverance is laudable");
                  this.god_text(1,"But maybe I\'d prefer a\nslower game");
                  this.god_text(2,"Sudoku, perhaps?");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 13)
               {
                  this.god_text(0,"I remind myself there are\nwalkthroughs online.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 15)
               {
                  this.god_text(0,"My self-loathing continues\nunabated.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel == 17)
               {
                  if(global.achievement_1 == false)
                  {
                     global.achievementQueue.push(1);
                  }
                  this.god_text(0,"I consider pressing [ESC]\nto quit the game.");
                  if(this.i <= 0)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               if(global.gaplevel != 1 && global.gaplevel != 3 && global.gaplevel != 5 && global.gaplevel != 7 && global.gaplevel != 9 && global.gaplevel != 11 && global.gaplevel != 13 && global.gaplevel != 15 && global.gaplevel != 17)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 6)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"It seems that time and space\nin this place are an illusion.");
                  this.god_text(1,"However my swag is VERY REAL.");
                  this.god_text(2,"THE REALEST.");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"Time and space in this place\nare an illusion.");
                  this.god_text(1,"Perhaps matter can be conquered\nas well.");
                  if(this.i <= 1)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 7)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Time here seems... malleable");
                  this.god_text(1,"But also more scarce.");
                  this.god_text(2,"I know because I counted it.");
               }
               else
               {
                  this.god_text(0,"Time here seems... malleable");
                  this.god_text(1,"But also more scarce.");
                  this.god_text(2,"I must spend it wisely.");
               }
               if(this.i <= 2)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 8)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"I\'m flattered by all\nthis commotion.");
                  this.god_text(1,"It\'s like all these spikes are\nmy own personal fan club.");
               }
               else
               {
                  this.god_text(0,"All this commotion to\nbar my path.");
                  this.god_text(1,"It\'s quite flattering,\nreally. ");
               }
               if(this.i <= 1)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 9)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"My sojourn stops here.");
                  this.god_text(1,"This is a game you cannot win.");
                  this.god_text(2,"Unless you get to the last\nlevel, and beat that level.");
                  this.god_text(3,"Then I guess you would win.");
                  this.god_text(4,"But you won\'t do it. I mean,\nyou\'ve definitely never done\nsuch a thing before.");
                  if(this.i <= 4)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"I\'m impressed you\'ve made it\nthis far");
                  this.god_text(1,"But my sojourn stops here.");
                  this.god_text(2,"This is a game you cannot win.");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 10)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Think for a second...");
                  this.god_text(1,"Who is in control?");
                  this.god_text(2,"Who built this world?");
                  this.god_text(3,"Whoever they are, their\ntaste in decor is terrible.");
                  this.god_text(4,"The purple bricks totally\nclash with my outfit.");
                  this.god_text(5,"And don\'t get me started\non the landscaping.");
                  if(this.i <= 5)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"Think for a second...");
                  this.god_text(1,"Who is in control?");
                  this.god_text(2,"Who built this world?");
                  this.god_text(3,"You die upon spikes. You die\nwhen time runs dry.");
                  this.god_text(4,"You return to life, time and\ntime again.");
                  this.god_text(5,"You\'re playing by my rules.");
                  if(this.i <= 5)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 11)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Don\'t fool yourself, you are\nmerely a rat in a maze.");
                  this.god_text(1,"Well actually, you\'re some\nwolf thing.");
                  if(this.i <= 1)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"I hope you\'re not fooling\nyourself.");
                  this.god_text(1,"Everything proceeds exactly\nas it should.");
                  this.god_text(2,"You are merely a rat in a maze.");
                  this.god_text(3,"Keep it up and you might even\nget some cheese.");
                  if(this.i <= 3)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 12)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Don\'t worry. I\'ve no doubt\nthat you\'ll reach the end...");
                  this.god_text(1,"...of this text box!");
                  this.god_text(2,"WHAT NOW!!!");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"Don\'t worry. I\'ve no doubt\nthat you\'ll reach the end.");
                  this.god_text(1,"As long as there is hope,\nyou won\'t give up.");
                  this.god_text(2,"That\'s why you\'ve made it this\nfar, isn\'t it?");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 13)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"You must expect a reward at the\nend of this journey.");
                  this.god_text(1,"Usually it\'s something like a kiss\nfrom a damsel.");
                  this.god_text(2,"But, I guess the Architect will\nhave to do.");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"You must expect a reward at the\nend of this journey...");
                  this.god_text(1,"You\'re sorely mistaken.");
                  this.god_text(2,"Once you leave this cave you\nwill cease to exist.");
                  this.god_text(3,"You should probably just\ngive up now.");
                  if(this.i <= 3)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 14)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"See how scarce your time grows?");
                  this.god_text(1,"You can try to push back\nthe clock.");
                  this.god_text(2,"But that\'s just Daylight\nSavings Time, isn\'t it.");
               }
               else
               {
                  this.god_text(0,"Your time grows scarce.");
                  this.god_text(1,"You can try to push back\nthe clock.");
                  this.god_text(2,"But that\'s just denial,\nisn\'t it.");
               }
               if(this.i <= 2)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 15)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"You\'re no less of a puppet\nthan I.");
                  this.god_text(1,"In fact, you are more of a\npuppet than me.");
                  this.god_text(2,"2% to be exact.");
               }
               else
               {
                  this.god_text(0,"You\'re no less of a puppet\nthan I.");
                  this.god_text(1,"Which begs the question,");
                  this.god_text(2,"Who is your puppeteer?");
               }
               if(this.i <= 2)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 16)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"No matter what you do,\nI win.");
                  this.god_text(1,"I have been playing a game\ncalled \'Don\'t Pause\'.");
                  this.god_text(2,"Every time you pause you lose.");
                  this.god_text(3,"Whoops...");
               }
               else
               {
                  this.god_text(0,"No matter what you do now,\nI win.");
                  this.god_text(1,"It is either obedience or\nabandonment,");
                  this.god_text(2,"So I ask again...");
                  this.god_text(3,"Who is in control?");
               }
               if(this.i <= 3)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 17)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Your time is drawing near...");
                  this.god_text(1,"It\'s getting closer...");
                  this.god_text(2,"Closer...");
                  this.god_text(3,"CLOSER...");
                  this.god_text(4,"Further...");
                  this.god_text(5,"NOW IT\'S GETTING CLOSER AGAIN");
               }
               else
               {
                  this.god_text(0,"Your time is drawing near.");
                  this.god_text(1,"The end of existence.");
                  this.god_text(2,"Nothingness.");
                  this.god_text(3,"I do hope it was worth it?");
                  this.god_text(4,"To willingly be a rat in a\nmaze...");
                  this.god_text(5,"For a reward you desperately\nhope exists.");
               }
               if(this.i <= 5)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 18)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"...");
                  this.god_text(1,"........... ");
                  this.god_text(2,"..................");
                  this.god_text(3,"Whaaaaaat?");
                  this.god_text(4,"Do I have to say something\nEVERY time?");
               }
               else
               {
                  this.god_text(0,"...");
                  this.god_text(1,"You have conquered thus far... ");
                  this.god_text(2,"But no further.");
                  this.god_text(3,"You are not warned lightly.");
                  this.god_text(4,"Cease now.");
               }
               if(this.i <= 4)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 19)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"OK, here are some pro-gaming\ntips for you.");
                  this.god_text(1,"Keep walking right.");
                  this.god_text(2,"By the way, this level is one\nof the hardest in the game.");
                  this.god_text(3,"Good luck");
                  if(this.i <= 3)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
               else
               {
                  this.god_text(0,"I am foreign to what fervor\ndrives you");
                  this.god_text(1,"But it is entirely misplaced.");
                  this.god_text(2,"You cannot be here. ");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0)
                  {
                     this.player_freeze = false;
                  }
               }
            }
            if(global.level == 20)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Please...Stop");
                  this.god_text(1,"Can you remain indifferent?");
                  this.god_text(2,"This world is decaying.");
                  this.god_text(3,"Soon there will be nothing\nbut you...");
                  this.god_text(4,"...and MISTER BIG KISSES");
               }
               else
               {
                  this.god_text(0,"Please...Stop");
                  this.god_text(1,"Can you remain indifferent?");
                  this.god_text(2,"This world is decaying.");
                  this.god_text(3,"Soon there will be nothing\nbut you...");
                  this.god_text(4,"...and it.");
               }
               if(this.i <= 4)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 21)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"[Press SPACE or\nDOWN to continue]");
                  this.god_text(1,"I awake in a dark place.");
                  this.god_text(2,"Even darker than usual.");
                  this.god_text(3,"The number \'" + this.pnum + "\' is tatooed\nacross my shoulder.");
                  this.god_text(4,"I should probably go through\nthat door at some point.");
                  this.god_text(5,"If I feel like jumping, I\'ll\n press [UP] or [SPACE]");
                  this.god_text(6,"And press [DOWN] or\n[SPACE] at the door.");
               }
               else
               {
                  this.god_text(0,"[Press SPACE or\nDOWN to continue]");
                  this.god_text(1,"I awake in a dark place.");
                  this.god_text(2,"The number \'" + this.pnum + "\' is branded\non my palm.");
                  this.god_text(3,"My thoughts are not on\nhow I arrived");
                  this.god_text(4,"But how I escape.");
                  this.god_text(5,"Perhaps pressing [UP] or\n[SPACE] to jump ");
                  this.god_text(6,"And pressing [DOWN] or\n[SPACE] at the door.");
               }
               if(this.i <= 6)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
               this.player_freeze = false;
            }
            if(global.level == 22)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Hey. Stop.");
                  this.god_text(1,"Don\'t go through that door.");
                  this.god_text(2,"Please.");
                  this.god_text(3,"Please stop.");
                  this.god_text(4,"Please.");
                  this.god_text(5,"Because I\'d WAYYY rather watch you\nfail at the extra stage a million\nmore times.");
               }
               else
               {
                  this.god_text(0,"Hey. Stop.");
                  this.god_text(1,"Don\'t go through that door.");
                  this.god_text(2,"Please.");
                  this.god_text(3,"Please stop.");
                  this.god_text(4,"Please.");
                  this.god_text(5,"Don\'t...");
               }
               if(this.i <= 5)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
               this.player_freeze = false;
            }
            if(global.level == 23)
            {
               if(global.sunglasses)
               {
                  this.god_text(0,"Are you nervous...?");
                  this.god_text(1,"Don\'t be...");
                  this.god_text(2,"The Architect is a real\nsweetheart.");
               }
               else
               {
                  this.god_text(0,"So you have come...");
                  this.god_text(1,"Beware the hands that\nbuilt your tomb.");
                  this.god_text(2,"The Architect awaits.");
               }
               if(this.i <= 2)
               {
                  this.player_freeze = true;
               }
               else if(FP.world.typeCount("obj_textbox") == 0)
               {
                  this.player_freeze = false;
               }
            }
            if(global.level == 27)
            {
               if(global.helltext == 0)
               {
                  this.god_text(0,"You have made a terrible mistake.");
                  this.god_text(1,"Welcome to the belly of the beast");
                  if(this.i <= 1)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0 && this.aaaa)
                  {
                     global.helltext = 1;
                     this.player_freeze = false;
                     this.i = 20;
                  }
               }
               if(global.helltext == 2 && this.i < 20)
               {
                  this.god_text(0,"Its appetite is all-consuming.");
                  this.god_text(1,"Your splintered soul will be\nits repast.");
                  if(this.i <= 1)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0 && this.aaaa)
                  {
                     global.helltext = 3;
                     this.player_freeze = false;
                     this.i = 20;
                  }
               }
               if(global.helltext == 4 && this.i < 20)
               {
                  this.god_text(0,"Your hunger truly dwarfs mine.");
                  this.god_text(1,"Go, then.");
                  this.god_text(2,"Reap what it has sown.");
                  if(this.i <= 2)
                  {
                     this.player_freeze = true;
                  }
                  else if(FP.world.typeCount("obj_textbox") == 0 && this.aaaa)
                  {
                     this.i = 20;
                     global.helltext = 5;
                     this.player_freeze = false;
                  }
               }
               if(global.helltext != 0 && global.helltext != 2 && global.helltext != 4)
               {
                  this.player_freeze = false;
               }
            }
            if(global.replay.play == false)
            {
               if(global.pause == false && this.player_freeze == false && this.minute < 9)
               {
                  if(FP.world.typeCount("player") != 0 && FP.world.classCount(obj_transition) == 0)
                  {
                     this.counter = this.counter + 1 / 60;
                  }
                  if(this.counter >= 1)
                  {
                     this.second = this.second - 1;
                     if(this.second <= 10 && this.second > 5 && this.minute == 0)
                     {
                        if(global.mute == false)
                        {
                           this.sound_tick1.play(global.volume * 1);
                        }
                     }
                     if(this.second <= 5 && this.second >= 0 && this.minute == 0)
                     {
                        if(global.mute == false)
                        {
                           this.sound_tick2.play(global.volume * 1);
                        }
                     }
                     if(this.second == -1 && this.minute == 0)
                     {
                        if(global.mute == false)
                        {
                           this.sound_tick3.play(global.volume * 1);
                        }
                     }
                     if(this.second < 0)
                     {
                        this.second = 59;
                        this.minute = this.minute - 1;
                     }
                     if(this.minute < 0 && this.timeout == false)
                     {
                        this.timeout = true;
                        global.player.dead = true;
                     }
                     this.counter = 0;
                  }
               }
            }
            if(FP.world.typeCount("player") == 0 && FP.world.typeCount("obj_playerdie") == 0 && global.replay.play == false)
            {
               if(FP.world.typeCount("obj_transition") == 0)
               {
                  t = new obj_transition();
                  world.add(t);
                  t.clear = false;
                  t.goto = global.level;
               }
            }
            if(Input.pressed("PAUSE"))
            {
               if(this.player_freeze == false)
               {
                  global.pause = !global.pause;
                  if(global.mute == false && global.replay.play == false)
                  {
                     this.sound_pause.play(global.volume * 1);
                  }
               }
               if(FP.world.typeCount("player") == 0)
               {
                  global.pause = false;
               }
            }
         }
         if(global.speedrunning == false)
         {
            if(Input.pressed("PAUSE2"))
            {
               global.esc_pause = !global.esc_pause;
            }
         }
         else if(Input.pressed("PAUSE2"))
         {
            if(global.level == 1)
            {
               if(FP.world.typeCount("obj_transition") == 0)
               {
                  global.level_speedrun_text = false;
                  t = new obj_transition();
                  world.add(t);
                  t.clear = false;
                  t.goto = -1;
               }
            }
            else if(FP.world.typeCount("obj_transition") == 0)
            {
               t = new obj_transition();
               world.add(t);
               t.clear = true;
               t.goto = 1;
               if(global.level == 23)
               {
                  myListz = new Array();
                  FP.world.getClass(obj_shadowplayer,myListz);
                  for each(bbz in myListz)
                  {
                     FP.world.remove(bbz);
                  }
               }
            }
         }
         if(global.esc_pause == true)
         {
            if(FP.world.typeCount("obj_escpause") == 0)
            {
               zz = new obj_escpause();
               world.add(zz);
               world.add(new obj_escresume());
               world.add(new obj_escmute());
               world.add(new obj_escblur());
               world.add(new obj_escquit());
            }
         }
         if(global.esc_pause == false && global.replay.play == false && global.master.player_freeze == false)
         {
            if(!(global.level == 27 && FP.world.classCount(obj_blackfade2) != 0))
            {
               global.gametime[global.level - 1] = global.gametime[global.level - 1] + 1;
               if(global.speedrunning && global.level != 1)
               {
                  global.speedrun_time = global.speedrun_time + 1;
               }
            }
         }
      }
      
      override public function render() : void
      {
         var iz:int = 0;
         this.time = "";
         if(this.minute < 10)
         {
            this.time = this.time + "0";
         }
         this.time = this.time + String(this.minute);
         this.time = this.time + ":";
         if(this.second < 10)
         {
            this.time = this.time + "0";
         }
         this.time = this.time + String(this.second);
         if(this.timeout == true)
         {
            this.time = "00:00";
         }
         if(global.replay.play == false)
         {
            if(this.minute < 9)
            {
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  x = FP.camera.x;
                  y = FP.camera.y;
                  graphic = this.spr_timerback;
                  super.render();
               }
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  x = FP.camera.x + 640 - 150;
                  y = FP.camera.y;
                  graphic = this.spr_levelback;
                  super.render();
               }
               this.myTxt.size = 30;
               this.myTxt.align = "center";
               this.myTxt.text = this.time;
               graphic = this.myTxt;
               x = FP.camera.x + 50 - this.myTxt.width / 2;
               y = FP.camera.y + 20 - this.myTxt.height / 2;
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  super.render();
               }
               this.myTxt.align = "center";
               this.myTxt.text = "Level " + global.level;
               graphic = this.myTxt;
               x = FP.camera.x + 640 - 75 - this.myTxt.width / 2;
               y = FP.camera.y + 20 - this.myTxt.height / 2;
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  super.render();
               }
            }
         }
         else
         {
            this.time = "REPLAY. PRESS SPACE TO SKIP";
            this.myTxt.size = 30;
            this.myTxt.align = "center";
            this.myTxt.text = this.time;
            graphic = this.myTxt;
            x = FP.camera.x + 320 - this.myTxt.width / 2;
            y = FP.camera.y + 40 - this.myTxt.height / 2 - 7;
            if(FP.world.typeCount("obj_blacktext") == 0)
            {
               Draw.rect(FP.camera.x + 320 - Text(graphic).width / 2 - 3,FP.camera.y + 40 - Text(graphic).height / 2 - 6,Text(graphic).width + 3,Text(graphic).height - 6,0,1,false);
            }
            if(FP.world.typeCount("obj_blacktext") == 0)
            {
               super.render();
            }
         }
         if(global.pause == true)
         {
            x = FP.camera.x - 5;
            y = FP.camera.y - 5;
            graphic = this.spr_pause;
            super.render();
            this.myTxt.size = 30;
            this.myTxt.align = "center";
            this.myTxt.text = this.ptxt;
            graphic = this.myTxt;
            x = FP.camera.x + 320 - this.myTxt.width / 2;
            y = FP.camera.y + 240 - this.myTxt.height / 2;
            super.render();
         }
         if(global.pause == false && global.level >= 9 && global.level < 18)
         {
            iz = 0;
            iz = Math.round(Math.random() * 51);
            if(iz == 0)
            {
               this.ptxt = "GAME PAUSED";
            }
            if(iz == 1)
            {
               this.ptxt = "PAME GAUSED";
            }
            if(iz == 2)
            {
               this.ptxt = "EMAG DESUAP";
            }
            if(iz == 3)
            {
               this.ptxt = "MGEA DEUPAS";
            }
            if(iz == 4)
            {
               this.ptxt = "GREAT JOB";
            }
            if(iz == 5)
            {
               this.ptxt = "WAITING";
            }
            if(iz == 6)
            {
               this.ptxt = "ALMOST THERE";
            }
            if(iz == 7)
            {
               this.ptxt = "STOP CHEATING";
            }
            if(iz == 8)
            {
               this.ptxt = "YOU HAVE FUR";
            }
            if(iz == 9)
            {
               this.ptxt = "EURAIDEKA";
            }
            if(iz == 10)
            {
               this.ptxt = "MAKE IT QUICK";
            }
            if(iz == 11)
            {
               this.ptxt = "SEND MONEY";
            }
            if(iz == 12)
            {
               this.ptxt = "IT WAS YOU";
            }
            if(iz == 13)
            {
               this.ptxt = "ABORT ABORT";
            }
            if(iz == 14)
            {
               this.ptxt = "C\'EST LA VIE";
            }
            if(iz == 15)
            {
               this.ptxt = "HE IS COMING";
            }
            if(iz == 16)
            {
               this.ptxt = "I KILLED YOU";
            }
            if(iz == 17)
            {
               this.ptxt = "IT\'S FAKE";
            }
            if(iz == 18)
            {
               this.ptxt = "TARGET LOCKED";
            }
            if(iz == 19)
            {
               this.ptxt = "HURRY";
            }
            if(iz == 20)
            {
               this.ptxt = "GROW A BEARD";
            }
            if(iz == 21)
            {
               this.ptxt = "TELL A FRIEND";
            }
            if(iz == 22)
            {
               this.ptxt = "EVERYONE KNOWS";
            }
            if(iz == 23)
            {
               this.ptxt = "STILL HERE";
            }
            if(iz == 24)
            {
               this.ptxt = "YOU\'RE SPECIAL";
            }
            if(iz == 25)
            {
               this.ptxt = "BOSS OF NOVA";
            }
            if(iz == 26)
            {
               this.ptxt = "FEELS WARM";
            }
            if(iz == 27)
            {
               this.ptxt = "YOU\'RE SUPER";
            }
            if(iz == 28)
            {
               this.ptxt = "ALL ALONE";
            }
            if(iz == 29)
            {
               this.ptxt = "EAT YOUR GREENS";
            }
            if(iz == 30)
            {
               this.ptxt = "IT\'S RAINING";
            }
            if(iz == 31)
            {
               this.ptxt = "A NEW RECORD";
            }
            if(iz == 32)
            {
               this.ptxt = "TIME";
            }
            if(iz == 33)
            {
               this.ptxt = "SUPER SLOW";
            }
            if(iz == 34)
            {
               this.ptxt = "0 PAUSES LEFT";
            }
            if(iz == 35)
            {
               this.ptxt = "WRONG WAY";
            }
            if(iz == 36)
            {
               this.ptxt = "TIME\'S UP";
            }
            if(iz == 37)
            {
               this.ptxt = "COME BACK";
            }
            if(iz == 38)
            {
               this.ptxt = "WHO ARE YOU";
            }
            if(iz == 39)
            {
               this.ptxt = "WEREWOLVES";
            }
            if(iz == 40)
            {
               this.ptxt = "EXERCISE";
            }
            if(iz == 41)
            {
               this.ptxt = "THIRSTY";
            }
            if(iz == 42)
            {
               this.ptxt = "IT\'S IN CODE";
            }
            if(iz == 43)
            {
               this.ptxt = "NO LIVES REMAINING";
            }
            if(iz == 44)
            {
               this.ptxt = "OUZAK";
            }
            if(iz == 45)
            {
               this.ptxt = "ANAGRAMS";
            }
            if(iz == 46)
            {
               this.ptxt = "MAY HEAVEN GRANT YOU";
            }
            if(iz == 47)
            {
               this.ptxt = "FORTUNE";
            }
            if(iz == 48)
            {
               this.ptxt = "FIREFLIES";
            }
            if(iz == 49)
            {
               this.ptxt = "WATCH THE SYMBOLS";
            }
            if(iz == 50)
            {
               this.ptxt = "REDNATS";
            }
            if(iz == 51)
            {
               this.ptxt = "NITSUJ";
            }
         }
         if(global.pause == false && (global.level >= 18 && global.level < 27))
         {
            iz = 0;
            iz = Math.round(Math.random() * 28);
            if(global.level == 19)
            {
               iz = Math.round(Math.random() * 29);
            }
            if(iz == 0)
            {
               this.ptxt = "HELP ME";
            }
            if(iz == 1)
            {
               this.ptxt = "THE PAIN";
            }
            if(iz == 2)
            {
               this.ptxt = "LET ME IN";
            }
            if(iz == 3)
            {
               this.ptxt = "SAVE ME";
            }
            if(iz == 4)
            {
               this.ptxt = "AAAAAA555AOIP5!AIAIF002[";
            }
            if(iz == 5)
            {
               this.ptxt = "FATHER";
            }
            if(iz == 6)
            {
               this.ptxt = "ASDI9A909SDJ0OJ";
            }
            if(iz == 7)
            {
               this.ptxt = "0100992JE09J09J09J0912";
            }
            if(iz == 8)
            {
               this.ptxt = "PLEASE";
            }
            if(iz == 9)
            {
               this.ptxt = "QUIT NOW";
            }
            if(iz == 10)
            {
               this.ptxt = "NOT MUCH TIME";
            }
            if(iz == 11)
            {
               this.ptxt = "DON\'T LET IT HAPPEN";
            }
            if(iz == 12)
            {
               this.ptxt = "STOP";
            }
            if(iz == 13)
            {
               this.ptxt = "DON\'T DO IT";
            }
            if(iz == 14)
            {
               this.ptxt = "END IT";
            }
            if(iz == 15)
            {
               this.ptxt = "THE MADNESS";
            }
            if(iz == 16)
            {
               this.ptxt = "NO";
            }
            if(iz == 17)
            {
               this.ptxt = "IT\'S FAKE";
            }
            if(iz == 18)
            {
               this.ptxt = "YOU\'RE IT";
            }
            if(iz == 19)
            {
               this.ptxt = "HURRY";
            }
            if(iz == 20)
            {
               this.ptxt = "THE END";
            }
            if(iz == 21)
            {
               this.ptxt = "A99S90A00 AKS -9A0S";
            }
            if(iz == 22)
            {
               this.ptxt = "GHOSTS";
            }
            if(iz == 23)
            {
               this.ptxt = "LOST";
            }
            if(iz == 24)
            {
               this.ptxt = "NOTHING LEFT";
            }
            if(iz == 25)
            {
               this.ptxt = "DEAD END";
            }
            if(iz == 26)
            {
               this.ptxt = "COLDER";
            }
            if(iz == 27)
            {
               this.ptxt = "COLD";
            }
            if(iz == 28)
            {
               this.ptxt = "S0F0000S0F0K DA9 F90SID0";
            }
            if(iz == 29)
            {
               this.ptxt = "THOU SHALT NOT WALK LEFT.";
            }
         }
         if(global.pause == false && global.level >= 27)
         {
            iz = 0;
            iz = Math.round(Math.random() * 36);
            if(iz == 0)
            {
               this.ptxt = "SCREAMS";
            }
            if(iz == 1)
            {
               this.ptxt = "DEATH";
            }
            if(iz == 2)
            {
               this.ptxt = "FAILURE";
            }
            if(iz == 3)
            {
               this.ptxt = "BLOOD";
            }
            if(iz == 4)
            {
               this.ptxt = "DID YOU KNOW THAT";
            }
            if(iz == 5)
            {
               this.ptxt = "THE WITCH-WOMAN";
            }
            if(iz == 6)
            {
               this.ptxt = "ONCE HAD A BROTHER";
            }
            if(iz == 7)
            {
               this.ptxt = "THIS SOFTWARE IS COPYRIGHT";
            }
            if(iz == 8)
            {
               this.ptxt = "MISSING NUMBER";
            }
            if(iz == 9)
            {
               this.ptxt = "YOU HAVE 7 DAYS";
            }
            if(iz == 10)
            {
               this.ptxt = "CONGRATULATIONS";
            }
            if(iz == 11)
            {
               this.ptxt = "GAME OVER";
            }
            if(iz == 12)
            {
               this.ptxt = "THE END";
            }
            if(iz == 13)
            {
               this.ptxt = "0:00";
            }
            if(iz == 14)
            {
               this.ptxt = "MY EVERGREENS";
            }
            if(iz == 15)
            {
               this.ptxt = "BOTH LIE";
            }
            if(iz == 16)
            {
               this.ptxt = "FORGIVE ME";
            }
            if(iz == 17)
            {
               this.ptxt = "WAIT, PLEASE";
            }
            if(iz == 18)
            {
               this.ptxt = "I\'M SO SORRY";
            }
            if(iz == 19)
            {
               this.ptxt = "I\'LL DO ANYTHING";
            }
            if(iz == 20)
            {
               this.ptxt = "NO, DON\'T";
            }
            if(iz == 21)
            {
               this.ptxt = "NO, PLEASE DON\'T";
            }
            if(iz == 22)
            {
               this.ptxt = "PLEASE DON\'T DO IT";
            }
            if(iz == 23)
            {
               this.ptxt = "I DON\'T WANT TO HURT ANYMORE";
            }
            if(iz == 24)
            {
               this.ptxt = "...";
            }
            if(iz == 25)
            {
               this.ptxt = "LONELY";
            }
            if(iz == 26)
            {
               this.ptxt = "REVELATION";
            }
            if(iz == 27)
            {
               this.ptxt = "GAME OVER";
            }
            if(iz == 28)
            {
               this.ptxt = "SANCTUARY";
            }
            if(iz == 29)
            {
               this.ptxt = "INDIGNANT";
            }
            if(iz == 30)
            {
               this.ptxt = "DIVINE";
            }
            if(iz == 31)
            {
               this.ptxt = "ASCENSION";
            }
            if(iz == 32)
            {
               this.ptxt = "WORLD";
            }
            if(iz == 33)
            {
               this.ptxt = "ETERNAL";
            }
            if(iz == 34)
            {
               this.ptxt = "CREATION";
            }
            if(iz == 35)
            {
               this.ptxt = "FAREWELL";
            }
            if(iz == 36)
            {
               this.ptxt = "TRAVELLER";
            }
         }
      }
   }
}
