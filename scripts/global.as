package
{
   public class global
   {
      
      public static var Copyright:String = "Askiisoft, 2013. Do not rebrand or re-distribute source.";
      
      public static var replayList:Array = [];
      
      public static var replayList2:Array = [];
      
      public static var achievementList:Array = [];
      
      public static var achievementQueue:Array = [];
      
      public static var master:obj_master;
      
      public static var player:obj_player;
      
      public static var replay:obj_replay;
      
      public static var mycamera:obj_camera;
      
      public static var room_width:int = 640;
      
      public static var room_height:int = 480;
      
      public static var pause:Boolean = false;
      
      public static var esc_pause:Boolean = false;
      
      public static var recording_id:Number = 0;
      
      public static var mute:Boolean = false;
      
      public static var blur:Boolean = false;
      
      public static var music_volume:Number = 0.8;
      
      public static var volume:Number = 1;
      
      public static var non_logo:Boolean = false;
      
      public static var yesno:Boolean = false;
      
      public static var pxoff:int = 0;
      
      public static var gaplevel:int = 0;
      
      public static var delay:int = 10;
      
      public static var frame:Array = new Array();
      
      public static var playerdust:int = 0;
      
      public static var playerdust1:Array = new Array();
      
      public static var playerdust2:Array = new Array();
      
      public static var playerx1:Array = new Array();
      
      public static var playery1:Array = new Array();
      
      public static var playersprite1:Array = new Array();
      
      public static var playerframe1:Array = new Array();
      
      public static var playerx2:Array = new Array();
      
      public static var playery2:Array = new Array();
      
      public static var playersprite2:Array = new Array();
      
      public static var playerframe2:Array = new Array();
      
      public static var level_start:int = 1;
      
      public static var speedrun_unlocked:Boolean = false;
      
      public static var speedrunning:Boolean = false;
      
      public static var level:int = 1;
      
      public static var begin_transit:Boolean = false;
      
      public static var level_1_text:Boolean = false;
      
      public static var level_2_text:Boolean = false;
      
      public static var level_3_text:Boolean = false;
      
      public static var level_4_text:Boolean = false;
      
      public static var level_5_text:Boolean = false;
      
      public static var level_6_text:Boolean = false;
      
      public static var level_7_text:Boolean = false;
      
      public static var level_8_text:Boolean = false;
      
      public static var level_9_text:Boolean = false;
      
      public static var level_10_text:Boolean = false;
      
      public static var level_11_text:Boolean = false;
      
      public static var level_12_text:Boolean = false;
      
      public static var level_13_text:Boolean = false;
      
      public static var level_14_text:Boolean = false;
      
      public static var level_15_text:Boolean = false;
      
      public static var level_16_text:Boolean = false;
      
      public static var level_17_text:Boolean = false;
      
      public static var level_18_text:Boolean = false;
      
      public static var level_19_text:Boolean = false;
      
      public static var level_20_text:Boolean = false;
      
      public static var level_21_text:Boolean = false;
      
      public static var level_22_text:Boolean = false;
      
      public static var level_23_text:Boolean = false;
      
      public static var level_24_text:Boolean = false;
      
      public static var level_25_text:Boolean = false;
      
      public static var level_27_text:Boolean = false;
      
      public static var level_28_text:Boolean = false;
      
      public static var level_29_text:Boolean = false;
      
      public static var level_speedrun_text:Boolean = false;
      
      public static var deaths:int = 0;
      
      public static var speedrun_deaths:int = 0;
      
      public static var playernumber:int = 0;
      
      public static var prev_playernumber:int = 0;
      
      public static var secret_1:Boolean = false;
      
      public static var secret_2:Boolean = false;
      
      public static var secret_3:Boolean = false;
      
      public static var speedrun_secret_1:Boolean = false;
      
      public static var speedrun_secret_2:Boolean = false;
      
      public static var speedrun_secret_3:Boolean = false;
      
      public static var speed_minute:int = 0;
      
      public static var speed_second:int = 0;
      
      public static var boss_actions:Array = new Array();
      
      public static var ending_song:int = 0;
      
      public static var masterplay:Boolean = false;
      
      public static var tendrilblock:Array = new Array(9);
      
      public static var boss:obj_boss;
      
      public static var gametime:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      
      public static var gamedeaths:Array = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      
      public static var shaketimer:int = 0;
      
      public static var music_unlocked:Array = new Array(1,0,0,0,0,0,0,0,0,0);
      
      public static var hell_intro:int = 0;
      
      public static var trinket_count:int = 0;
      
      public static var levelTrinket:Boolean = false;
      
      public static var speedrun_time:int = 0;
      
      public static var sunglasses:Boolean = false;
      
      public static var sunglasses_unlocked:Boolean = false;
      
      public static var muteObj:obj_mute = new obj_mute();
      
      public static var blackfadevol:Number = 0;
      
      public static var staticvol:Number = 0;
      
      public static var testplay:Boolean = false;
      
      public static var resume:Boolean = false;
      
      public static var achievement_1:Boolean = false;
      
      public static var achievement_2:Boolean = false;
      
      public static var achievement_3:Boolean = false;
      
      public static var achievement_4:Boolean = false;
      
      public static var achievement_5:Boolean = false;
      
      public static var achievement_6:Boolean = false;
      
      public static var achievement_7:Boolean = false;
      
      public static var achievement_8:Boolean = false;
      
      public static var achievement_9:Boolean = false;
      
      public static var achievement_10:Boolean = false;
      
      public static var achievement_11:Boolean = false;
      
      public static var achievement_12:Boolean = false;
      
      public static var achievement_13:Boolean = false;
      
      public static var achievement_14:Boolean = false;
      
      public static var achievement_15:Boolean = false;
      
      public static var achievement_16:Boolean = false;
      
      public static var achievement_17:Boolean = false;
      
      public static var achievement_18:Boolean = false;
      
      public static var achievement_19:Boolean = false;
      
      public static var achievement_20:Boolean = false;
      
      public static var vol_on:Boolean = false;
      
      public static var muted:Boolean = false;
      
      public static var hellkey_1:Boolean = false;
      
      public static var hellkey_2:Boolean = false;
      
      public static var helltext:int = 0;
      
      public static var pvolume:Number = 1;
      
      public static var flowerRub:int = 0;
      
      public static var allDeaths:int = 0;
      
      public static var soundtest:obj_soundtest_page;
       
      
      public function global()
      {
         super();
      }
   }
}
