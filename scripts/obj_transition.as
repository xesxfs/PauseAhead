package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_transition extends Entity
   {
       
      
      private const s_sbs3:Class = obj_transition_s_sbs3;
      
      public var sound_transition:Sfx;
      
      private const TRANSITION:Class = obj_transition_TRANSITION;
      
      public var spr_transition:Spritemap;
      
      public var goto:int = 1;
      
      public var clear:Boolean = false;
      
      public var i:Number = 0;
      
      public var z:Number = 0;
      
      public var count:Number = 0;
      
      public function obj_transition()
      {
         this.sound_transition = new Sfx(this.s_sbs3);
         this.spr_transition = new Spritemap(this.TRANSITION,320,32);
         super();
         if(global.begin_transit == true)
         {
            this.i = 36;
            global.begin_transit = false;
         }
         else if(global.mute == false)
         {
            this.sound_transition.play(global.volume * 1);
         }
         this.spr_transition.add("main",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]);
         this.spr_transition.scale = 2;
         graphic = this.spr_transition;
         this.spr_transition.play("main",true,0);
         graphic = this.spr_transition;
         layer = -700;
         type = "obj_transition";
      }
      
      override public function update() : void
      {
         var cc:obj_recordme = null;
         var cc2:obj_recordme2 = null;
         var cc6:obj_achievement = null;
         var myList:Array = null;
         var bb:obj_recordme = null;
         var myList2:Array = null;
         var bb1:obj_recordme2 = null;
         var cc3:obj_recordme = null;
         var cc4:obj_recordme2 = null;
         var cc5:obj_achievement = null;
         super.update();
         if(this.clear == true && global.levelTrinket == true)
         {
            global.levelTrinket = false;
            global.trinket_count = global.trinket_count + 1;
         }
         if(global.esc_pause == false)
         {
            this.i = this.i + 1;
            if(this.i == 36)
            {
               global.playerdust2 = [];
               global.playerx2 = [];
               global.playery2 = [];
               global.playersprite2 = [];
               global.playerframe2 = [];
               if(this.clear == true)
               {
                  global.recording_id = 0;
                  global.playerdust1 = [];
                  global.playerx1 = [];
                  global.playery1 = [];
                  global.playersprite1 = [];
                  global.playerframe1 = [];
               }
               else
               {
                  myList = [];
                  FP.world.getClass(obj_recordme,myList);
                  for each(bb in myList)
                  {
                     bb.trial = bb.trial + 1;
                     bb.frame = 0;
                  }
                  myList2 = [];
                  FP.world.getClass(obj_recordme2,myList2);
                  for each(bb1 in myList2)
                  {
                     bb1.trial = bb1.trial + 1;
                     bb1.frame = 0;
                  }
               }
               global.begin_transit = true;
               if(this.goto >= 0)
               {
                  global.level = this.goto;
                  if(global.speedrunning == false)
                  {
                     global.level_start = this.goto;
                  }
               }
               FP.world.getClass(obj_recordme,global.replayList);
               for each(cc in global.replayList)
               {
                  cc.objectx2 = [];
                  cc.objecty2 = [];
                  FP.world.remove(cc);
               }
               FP.world.getClass(obj_recordme2,global.replayList2);
               for each(cc2 in global.replayList2)
               {
                  cc2.objectx2 = [];
                  cc2.objecty2 = [];
                  cc2.objectdown2 = [];
                  FP.world.remove(cc2);
               }
               FP.world.getClass(obj_achievement,global.achievementList);
               for each(cc6 in global.achievementList)
               {
                  FP.world.remove(cc6);
               }
               global.delay = 14;
               FP.world.remove(global.muteObj);
               if(this.goto == -3)
               {
                  FP.world = new SoundTest();
               }
               if(this.goto == -2)
               {
                  FP.world = new Achievements();
               }
               if(this.goto == -1)
               {
                  FP.world = new title();
               }
               if(this.goto == 1)
               {
                  FP.world = new level_1();
               }
               if(this.goto == 2)
               {
                  FP.world = new level_2();
               }
               if(this.goto == 3)
               {
                  FP.world = new level_3();
               }
               if(this.goto == 4)
               {
                  FP.world = new level_4();
               }
               if(this.goto == 5)
               {
                  FP.world = new level_5();
               }
               if(this.goto == 6)
               {
                  FP.world = new level_6();
               }
               if(this.goto == 7)
               {
                  FP.world = new level_7();
               }
               if(this.goto == 8)
               {
                  FP.world = new level_8();
               }
               if(this.goto == 9)
               {
                  FP.world = new level_9();
               }
               if(this.goto == 10)
               {
                  FP.world = new level_10();
               }
               if(this.goto == 11)
               {
                  FP.world = new level_11();
               }
               if(this.goto == 12)
               {
                  FP.world = new level_12();
               }
               if(this.goto == 13)
               {
                  FP.world = new level_13();
               }
               if(this.goto == 14)
               {
                  FP.world = new level_14();
               }
               if(this.goto == 15)
               {
                  FP.world = new level_15();
               }
               if(this.goto == 16)
               {
                  FP.world = new level_16();
               }
               if(this.goto == 17)
               {
                  FP.world = new level_17();
               }
               if(this.goto == 18)
               {
                  FP.world = new level_18();
               }
               if(this.goto == 19)
               {
                  FP.world = new level_19();
               }
               if(this.goto == 20)
               {
                  FP.world = new level_20();
               }
               if(this.goto == 21)
               {
                  FP.world = new level_21();
               }
               if(this.goto == 22)
               {
                  FP.world = new level_22();
               }
               if(this.goto == 23)
               {
                  FP.world = new level_23();
               }
               if(this.goto == 24)
               {
                  FP.world = new level_24();
               }
               if(this.goto == 25)
               {
                  FP.world = new level_25();
               }
               if(this.goto == 26)
               {
                  FP.world = new level_26();
               }
               if(this.goto == 27)
               {
                  FP.world = new level_27();
               }
               if(this.goto == 28)
               {
                  FP.world = new level_28();
               }
               if(this.goto == 29)
               {
                  FP.world = new level_29();
               }
            }
            if(this.i == 37)
            {
               if(global.replayList.length > 0)
               {
                  for each(cc3 in global.replayList)
                  {
                     FP.world.add(cc3);
                  }
                  global.replayList = [];
               }
               if(global.replayList2.length > 0)
               {
                  for each(cc4 in global.replayList2)
                  {
                     FP.world.add(cc4);
                  }
                  global.replayList2 = [];
               }
               if(global.achievementList.length > 0)
               {
                  for each(cc5 in global.achievementList)
                  {
                     FP.world.add(cc5);
                  }
                  global.achievementList = [];
               }
            }
            if(this.i == 51 + 20)
            {
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         this.count = 0;
         this.z = 0;
         while(this.count < 16)
         {
            if(this.i - this.z < 51)
            {
               if(this.i - this.z < 17)
               {
                  this.spr_transition.play("main",true,Math.max(0,this.i - this.z));
               }
               if(this.i - this.z >= 17 && this.i - this.z <= 34)
               {
                  this.spr_transition.play("main",true,17);
               }
               if(this.i - this.z > 34)
               {
                  this.spr_transition.play("main",true,Math.max(0,52 - (this.i - this.z - (34 - 17))));
               }
            }
            else
            {
               this.spr_transition.play("main",true,0);
            }
            x = FP.camera.x;
            y = FP.camera.y + 480 - this.count * 32;
            super.render();
            this.count++;
            this.z++;
         }
      }
   }
}
