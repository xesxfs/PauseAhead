package
{
   import net.flashpunk.World;
   import flash.net.SharedObject;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Text;
   
   public class title extends World
   {
       
      
      private var sharedOBJ:SharedObject;
      
      public function title()
      {
         super();
         Text.size = 30;
         Text.align = "center";
         global.speedrunning = false;
         global.non_logo = true;
         global.speedrun_secret_1 = false;
         global.speedrun_secret_2 = false;
         global.speedrun_secret_3 = false;
         global.level_speedrun_text = false;
         global.level_1_text = false;
         global.level_2_text = false;
         global.level_3_text = false;
         global.level_4_text = false;
         global.level_5_text = false;
         global.level_6_text = false;
         global.level_7_text = false;
         global.level_8_text = false;
         global.level_9_text = false;
         global.level_10_text = false;
         global.level_11_text = false;
         global.level_12_text = false;
         global.level_13_text = false;
         global.level_14_text = false;
         global.level_15_text = false;
         global.level_16_text = false;
         global.level_17_text = false;
         global.level_18_text = false;
         global.level_19_text = false;
         global.level_20_text = false;
         global.level_21_text = false;
         global.level_22_text = false;
         global.level_23_text = false;
         global.level_24_text = false;
         global.level_25_text = false;
         global.level_27_text = false;
         global.level_28_text = false;
         global.level_29_text = false;
         global.helltext = 0;
         global.gaplevel = 0;
         global.pause = false;
         global.esc_pause = false;
         global.hellkey_1 = false;
         global.hellkey_2 = false;
         global.hell_intro = 0;
         global.levelTrinket = false;
         global.trinket_count = 0;
         global.speedrun_time = 0;
         FP.camera.x = 0;
         FP.camera.y = 0;
         FP.screen.color = 5832902;
         global.speed_minute = 0;
         global.speed_second = 0;
         global.blackfadevol = 0;
         this.sharedOBJ = SharedObject.getLocal("ld");
         this.Load();
         global.gametime[26] = 0;
         FP.screen.color = 3224399;
         add(global.muteObj);
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_transition());
         add(new obj_menupic());
         add(new obj_menutitle());
         add(new obj_menusubtitle());
         add(new obj_menucredit());
         add(new obj_menunew());
         add(new obj_menucontinue());
         add(new obj_menuach());
         add(new obj_menuspeed());
         add(new obj_menumore());
         add(new obj_menu_logo1());
         add(new obj_menu_logo2());
         add(new obj_menu_soundtest());
      }
      
      public function Load() : void
      {
         if(this.sharedOBJ.data.gametime0 != undefined)
         {
            global.gametime[0] = this.sharedOBJ.data.gametime0;
         }
         if(this.sharedOBJ.data.gametime1 != undefined)
         {
            global.gametime[1] = this.sharedOBJ.data.gametime1;
         }
         if(this.sharedOBJ.data.gametime2 != undefined)
         {
            global.gametime[2] = this.sharedOBJ.data.gametime2;
         }
         if(this.sharedOBJ.data.gametime3 != undefined)
         {
            global.gametime[3] = this.sharedOBJ.data.gametime3;
         }
         if(this.sharedOBJ.data.gametime4 != undefined)
         {
            global.gametime[4] = this.sharedOBJ.data.gametime4;
         }
         if(this.sharedOBJ.data.gametime5 != undefined)
         {
            global.gametime[5] = this.sharedOBJ.data.gametime5;
         }
         if(this.sharedOBJ.data.gametime6 != undefined)
         {
            global.gametime[6] = this.sharedOBJ.data.gametime6;
         }
         if(this.sharedOBJ.data.gametime7 != undefined)
         {
            global.gametime[7] = this.sharedOBJ.data.gametime7;
         }
         if(this.sharedOBJ.data.gametime8 != undefined)
         {
            global.gametime[8] = this.sharedOBJ.data.gametime8;
         }
         if(this.sharedOBJ.data.gametime9 != undefined)
         {
            global.gametime[9] = this.sharedOBJ.data.gametime9;
         }
         if(this.sharedOBJ.data.gametime10 != undefined)
         {
            global.gametime[10] = this.sharedOBJ.data.gametime10;
         }
         if(this.sharedOBJ.data.gametime11 != undefined)
         {
            global.gametime[11] = this.sharedOBJ.data.gametime11;
         }
         if(this.sharedOBJ.data.gametime12 != undefined)
         {
            global.gametime[12] = this.sharedOBJ.data.gametime12;
         }
         if(this.sharedOBJ.data.gametime13 != undefined)
         {
            global.gametime[13] = this.sharedOBJ.data.gametime13;
         }
         if(this.sharedOBJ.data.gametime14 != undefined)
         {
            global.gametime[14] = this.sharedOBJ.data.gametime14;
         }
         if(this.sharedOBJ.data.gametime15 != undefined)
         {
            global.gametime[15] = this.sharedOBJ.data.gametime15;
         }
         if(this.sharedOBJ.data.gametime16 != undefined)
         {
            global.gametime[16] = this.sharedOBJ.data.gametime16;
         }
         if(this.sharedOBJ.data.gametime17 != undefined)
         {
            global.gametime[17] = this.sharedOBJ.data.gametime17;
         }
         if(this.sharedOBJ.data.gametime18 != undefined)
         {
            global.gametime[18] = this.sharedOBJ.data.gametime18;
         }
         if(this.sharedOBJ.data.gametime19 != undefined)
         {
            global.gametime[19] = this.sharedOBJ.data.gametime19;
         }
         if(this.sharedOBJ.data.gametime20 != undefined)
         {
            global.gametime[20] = this.sharedOBJ.data.gametime20;
         }
         if(this.sharedOBJ.data.gametime21 != undefined)
         {
            global.gametime[21] = this.sharedOBJ.data.gametime21;
         }
         if(this.sharedOBJ.data.gametime22 != undefined)
         {
            global.gametime[22] = this.sharedOBJ.data.gametime22;
         }
         if(this.sharedOBJ.data.gametime23 != undefined)
         {
            global.gametime[23] = this.sharedOBJ.data.gametime23;
         }
         if(this.sharedOBJ.data.gametime24 != undefined)
         {
            global.gametime[24] = this.sharedOBJ.data.gametime24;
         }
         if(this.sharedOBJ.data.gametime25 != undefined)
         {
            global.gametime[25] = this.sharedOBJ.data.gametime25;
         }
         if(this.sharedOBJ.data.gametime26 != undefined)
         {
            global.gametime[26] = this.sharedOBJ.data.gametime26;
         }
         if(this.sharedOBJ.data.gamedeaths0 != undefined)
         {
            global.gamedeaths[0] = this.sharedOBJ.data.gamedeaths0;
         }
         if(this.sharedOBJ.data.gamedeaths1 != undefined)
         {
            global.gamedeaths[1] = this.sharedOBJ.data.gamedeaths1;
         }
         if(this.sharedOBJ.data.gamedeaths2 != undefined)
         {
            global.gamedeaths[2] = this.sharedOBJ.data.gamedeaths2;
         }
         if(this.sharedOBJ.data.gamedeaths3 != undefined)
         {
            global.gamedeaths[3] = this.sharedOBJ.data.gamedeaths3;
         }
         if(this.sharedOBJ.data.gamedeaths4 != undefined)
         {
            global.gamedeaths[4] = this.sharedOBJ.data.gamedeaths4;
         }
         if(this.sharedOBJ.data.gamedeaths5 != undefined)
         {
            global.gamedeaths[5] = this.sharedOBJ.data.gamedeaths5;
         }
         if(this.sharedOBJ.data.gamedeaths6 != undefined)
         {
            global.gamedeaths[6] = this.sharedOBJ.data.gamedeaths6;
         }
         if(this.sharedOBJ.data.gamedeaths7 != undefined)
         {
            global.gamedeaths[7] = this.sharedOBJ.data.gamedeaths7;
         }
         if(this.sharedOBJ.data.gamedeaths8 != undefined)
         {
            global.gamedeaths[8] = this.sharedOBJ.data.gamedeaths8;
         }
         if(this.sharedOBJ.data.gamedeaths9 != undefined)
         {
            global.gamedeaths[9] = this.sharedOBJ.data.gamedeaths9;
         }
         if(this.sharedOBJ.data.gamedeaths10 != undefined)
         {
            global.gamedeaths[10] = this.sharedOBJ.data.gamedeaths10;
         }
         if(this.sharedOBJ.data.gamedeaths11 != undefined)
         {
            global.gamedeaths[11] = this.sharedOBJ.data.gamedeaths11;
         }
         if(this.sharedOBJ.data.gamedeaths12 != undefined)
         {
            global.gamedeaths[12] = this.sharedOBJ.data.gamedeaths12;
         }
         if(this.sharedOBJ.data.gamedeaths13 != undefined)
         {
            global.gamedeaths[13] = this.sharedOBJ.data.gamedeaths13;
         }
         if(this.sharedOBJ.data.gamedeaths14 != undefined)
         {
            global.gamedeaths[14] = this.sharedOBJ.data.gamedeaths14;
         }
         if(this.sharedOBJ.data.gamedeaths15 != undefined)
         {
            global.gamedeaths[15] = this.sharedOBJ.data.gamedeaths15;
         }
         if(this.sharedOBJ.data.gamedeaths16 != undefined)
         {
            global.gamedeaths[16] = this.sharedOBJ.data.gamedeaths16;
         }
         if(this.sharedOBJ.data.gamedeaths17 != undefined)
         {
            global.gamedeaths[17] = this.sharedOBJ.data.gamedeaths17;
         }
         if(this.sharedOBJ.data.gamedeaths18 != undefined)
         {
            global.gamedeaths[18] = this.sharedOBJ.data.gamedeaths18;
         }
         if(this.sharedOBJ.data.gamedeaths19 != undefined)
         {
            global.gamedeaths[19] = this.sharedOBJ.data.gamedeaths19;
         }
         if(this.sharedOBJ.data.gamedeaths20 != undefined)
         {
            global.gamedeaths[20] = this.sharedOBJ.data.gamedeaths20;
         }
         if(this.sharedOBJ.data.gamedeaths21 != undefined)
         {
            global.gamedeaths[21] = this.sharedOBJ.data.gamedeaths21;
         }
         if(this.sharedOBJ.data.gamedeaths22 != undefined)
         {
            global.gamedeaths[22] = this.sharedOBJ.data.gamedeaths22;
         }
         if(this.sharedOBJ.data.gamedeaths23 != undefined)
         {
            global.gamedeaths[23] = this.sharedOBJ.data.gamedeaths23;
         }
         if(this.sharedOBJ.data.gamedeaths24 != undefined)
         {
            global.gamedeaths[24] = this.sharedOBJ.data.gamedeaths24;
         }
         if(this.sharedOBJ.data.gamedeaths25 != undefined)
         {
            global.gamedeaths[25] = this.sharedOBJ.data.gamedeaths25;
         }
         if(this.sharedOBJ.data.gamedeaths26 != undefined)
         {
            global.gamedeaths[26] = this.sharedOBJ.data.gamedeaths26;
         }
         if(this.sharedOBJ.data.achievement_1 != undefined)
         {
            global.achievement_1 = this.sharedOBJ.data.achievement_1;
         }
         if(this.sharedOBJ.data.achievement_2 != undefined)
         {
            global.achievement_2 = this.sharedOBJ.data.achievement_2;
         }
         if(this.sharedOBJ.data.achievement_3 != undefined)
         {
            global.achievement_3 = this.sharedOBJ.data.achievement_3;
         }
         if(this.sharedOBJ.data.achievement_4 != undefined)
         {
            global.achievement_4 = this.sharedOBJ.data.achievement_4;
         }
         if(this.sharedOBJ.data.achievement_5 != undefined)
         {
            global.achievement_5 = this.sharedOBJ.data.achievement_5;
         }
         if(this.sharedOBJ.data.achievement_6 != undefined)
         {
            global.achievement_6 = this.sharedOBJ.data.achievement_6;
         }
         if(this.sharedOBJ.data.achievement_7 != undefined)
         {
            global.achievement_7 = this.sharedOBJ.data.achievement_7;
         }
         if(this.sharedOBJ.data.achievement_8 != undefined)
         {
            global.achievement_8 = this.sharedOBJ.data.achievement_8;
         }
         if(this.sharedOBJ.data.achievement_9 != undefined)
         {
            global.achievement_9 = this.sharedOBJ.data.achievement_9;
         }
         if(this.sharedOBJ.data.achievement_10 != undefined)
         {
            global.achievement_10 = this.sharedOBJ.data.achievement_10;
         }
         if(this.sharedOBJ.data.achievement_11 != undefined)
         {
            global.achievement_11 = this.sharedOBJ.data.achievement_11;
         }
         if(this.sharedOBJ.data.achievement_12 != undefined)
         {
            global.achievement_12 = this.sharedOBJ.data.achievement_12;
         }
         if(this.sharedOBJ.data.achievement_13 != undefined)
         {
            global.achievement_13 = this.sharedOBJ.data.achievement_13;
         }
         if(this.sharedOBJ.data.achievement_14 != undefined)
         {
            global.achievement_14 = this.sharedOBJ.data.achievement_14;
         }
         if(this.sharedOBJ.data.achievement_15 != undefined)
         {
            global.achievement_15 = this.sharedOBJ.data.achievement_15;
         }
         if(this.sharedOBJ.data.achievement_16 != undefined)
         {
            global.achievement_16 = this.sharedOBJ.data.achievement_16;
         }
         if(this.sharedOBJ.data.achievement_17 != undefined)
         {
            global.achievement_17 = this.sharedOBJ.data.achievement_17;
         }
         if(this.sharedOBJ.data.achievement_18 != undefined)
         {
            global.achievement_18 = this.sharedOBJ.data.achievement_18;
         }
         if(this.sharedOBJ.data.achievement_19 != undefined)
         {
            global.achievement_19 = this.sharedOBJ.data.achievement_19;
         }
         if(this.sharedOBJ.data.achievement_20 != undefined)
         {
            global.achievement_20 = this.sharedOBJ.data.achievement_20;
         }
         if(this.sharedOBJ.data.allDeaths != undefined)
         {
            global.allDeaths = this.sharedOBJ.data.allDeaths;
         }
         if(this.sharedOBJ.data.flowerRub != undefined)
         {
            global.flowerRub = this.sharedOBJ.data.flowerRub;
         }
         if(this.sharedOBJ.data.level_start != undefined)
         {
            global.level_start = this.sharedOBJ.data.level_start;
         }
         if(this.sharedOBJ.data.deaths != undefined)
         {
            global.deaths = this.sharedOBJ.data.deaths;
         }
         if(this.sharedOBJ.data.speedrun_unlocked != undefined)
         {
            global.speedrun_unlocked = this.sharedOBJ.data.speedrun_unlocked;
         }
         if(this.sharedOBJ.data.playernumber != undefined)
         {
            global.playernumber = this.sharedOBJ.data.playernumber;
         }
         if(this.sharedOBJ.data.prev_playernumber != undefined)
         {
            global.prev_playernumber = this.sharedOBJ.data.prev_playernumber;
         }
         if(this.sharedOBJ.data.secret_1 != undefined)
         {
            global.secret_1 = this.sharedOBJ.data.secret_1;
         }
         if(this.sharedOBJ.data.secret_2 != undefined)
         {
            global.secret_2 = this.sharedOBJ.data.secret_2;
         }
         if(this.sharedOBJ.data.secret_3 != undefined)
         {
            global.secret_3 = this.sharedOBJ.data.secret_3;
         }
         if(this.sharedOBJ.data.music_unlocked != undefined)
         {
            global.music_unlocked = this.sharedOBJ.data.music_unlocked;
         }
         if(this.sharedOBJ.data.sunglasses != undefined)
         {
            global.sunglasses = this.sharedOBJ.data.sunglasses;
         }
         if(this.sharedOBJ.data.sunglasses_unlocked != undefined)
         {
            global.sunglasses_unlocked = this.sharedOBJ.data.sunglasses_unlocked;
         }
      }
      
      override public function update() : void
      {
         global.helltext = 0;
         FP.screen.color = FP.getColorRGB(49 + Math.random() * 8,47 + Math.random() * 8,79 + Math.random() * 8);
         super.update();
      }
   }
}
