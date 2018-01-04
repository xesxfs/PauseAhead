package
{
   import net.flashpunk.Engine;
   import net.flashpunk.World;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   
   [Frame(factoryClass="Preloader")]
   [SWF(width="640",height="480")]
   public class Main extends Engine
   {
      
      public static var currentworld:World;
       
      
      private const s_sbs124:Class = Main_s_sbs124;
      
      public var sound_static:Sfx;
      
      private const s_sbs12:Class = Main_s_sbs12;
      
      public var sound_hell_intro:Sfx;
      
      private const s_sbs13:Class = Main_s_sbs13;
      
      public var sound_hell:Sfx;
      
      private const s_sbs6:Class = Main_s_sbs6;
      
      public var sound_ending:Sfx;
      
      private const s_sbs7:Class = Main_s_sbs7;
      
      public var sound_ending2:Sfx;
      
      private const s_sbs5:Class = Main_s_sbs5;
      
      public var sound_boss:Sfx;
      
      private const s_sbs4:Class = Main_s_sbs4;
      
      public var sound_ambiance:Sfx;
      
      private const s_sbs:Class = Main_s_sbs;
      
      public var sound_sbs:Sfx;
      
      private const s_sbs2:Class = Main_s_sbs2;
      
      public var sound_sbs2:Sfx;
      
      private const s_sbs3:Class = Main_s_sbs3;
      
      public var sound_sbs3:Sfx;
      
      private const s_sbs123:Class = Main_s_sbs123;
      
      public var sound_resignation:Sfx;
      
      public var track:int = 0;
      
      public var track_ref:Sfx;
      
      public var static_wait:int = 0;
      
      public function Main()
      {
         this.sound_static = new Sfx(this.s_sbs124);
         this.sound_hell_intro = new Sfx(this.s_sbs12);
         this.sound_hell = new Sfx(this.s_sbs13);
         this.sound_ending = new Sfx(this.s_sbs6);
         this.sound_ending2 = new Sfx(this.s_sbs7);
         this.sound_boss = new Sfx(this.s_sbs5);
         this.sound_ambiance = new Sfx(this.s_sbs4);
         this.sound_sbs = new Sfx(this.s_sbs);
         this.sound_sbs2 = new Sfx(this.s_sbs2);
         this.sound_sbs3 = new Sfx(this.s_sbs3);
         this.sound_resignation = new Sfx(this.s_sbs123);
         super(640,480,60,false);
         FP.world = new pretitle();
      }
      
      override public function update() : void
      {
         if(FP.world.typeCount("staticfade") != 0)
         {
            this.static_wait = 5;
         }
         this.static_wait = this.static_wait - 1;
         if(this.static_wait > 0)
         {
            if(this.sound_static.playing == false)
            {
               this.sound_static.loop();
            }
            this.sound_static.volume = global.volume * global.staticvol * 0.8;
         }
         if(global.achievement_1 && global.achievement_2 && global.achievement_3 && global.achievement_4 && global.achievement_5 && global.achievement_6 && global.achievement_7 && global.achievement_8 && global.achievement_9 && global.achievement_10 && global.achievement_12 && global.achievement_13 && global.achievement_14 && global.achievement_15 && global.achievement_16 && global.achievement_17 && global.achievement_18 && global.achievement_19 && global.achievement_20 == false)
         {
            global.achievementQueue.push(20);
         }
         this.track = 0;
         Text.size = 30;
         Text.align = "center";
         if(FP.world.typeCount("menupic") != 0)
         {
            this.track = 1;
         }
         if((global.level == 1 || global.level >= 21 && global.level != 23) && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0 && global.non_logo == true)
         {
            this.track = 10;
         }
         if(global.level < 9 && global.level > 1 && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0)
         {
            this.track = 3;
         }
         if(global.level >= 9 && global.level < 21 && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0)
         {
            this.track = 4;
         }
         if(global.level == 23 && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0 && FP.world.classCount(obj_boss) != 0)
         {
            this.track = 5;
         }
         if(global.level == 23 && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0 && FP.world.classCount(obj_boss) == 0)
         {
            this.track = 10;
         }
         if(global.ending_song == 1)
         {
            this.track = 6;
         }
         if(global.ending_song == 2)
         {
            this.track = 7;
         }
         if(global.level >= 27 && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0 && FP.world.classCount(obj_boss) == 0 && global.hell_intro < 2)
         {
            this.track = 8;
         }
         if(global.level >= 27 && FP.world.typeCount("menupic") == 0 && FP.world.typeCount("askiisoft") == 0 && FP.world.classCount(obj_boss) == 0 && global.hell_intro == 2)
         {
            this.track = 9;
         }
         if(FP.world.classCount(obj_hell_ending) != 0 && FP.world.typeCount("menupic") == 0)
         {
            this.track = 2;
         }
         global.music_unlocked[this.track] = 1;
         if(global.music_unlocked[1] + global.music_unlocked[2] + global.music_unlocked[3] + global.music_unlocked[4] + global.music_unlocked[5] + global.music_unlocked[6] + global.music_unlocked[7] + global.music_unlocked[8] + global.music_unlocked[9] + global.music_unlocked[10] == 10)
         {
            if(global.achievement_4 == false)
            {
               global.achievementQueue.push(4);
            }
         }
         if(FP.world.typeCount("soundtest") != 0)
         {
            if(global.soundtest.track == -1)
            {
               this.track = 0;
            }
            if(global.soundtest.track == 1)
            {
               this.track = 1;
            }
            if(global.soundtest.track == 2)
            {
               this.track = 3;
            }
            if(global.soundtest.track == 3)
            {
               this.track = 4;
            }
            if(global.soundtest.track == 4)
            {
               this.track = 5;
            }
            if(global.soundtest.track == 5)
            {
               this.track = 6;
            }
            if(global.soundtest.track == 6)
            {
               this.track = 7;
            }
            if(global.soundtest.track == 7)
            {
               this.track = 8;
            }
            if(global.soundtest.track == 8)
            {
               this.track = 9;
            }
            if(global.soundtest.track == 9)
            {
               this.track = 2;
            }
            if(this.track == 1)
            {
               this.track_ref = this.sound_sbs;
            }
            if(this.track == 2)
            {
               this.track_ref = this.sound_resignation;
            }
            if(this.track == 3)
            {
               this.track_ref = this.sound_sbs2;
            }
            if(this.track == 4)
            {
               this.track_ref = this.sound_sbs3;
            }
            if(this.track == 5)
            {
               this.track_ref = this.sound_boss;
            }
            if(this.track == 6)
            {
               this.track_ref = this.sound_ending;
            }
            if(this.track == 7)
            {
               this.track_ref = this.sound_ending2;
            }
            if(this.track == 8)
            {
               this.track_ref = this.sound_hell_intro;
            }
            if(this.track == 9)
            {
               this.track_ref = this.sound_hell;
            }
            if(this.track > 0)
            {
               global.soundtest.len = this.track_ref.length;
               global.soundtest.pos = this.track_ref.position;
               if(global.soundtest.switchpos)
               {
                  this.track_ref.setPos(global.soundtest.newpos);
                  global.soundtest.switchpos = false;
               }
            }
            if(global.testplay == false)
            {
               this.track = 0;
            }
            if(global.resume == true)
            {
               this.track_ref.resume();
               global.resume = false;
            }
         }
         else
         {
            if(this.track == 6)
            {
               if(this.sound_ending.playing == false && global.masterplay == true)
               {
                  if(global.mute == false)
                  {
                     global.masterplay = false;
                     this.sound_ending.play(global.music_volume);
                  }
                  else
                  {
                     global.masterplay = false;
                     this.sound_ending.play(0);
                  }
               }
            }
            else
            {
               this.sound_ending.stop();
            }
            if(this.track == 7)
            {
               if(this.sound_ending2.playing == false && global.masterplay == true)
               {
                  if(global.mute == false)
                  {
                     global.masterplay = false;
                     this.sound_ending2.play(global.music_volume);
                  }
                  else
                  {
                     global.masterplay = false;
                     this.sound_ending2.play(0);
                  }
               }
            }
            else
            {
               this.sound_ending2.stop();
            }
         }
         if(global.mute == false || global.mute == true)
         {
            if(this.track == 1)
            {
               if(this.sound_sbs.playing == false)
               {
                  this.sound_sbs.loop(global.music_volume);
               }
            }
            else
            {
               this.sound_sbs.stop();
            }
            if(this.track == 2)
            {
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  if(this.sound_resignation.playing == false)
                  {
                     this.sound_resignation.loop(global.music_volume);
                  }
               }
            }
            else
            {
               this.sound_resignation.stop();
            }
            if(this.track == 10)
            {
               if(this.sound_ambiance.playing == false)
               {
                  this.sound_ambiance.loop(global.music_volume);
               }
            }
            else
            {
               this.sound_ambiance.stop();
            }
            if(this.track == 3)
            {
               if(this.sound_sbs2.playing == false)
               {
                  this.sound_sbs2.loop(global.music_volume);
               }
            }
            else
            {
               this.sound_sbs2.stop();
            }
            if(this.track == 4)
            {
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  if(this.sound_sbs3.playing == false)
                  {
                     this.sound_sbs3.loop(global.music_volume);
                  }
               }
            }
            else
            {
               this.sound_sbs3.stop();
            }
            if(this.track == 5)
            {
               if(FP.world.typeCount("obj_blacktext") == 0)
               {
                  if(this.sound_boss.playing == false)
                  {
                     this.sound_boss.loop(global.music_volume);
                  }
               }
            }
            else
            {
               this.sound_boss.stop();
            }
            if(FP.world.typeCount("soundtest") != 0)
            {
               if(this.track == 6)
               {
                  if(FP.world.typeCount("obj_blacktext") == 0)
                  {
                     if(this.sound_ending.playing == false)
                     {
                        this.sound_ending.loop(global.music_volume);
                     }
                  }
               }
               else
               {
                  this.sound_ending.stop();
               }
               if(this.track == 7)
               {
                  if(FP.world.typeCount("obj_blacktext") == 0)
                  {
                     if(this.sound_ending2.playing == false)
                     {
                        this.sound_ending2.loop(global.music_volume);
                     }
                  }
               }
               else
               {
                  this.sound_ending2.stop();
               }
            }
            if(FP.world.typeCount("soundtest") == 0)
            {
               if(this.track == 8)
               {
                  if(FP.world.typeCount("obj_blacktext") == 0 || FP.world.typeCount("obj_blacktext") != 0 && global.helltext > 0)
                  {
                     if(this.sound_hell_intro.playing == false)
                     {
                        if(global.hell_intro == 0)
                        {
                           this.sound_hell_intro.play(global.music_volume);
                           global.hell_intro = global.hell_intro + 1;
                        }
                        else if(global.esc_pause == false)
                        {
                           global.pause = false;
                           global.hell_intro = 2;
                           FP.world.add(new obj_whiteflash3());
                           FP.world.add(new obj_shake2());
                        }
                     }
                     else if(this.sound_hell_intro.position >= 13.75)
                     {
                        if(global.hell_intro == 1)
                        {
                           if(global.esc_pause == false)
                           {
                              global.pause = false;
                              global.hell_intro = 2;
                              FP.world.add(new obj_whiteflash3());
                              FP.world.add(new obj_shake2());
                           }
                        }
                     }
                  }
               }
               else if(this.track != 9)
               {
                  this.sound_hell_intro.stop();
               }
            }
            else if(this.track == 8)
            {
               if(FP.world.typeCount("obj_blacktext") == 0 || FP.world.typeCount("obj_blacktext") != 0 && global.helltext > 0)
               {
                  if(this.sound_hell_intro.playing == false)
                  {
                     this.sound_hell_intro.loop(global.music_volume);
                  }
               }
            }
            else
            {
               this.sound_hell_intro.stop();
            }
            if(this.track == 9)
            {
               if(FP.world.typeCount("obj_blacktext") == 0 || FP.world.typeCount("obj_blacktext") != 0 && global.helltext > 0)
               {
                  if(this.sound_hell.playing == false)
                  {
                     this.sound_hell.loop(global.music_volume);
                  }
               }
            }
            else
            {
               this.sound_hell.stop();
            }
         }
         if(Input.pressed(Key.O))
         {
            global.blur = !global.blur;
         }
         if(global.mute == false)
         {
            global.pvolume = global.volume;
         }
         if(Input.pressed(Key.M))
         {
            global.muted = true;
            global.mute = !global.mute;
            if(global.mute == false)
            {
               global.volume = global.pvolume;
            }
            else
            {
               global.volume = 0;
            }
         }
         if(global.mute == true)
         {
            if(this.sound_sbs.playing == true)
            {
               this.sound_sbs.volume = 0;
            }
            if(this.sound_sbs2.playing == true)
            {
               this.sound_sbs2.volume = 0;
            }
            if(this.sound_sbs3.playing == true)
            {
               this.sound_sbs3.volume = 0;
            }
            if(this.sound_ambiance.playing == true)
            {
               this.sound_ambiance.volume = 0;
            }
            if(this.sound_boss.playing == true)
            {
               this.sound_boss.volume = 0;
            }
            if(this.sound_ending.playing == true)
            {
               this.sound_ending.volume = 0;
            }
            if(this.sound_ending2.playing == true)
            {
               this.sound_ending2.volume = 0;
            }
            if(this.sound_hell.playing == true)
            {
               this.sound_hell.volume = 0;
            }
            if(this.sound_hell_intro.playing == true)
            {
               this.sound_hell_intro.volume = 0;
            }
            if(this.sound_resignation.playing == true)
            {
               this.sound_resignation.volume = 0;
            }
         }
         else
         {
            if(this.sound_sbs.playing == true)
            {
               this.sound_sbs.volume = global.volume * 0.8;
            }
            if(this.sound_sbs2.playing == true)
            {
               this.sound_sbs2.volume = global.volume * 0.8;
            }
            if(this.sound_sbs3.playing == true)
            {
               this.sound_sbs3.volume = global.volume * 0.8;
            }
            if(this.sound_ambiance.playing == true)
            {
               this.sound_ambiance.volume = global.volume * 0.8;
            }
            if(this.sound_boss.playing == true)
            {
               this.sound_boss.volume = global.volume * 0.8;
            }
            if(this.sound_ending.playing == true)
            {
               this.sound_ending.volume = global.volume * 0.8;
            }
            if(this.sound_ending2.playing == true)
            {
               this.sound_ending2.volume = global.volume * 0.8;
            }
            if(this.sound_hell.playing == true)
            {
               this.sound_hell.volume = global.volume * 0.8 - global.blackfadevol * 0.8;
            }
            if(this.sound_hell_intro.playing == true)
            {
               this.sound_hell_intro.volume = global.volume * 0.8;
            }
            if(this.sound_resignation.playing == true)
            {
               this.sound_resignation.volume = global.volume * 0.8;
            }
         }
         super.update();
      }
   }
}
