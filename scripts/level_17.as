package
{
   import net.flashpunk.World;
   import flash.net.SharedObject;
   
   public class level_17 extends World
   {
       
      
      private var sharedOBJ:SharedObject;
      
      public function level_17()
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
         add(new obj_replaystatic());
         global.room_width = 1088;
         global.room_height = 672;
         add(global.player = new obj_player(96,517));
         add(new obj_foreground());
         add(new obj_background());
         add(new obj_transition());
         add(new obj_replayborder());
         add(global.mycamera = new obj_camera());
         add(global.master = new obj_master());
         add(global.replay = new obj_replay());
         if(global.speedrunning == true)
         {
            add(new obj_trinket(816,560));
         }
         add(new obj_door(928,96));
         add(new obj_spikes(288,256));
         add(new obj_spikes(320,288));
         add(new obj_spikes(352,288));
         add(new obj_spikes(384,288));
         add(new obj_spikes(608,288));
         add(new obj_invertspikes(192,416));
         add(new obj_invertspikes(224,416));
         add(new obj_invertspikes(320,416));
         add(new obj_invertspikes(352,416));
         add(new obj_invertspikes(288,192));
         add(new obj_invertspikes(320,64));
         add(new obj_invertspikes(352,64));
         add(new obj_invertspikes(384,64));
         add(new obj_invertspikes(416,64));
         add(new obj_invertspikes(448,64));
         add(new obj_invertspikes(480,64));
         add(new obj_invertspikes(512,64));
         add(new obj_invertspikes(544,64));
         add(new obj_invertspikes(576,64));
         add(new obj_invertspikes(608,64));
         add(new obj_invertspikes(640,64));
         add(new obj_invertspikes(672,64));
         add(new obj_invertspikes(704,64));
         add(new obj_invertspikes(736,64));
         add(new obj_invertspikes(768,64));
         add(new obj_invertspikes(800,64));
         add(new obj_invertspikes(832,96));
         add(new obj_invertspikes(704,512));
         add(new obj_invertspikes(736,512));
         add(new obj_invertspikes(768,512));
         add(new obj_invertspikes(800,512));
         add(new obj_invertspikes(672,512));
         add(new obj_invertspikes(832,512));
         add(new obj_sawright(644,324));
         add(new obj_sawright(676,580));
         add(new obj_sawleft(452,580));
         add(new obj_sawright(228,580));
         add(new obj_sawleft(292,580));
         add(new obj_sawright(516,580));
         add(new obj_sawleft(740,580));
         add(new obj_bigthwomp(480,65));
         add(new obj_hourglass(256,256));
         add(new obj_block(704,128,2,4));
         add(new obj_block(832,192,8,5));
         add(new obj_block(1056,96,1,3));
         add(new obj_block(832,64,8,1));
         add(new obj_block(320,32,16,1));
         add(new obj_block(160,32,5,5));
         add(new obj_block(320,320,3,3));
         add(new obj_block(192,288,4,4));
         add(new obj_block(128,192,2,8));
         add(new obj_block(64,448,4,2));
         add(new obj_block(32,480,1,3));
         add(new obj_block(256,416,2,2));
         add(new obj_block(416,448,2,1));
         add(new obj_block(384,416,1,2));
         add(new obj_block(608,320,1,1));
         add(new obj_block(544,448,2,1));
         add(new obj_block(608,352,8,5));
         add(new obj_block(864,512,1,3));
         add(new obj_block(192,608,21,1));
         add(new obj_block(64,576,4,1));
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
