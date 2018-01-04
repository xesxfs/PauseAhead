package
{
   import net.flashpunk.World;
   import flash.net.SharedObject;
   
   public class level_27 extends World
   {
       
      
      private var sharedOBJ:SharedObject;
      
      public function level_27()
      {
         super();
         if(global.speedrunning == false)
         {
            this.sharedOBJ = SharedObject.getLocal("ld");
            this.Save();
         }
         if(global.helltext == 0 || global.helltext == 2 || global.helltext == 4)
         {
            add(new obj_blacktext());
         }
         global.room_width = 640;
         global.room_height = 2816;
         add(global.player = new obj_player(288,32));
         add(global.muteObj);
         if(global.speedrunning == true)
         {
            add(new obj_speedruntimer());
         }
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_replaystatic());
         add(new obj_replayborder());
         add(new obj_background());
         add(new obj_transition());
         add(new obj_foreground());
         add(global.mycamera = new obj_camera());
         add(global.master = new obj_master());
         add(global.replay = new obj_replay());
         add(new obj_guillitine(160,2464,1));
         add(new obj_guillitine(416,2464,2));
         if(global.hellkey_1 == true)
         {
            add(new obj_helleye((144 - 21) * 2 + 8,(399 - 21) * 2 + 8));
         }
         if(global.hellkey_2 == true)
         {
            add(new obj_helleye((168 - 21) * 2 + 8,(399 - 21) * 2 + 8));
         }
         add(new obj_helldoor(268,804));
         add(new obj_spikes(480,2016));
         add(new obj_spikes(512,1472));
         add(new obj_spikes(352,1536));
         add(new obj_spikes(448,1824));
         add(new obj_spikes(288,1536));
         add(new obj_spikes(192,1536));
         add(new obj_spikes(544,1632));
         add(new obj_spikes(384,2304));
         add(new obj_spikes(352,2304));
         add(new obj_spikes(224,2304));
         add(new obj_spikes(256,2304));
         add(new obj_spikes(128,2304));
         add(new obj_spikes(96,2304));
         add(new obj_spikes(256,2208));
         add(new obj_spikes(480,2112));
         add(new obj_spikes(384,2112));
         add(new obj_spikes(224,2112));
         add(new obj_spikes(384,2208));
         add(new obj_spikes(352,2208));
         add(new obj_spikes(224,2208));
         add(new obj_spikes(256,2112));
         add(new obj_spikes(352,2112));
         add(new obj_spikes(512,2112));
         add(new obj_spikes(64,2592));
         add(new obj_spikes(32,2592));
         add(new obj_spikes(576,2592));
         add(new obj_spikes(544,2592));
         add(new obj_spikes(512,1216));
         add(new obj_spikes(544,1760));
         add(new obj_spikes(416,1824));
         add(new obj_spikes(160,1824));
         add(new obj_spikes(192,1824));
         add(new obj_spikes(256,1824));
         add(new obj_spikes(352,1824));
         add(new obj_spikes(384,1824));
         add(new obj_spikes(576,1408));
         add(new obj_spikes(32,1536));
         add(new obj_spikes(320,1536));
         add(new obj_spikes(384,1472));
         add(new obj_spikes(256,1088));
         add(new obj_spikes(224,1088));
         add(new obj_spikes(192,1088));
         add(new obj_spikes(160,1088));
         add(new obj_spikes(128,1088));
         add(new obj_spikes(64,1376));
         add(new obj_spikes(32,1376));
         add(new obj_spikes(320,1376));
         add(new obj_spikes(288,1376));
         add(new obj_spikes(256,1376));
         add(new obj_spikes(224,1376));
         add(new obj_spikes(192,1376));
         add(new obj_spikes(96,1376));
         add(new obj_spikes(512,1120));
         add(new obj_spikes(544,1120));
         add(new obj_spikes(576,1120));
         add(new obj_invertspikes(448,1280));
         add(new obj_invertspikes(544,1696));
         add(new obj_invertspikes(128,1472));
         add(new obj_invertspikes(160,1472));
         add(new obj_invertspikes(192,1440));
         add(new obj_invertspikes(224,1440));
         add(new obj_invertspikes(320,1440));
         add(new obj_invertspikes(384,1440));
         add(new obj_invertspikes(192,1248));
         add(new obj_invertspikes(320,1248));
         add(new obj_sawright(164,2372));
         add(new obj_ceilingsawright(164,2372));
         add(new obj_sawright(36,2372));
         add(new obj_ceilingsawright(36,2372));
         add(new obj_sawright(292,2372));
         add(new obj_ceilingsawright(292,2372));
         add(new obj_sawright(292,2276));
         add(new obj_ceilingsawright(292,2276));
         add(new obj_sawright(228,2276));
         add(new obj_ceilingsawright(228,2276));
         add(new obj_sawright(356,2276));
         add(new obj_ceilingsawright(356,2276));
         add(new obj_sawright(36,2276));
         add(new obj_ceilingsawright(36,2276));
         add(new obj_sawright(36,1988));
         add(new obj_ceilingsawright(36,1988));
         add(new obj_sawleft(420,2372));
         add(new obj_ceilingsawleft(420,2372));
         add(new obj_sawleft(292,2372));
         add(new obj_ceilingsawleft(292,2372));
         add(new obj_sawleft(228,2180));
         add(new obj_ceilingsawleft(228,2180));
         add(new obj_sawleft(356,2180));
         add(new obj_ceilingsawleft(356,2180));
         add(new obj_sawleft(484,2180));
         add(new obj_ceilingsawleft(484,2180));
         add(new obj_sawleft(548,2180));
         add(new obj_ceilingsawleft(548,2180));
         add(new obj_sawleft(132,1988));
         add(new obj_ceilingsawleft(132,1988));
         add(new obj_sawleft(356,2084));
         add(new obj_ceilingsawleft(356,2084));
         add(new obj_sawleft(292,2084));
         add(new obj_ceilingsawleft(292,2084));
         add(new obj_sawleft(228,2084));
         add(new obj_ceilingsawleft(228,2084));
         add(new obj_sawleft(548,2084));
         add(new obj_ceilingsawleft(548,2084));
         add(new obj_sawleft(292,1604));
         add(new obj_ceilingsawleft(292,1604));
         add(new obj_sawleft(36,1604));
         add(new obj_ceilingsawleft(36,1604));
         add(new obj_sawleft(356,1604));
         add(new obj_ceilingsawleft(356,1604));
         add(new obj_sawleft(228,1988));
         add(new obj_ceilingsawleft(228,1988));
         add(new obj_bigthwomp(480,1536));
         add(new obj_bigthwomp(416,1280));
         add(new obj_bigthwomp(128,1152));
         add(new obj_bigthwomp(448,992));
         add(new obj_thwomp(544,1184));
         add(new obj_thwomp(416,1696));
         add(new obj_thwomp(384,1696));
         add(new obj_thwomp(352,1696));
         add(new obj_thwomp(256,1696));
         add(new obj_thwomp(320,1696));
         add(new obj_thwomp(288,1696));
         add(new obj_block(288,1984,6,2));
         add(new obj_block(400,2592,3,1));
         add(new obj_block(144,2592,3,1));
         add(new obj_block(96,2240,1,1));
         add(new obj_block(512,1248,1,1));
         add(new obj_block(512,1504,1,1));
         add(new obj_block(32,2624,18,1));
         add(new obj_block(288,2464,2,5));
         add(new obj_block(480,2240,2,7));
         add(new obj_block(128,2080,1,6));
         add(new obj_block(544,1792,1,3));
         add(new obj_block(480,1856,2,1));
         add(new obj_block(160,1856,10,4));
         add(new obj_block(224,1696,1,5));
         add(new obj_block(576,1600,1,4));
         add(new obj_block(544,1664,1,1));
         add(new obj_block(224,1664,6,1));
         add(new obj_block(416,1600,1,3));
         add(new obj_block(448,1504,1,1));
         add(new obj_block(32,1664,4,1));
         add(new obj_block(32,1568,2,1));
         add(new obj_block(192,1568,6,1));
         add(new obj_block(384,1504,2,3));
         add(new obj_block(352,1376,2,1));
         add(new obj_block(32,1440,5,1));
         add(new obj_block(32,1472,3,1));
         add(new obj_block(32,1408,12,1));
         add(new obj_block(480,1248,1,9));
         add(new obj_block(352,1248,4,1));
         add(new obj_block(512,1152,3,1));
         add(new obj_block(128,1120,2,1));
         add(new obj_block(192,1120,3,4));
         add(new obj_block(288,928,7,2));
         add(new obj_block(192,928,3,1));
         add(new obj_block(128,864,12,2));
         add(new obj_block(608,672,1,62));
         add(new obj_block(0,672,1,62));
         add(new obj_block(32,640,2,1));
         add(new obj_block(544,640,2,1));
         add(new obj_block(448,608,3,1));
         add(new obj_block(96,608,3,1));
         add(new obj_block(192,0,3,19));
         add(new obj_block(352,0,3,19));
         add(new obj_block(96,2432,12,1));
         add(new obj_block(32,2336,12,1));
         add(new obj_block(160,2240,10,1));
         add(new obj_block(224,2144,12,1));
         add(new obj_block(128,2048,13,1));
         add(new obj_block(544,1952,2,1));
         add(new obj_block(32,1952,2,1));
         add(new obj_block(576,1440,1,1));
         add(new obj_block(288,992,5,8));
         if(global.hell_intro != 2)
         {
            add(new obj_hellblock(135 * 2,192 * 2,4,1));
         }
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
