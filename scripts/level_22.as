package
{
   import net.flashpunk.World;
   import flash.net.SharedObject;
   
   public class level_22 extends World
   {
       
      
      private var sharedOBJ:SharedObject;
      
      public function level_22()
      {
         super();
         if(global.speedrunning == false)
         {
            this.sharedOBJ = SharedObject.getLocal("ld");
            this.Save();
         }
         add(global.muteObj);
         if(global.speedrunning == true)
         {
            add(new obj_speedruntimer());
         }
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_gamestatic());
         add(new obj_replaystatic());
         global.room_width = 896;
         global.room_height = 640;
         add(global.player = new obj_player(0,69));
         add(new obj_foreground());
         add(new obj_background());
         add(new obj_transition());
         add(new obj_replayborder());
         add(global.mycamera = new obj_camera());
         add(global.master = new obj_master());
         add(global.replay = new obj_replay());
         if(global.speedrunning == true)
         {
            add(new obj_trinket(832 - 32,32 + 20));
         }
         add(new obj_flower(160,96,1));
         add(new obj_flower(736,576,1));
         add(new obj_flower(192 + 12,416,2));
         add(new obj_flower(213 + 4,414,2));
         add(new obj_door(608,224));
         add(new obj_spikes(256,416));
         add(new obj_spikes(288,416));
         add(new obj_spikes(480,416));
         add(new obj_spikes(608,480));
         add(new obj_spikes(96,96));
         add(new obj_spikes(832,384));
         add(new obj_block(0,128));
         add(new obj_block(32,128));
         add(new obj_block(64,128));
         add(new obj_block(96,128));
         add(new obj_block(480,608));
         add(new obj_block(512,608));
         add(new obj_block(544,608));
         add(new obj_block(576,608));
         add(new obj_block(608,608));
         add(new obj_block(640,608));
         add(new obj_block(672,608));
         add(new obj_block(704,608));
         add(new obj_block(736,608));
         add(new obj_block(768,608));
         add(new obj_block(800,608));
         add(new obj_block(832,608));
         add(new obj_block(864,608));
         add(new obj_block(128,128));
         add(new obj_block(160,128));
         add(new obj_block(160,160));
         add(new obj_block(160,192));
         add(new obj_block(160,224));
         add(new obj_block(160,256));
         add(new obj_block(160,288));
         add(new obj_block(160,320));
         add(new obj_block(160,352));
         add(new obj_block(160,384));
         add(new obj_block(160,416));
         add(new obj_block(160,448));
         add(new obj_block(192,448));
         add(new obj_block(224,448));
         add(new obj_block(256,448));
         add(new obj_block(288,448));
         add(new obj_block(320,448));
         add(new obj_block(352,448));
         add(new obj_block(384,448));
         add(new obj_block(416,448));
         add(new obj_block(448,448));
         add(new obj_block(480,448));
         add(new obj_block(480,480));
         add(new obj_block(480,512));
         if(global.speedrunning == true)
         {
            if(global.speedrun_secret_1 == false)
            {
               add(new obj_block(480,544));
            }
            else
            {
               add(new obj_blackblock(480,544));
            }
            if(global.speedrun_secret_2 == false)
            {
               add(new obj_block(480,576));
            }
            else
            {
               add(new obj_blackblock(480,576));
            }
            if(global.speedrun_secret_3 == false)
            {
               add(new obj_block(480 - 32,576 + 32));
            }
            else
            {
               add(new obj_blackblock(480 - 32,576 + 32));
            }
         }
         else
         {
            if(global.secret_1 == false)
            {
               add(new obj_block(480,544));
            }
            else
            {
               add(new obj_blackblock(480,544));
            }
            if(global.secret_2 == false)
            {
               add(new obj_block(480,576));
            }
            else
            {
               add(new obj_blackblock(480,576));
            }
            if(global.secret_3 == false)
            {
               add(new obj_block(480 - 32,576 + 32));
            }
            else
            {
               add(new obj_blackblock(480 - 32,576 + 32));
            }
         }
         add(new obj_block(448,512));
         add(new obj_block(416,544));
         add(new obj_block(384,576));
         add(new obj_block(352,576));
         add(new obj_block(320,608));
         add(new obj_block(608,512));
         add(new obj_block(640,512));
         add(new obj_block(672,512));
         add(new obj_block(768,416));
         add(new obj_block(800,416));
         add(new obj_block(832,416));
         add(new obj_block(672,320));
         add(new obj_block(640,320));
         add(new obj_block(608,320));
      }
      
      public function Save() : void
      {
         this.sharedOBJ.data.gametime0 = global.gametime[0];
         this.sharedOBJ.data.gametime1 = global.gametime[1];
         this.sharedOBJ.data.gametime2 = global.gametime[2];
         this.sharedOBJ.data.gametime3 = global.gametime[3];
         this.sharedOBJ.data.gametime4 = global.gametime[4];
         this.sharedOBJ.data.gametime5 = global.gametime[5];
         this.sharedOBJ.data.gametime6 = global.gametime[6];
         this.sharedOBJ.data.gametime7 = global.gametime[7];
         this.sharedOBJ.data.gametime8 = global.gametime[8];
         this.sharedOBJ.data.gametime9 = global.gametime[9];
         this.sharedOBJ.data.gametime10 = global.gametime[10];
         this.sharedOBJ.data.gametime11 = global.gametime[11];
         this.sharedOBJ.data.gametime12 = global.gametime[12];
         this.sharedOBJ.data.gametime13 = global.gametime[13];
         this.sharedOBJ.data.gametime14 = global.gametime[14];
         this.sharedOBJ.data.gametime15 = global.gametime[15];
         this.sharedOBJ.data.gametime16 = global.gametime[16];
         this.sharedOBJ.data.gametime17 = global.gametime[17];
         this.sharedOBJ.data.gametime18 = global.gametime[18];
         this.sharedOBJ.data.gametime19 = global.gametime[19];
         this.sharedOBJ.data.gametime20 = global.gametime[20];
         this.sharedOBJ.data.gametime21 = global.gametime[21];
         this.sharedOBJ.data.gametime22 = global.gametime[22];
         this.sharedOBJ.data.gametime23 = global.gametime[23];
         this.sharedOBJ.data.gametime24 = global.gametime[24];
         this.sharedOBJ.data.gametime25 = global.gametime[25];
         this.sharedOBJ.data.gametime26 = global.gametime[26];
         this.sharedOBJ.data.gamedeaths0 = global.gamedeaths[0];
         this.sharedOBJ.data.gamedeaths1 = global.gamedeaths[1];
         this.sharedOBJ.data.gamedeaths2 = global.gamedeaths[2];
         this.sharedOBJ.data.gamedeaths3 = global.gamedeaths[3];
         this.sharedOBJ.data.gamedeaths4 = global.gamedeaths[4];
         this.sharedOBJ.data.gamedeaths5 = global.gamedeaths[5];
         this.sharedOBJ.data.gamedeaths6 = global.gamedeaths[6];
         this.sharedOBJ.data.gamedeaths7 = global.gamedeaths[7];
         this.sharedOBJ.data.gamedeaths8 = global.gamedeaths[8];
         this.sharedOBJ.data.gamedeaths9 = global.gamedeaths[9];
         this.sharedOBJ.data.gamedeaths10 = global.gamedeaths[10];
         this.sharedOBJ.data.gamedeaths11 = global.gamedeaths[11];
         this.sharedOBJ.data.gamedeaths12 = global.gamedeaths[12];
         this.sharedOBJ.data.gamedeaths13 = global.gamedeaths[13];
         this.sharedOBJ.data.gamedeaths14 = global.gamedeaths[14];
         this.sharedOBJ.data.gamedeaths15 = global.gamedeaths[15];
         this.sharedOBJ.data.gamedeaths16 = global.gamedeaths[16];
         this.sharedOBJ.data.gamedeaths17 = global.gamedeaths[17];
         this.sharedOBJ.data.gamedeaths18 = global.gamedeaths[18];
         this.sharedOBJ.data.gamedeaths19 = global.gamedeaths[19];
         this.sharedOBJ.data.gamedeaths20 = global.gamedeaths[20];
         this.sharedOBJ.data.gamedeaths21 = global.gamedeaths[21];
         this.sharedOBJ.data.gamedeaths22 = global.gamedeaths[22];
         this.sharedOBJ.data.gamedeaths23 = global.gamedeaths[23];
         this.sharedOBJ.data.gamedeaths24 = global.gamedeaths[24];
         this.sharedOBJ.data.gamedeaths25 = global.gamedeaths[25];
         this.sharedOBJ.data.gamedeaths26 = global.gamedeaths[26];
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
         this.sharedOBJ.data.level_start = global.level_start;
         this.sharedOBJ.data.playernumber = global.playernumber;
         this.sharedOBJ.data.prev_playernumber = global.prev_playernumber;
         this.sharedOBJ.data.deaths = global.deaths;
         this.sharedOBJ.data.speedrun_unlocked = global.speedrun_unlocked;
         this.sharedOBJ.data.sunglasses = global.sunglasses;
         this.sharedOBJ.data.sunglasses_unlocked = global.sunglasses_unlocked;
         this.sharedOBJ.data.secret_1 = global.secret_1;
         this.sharedOBJ.data.secret_2 = global.secret_2;
         this.sharedOBJ.data.secret_3 = global.secret_3;
         this.sharedOBJ.data.music_unlocked = global.music_unlocked;
         this.sharedOBJ.flush();
      }
   }
}
