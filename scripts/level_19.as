package
{
   import net.flashpunk.World;
   import flash.net.SharedObject;
   
   public class level_19 extends World
   {
       
      
      private var sharedOBJ:SharedObject;
      
      public function level_19()
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
         if(global.speedrunning == true)
         {
            add(new obj_trinket(304 * 2 - 16,96 * 2 - 16));
         }
         global.room_width = 1184;
         global.room_height = 480;
         add(global.player = new obj_player(1024,261));
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_replaystatic());
         add(new obj_foreground());
         add(new obj_background());
         add(new obj_transition());
         add(new obj_replayborder());
         add(global.mycamera = new obj_camera());
         add(global.master = new obj_master());
         add(global.replay = new obj_replay());
         add(new obj_door(864,224));
         add(new obj_spikes(128,256));
         add(new obj_spikes(160,256));
         add(new obj_spikes(192,256));
         add(new obj_spikes(224,256));
         add(new obj_spikes(96,288));
         add(new obj_spikes(64,288));
         add(new obj_spikes(32,288));
         add(new obj_spikes(0,288));
         add(new obj_spikes(480,288));
         add(new obj_spikes(480,256));
         add(new obj_spikes(480,224));
         add(new obj_spikes(480,192));
         add(new obj_spikes(480,160));
         add(new obj_spikes(448,288));
         add(new obj_spikes(448,256));
         add(new obj_spikes(448,224));
         add(new obj_spikes(448,192));
         add(new obj_spikes(448,160));
         add(new obj_spikes(448,160));
         add(new obj_spikes(992,160));
         add(new obj_invertspikes(128,160));
         add(new obj_invertspikes(160,160));
         add(new obj_invertspikes(192,160));
         add(new obj_invertspikes(224,160));
         add(new obj_invertspikes(96,160));
         add(new obj_invertspikes(64,160));
         add(new obj_invertspikes(32,160));
         add(new obj_invertspikes(0,160));
         add(new obj_sawleft(1088,292));
         add(new obj_bigthwomp(800,161));
         add(new obj_bigthwomp(512,161));
         add(new obj_bigthwomp(576,161));
         add(new obj_bigthwomp(640,161));
         add(new obj_block(128,288,4,1));
         add(new obj_block(128,320,33,1));
         add(new obj_block(1120,128,2,4));
         add(new obj_block(1056,128,2,1));
         add(new obj_block(1024,160,1,2));
         add(new obj_block(960,160,2,3));
         add(new obj_block(0,128,30,1));
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
