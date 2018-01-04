package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_results extends Entity
   {
       
      
      public var makeAS:Boolean = false;
      
      public var AS:Entity;
      
      private const C:Class = obj_results_C;
      
      private const mybg:Class = obj_results_mybg;
      
      public var img:Image;
      
      public var alpha:Number = 1;
      
      public var text:Text;
      
      public var stats:String;
      
      public var text1:Text;
      
      public var stats1:String;
      
      public var text2:Text;
      
      public var stats2:String;
      
      public var text3:Text;
      
      public var stats3:String;
      
      public var secrets:int = 0;
      
      public var second:Array;
      
      public var minute:Array;
      
      public var deaths:int = 0;
      
      public var totalsecond:int = 0;
      
      public var totalminute:int = 0;
      
      public var offset:Number = 0;
      
      public var page:int = 0;
      
      public var row:int = 0;
      
      public var timescore:int = 0;
      
      public var ax:int = 0;
      
      public var spd:int = 1;
      
      public var z:Image;
      
      public function obj_results()
      {
         var myTime:int = 0;
         this.second = new Array();
         this.minute = new Array();
         super();
         this.z = new Image(this.C);
         this.img = new Image(this.mybg);
         this.img.scale = 2;
         x = 50;
         y = 50;
         layer = -35;
         type = "obj_results";
         this.stats = "RESULTS";
         if(global.speedrunning)
         {
            if(global.speedrun_secret_1)
            {
               this.secrets = this.secrets + 1;
            }
            if(global.speedrun_secret_2)
            {
               this.secrets = this.secrets + 1;
            }
            if(global.speedrun_secret_3)
            {
               this.secrets = this.secrets + 1;
            }
         }
         else
         {
            if(global.secret_1)
            {
               this.secrets = this.secrets + 1;
            }
            if(global.secret_2)
            {
               this.secrets = this.secrets + 1;
            }
            if(global.secret_3)
            {
               this.secrets = this.secrets + 1;
            }
         }
         var i:int = 0;
         for(i = 0; i < 27; i++)
         {
            this.deaths = this.deaths + global.gamedeaths[i];
         }
         if(this.deaths < 10)
         {
            global.achievementQueue.push(11);
         }
         if(this.deaths == 0)
         {
            global.achievementQueue.push(12);
         }
         var totalTime:int = 0;
         for(i = 0; i < 27; i++)
         {
            totalTime = totalTime + global.gametime[i];
         }
         this.timescore = totalTime * (1000 / 60);
         this.totalminute = 0;
         this.totalsecond = 0;
         var myCounter:int = 0;
         while(totalTime > 0)
         {
            myCounter = myCounter + 1;
            totalTime = totalTime - 1;
            if(myCounter >= 60)
            {
               myCounter = 0;
               this.totalsecond = this.totalsecond + 1;
               if(this.totalsecond >= 60)
               {
                  this.totalsecond = 0;
                  this.totalminute = this.totalminute + 1;
               }
            }
         }
         if(this.totalminute >= 60)
         {
            global.achievementQueue.push(13);
         }
         if(this.totalminute < 15)
         {
            global.achievementQueue.push(16);
         }
         if(this.totalminute < 10)
         {
            global.achievementQueue.push(17);
         }
         if(this.totalminute < 5)
         {
            global.achievementQueue.push(18);
         }
         if(this.totalminute < 5 && global.trinket_count >= 21)
         {
            global.achievementQueue.push(19);
         }
         for(i = 0; i < 27; i++)
         {
            this.second.push(0);
            this.minute.push(0);
            myTime = 0;
            myTime = global.gametime[i];
            myCounter = 0;
            while(myTime > 0)
            {
               myCounter = myCounter + 1;
               myTime = myTime - 1;
               if(myCounter >= 60)
               {
                  myCounter = 0;
                  this.second[i] = this.second[i] + 1;
                  if(this.second[i] >= 60)
                  {
                     this.second[i] = 0;
                     this.minute[i] = this.minute[i] + 1;
                  }
               }
            }
         }
         this.stats = this.stats + "\nTotal Deaths - ";
         if(global.speedrunning == false)
         {
            this.stats = this.stats + String(this.deaths);
         }
         else
         {
            this.stats = this.stats + String(this.deaths);
         }
         this.stats = this.stats + "\nTotal Time - ";
         this.stats = this.stats + (String(this.totalminute) + " : ");
         if(this.totalsecond < 10)
         {
            this.stats = this.stats + "0";
         }
         this.stats = this.stats + String(this.totalsecond);
         this.stats = this.stats + ("\n\n" + String(this.secrets) + "/3 Secrets Collected");
         if(global.speedrunning)
         {
            this.stats = this.stats + ("\n" + String(global.trinket_count) + "/21 Trinkets Collected\n");
         }
         else
         {
            this.stats = this.stats + "\n";
         }
         this.stats = this.stats + "\nPress [ESC] to return to the menu.\n\n\n\n\n\n\n\n\n\n\nPress DOWN to see stats";
         this.stats1 = "LEVEL";
         this.stats2 = "TIME";
         this.stats3 = "DEATHS";
         var aaaz:int = 0;
         while(aaaz < 27)
         {
            if(this.minute[aaaz] + this.second[aaaz] > 0 || aaaz < 23)
            {
               this.row = this.row + 1;
               if(aaaz < 22)
               {
                  this.stats1 = this.stats1 + ("\n" + String(aaaz + 1));
               }
               else
               {
                  if(aaaz == 22)
                  {
                     this.stats1 = this.stats1 + "\nBoss";
                  }
                  if(aaaz == 23)
                  {
                     this.stats1 = this.stats1 + "\nSecret1";
                  }
                  if(aaaz == 24)
                  {
                     this.stats1 = this.stats1 + "\nSecret2";
                  }
                  if(aaaz == 25)
                  {
                     this.stats1 = this.stats1 + "\nSecret3";
                  }
                  if(aaaz == 26)
                  {
                     this.stats1 = this.stats1 + "\n???";
                  }
               }
               this.stats2 = this.stats2 + ("\n" + String(this.minute[aaaz]) + ":");
               if(this.second[aaaz] < 10)
               {
                  this.stats2 = this.stats2 + "0";
               }
               this.stats2 = this.stats2 + String(this.second[aaaz]);
               this.stats3 = this.stats3 + ("\n" + String(global.gamedeaths[aaaz]));
            }
            aaaz = aaaz + 1;
         }
         this.text = new Text(this.stats);
         this.text.align = "center";
         this.text.size = 20;
         this.text.color = 16777215;
         this.text1 = new Text(this.stats1);
         this.text1.align = "center";
         this.text1.size = 16;
         this.text1.color = 16777215;
         this.text2 = new Text(this.stats2);
         this.text2.align = "center";
         this.text2.size = 16;
         this.text2.color = 16777215;
         this.text3 = new Text(this.stats3);
         this.text3.align = "center";
         this.text3.size = 16;
         this.text3.color = 16777215;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         if(this.makeAS == false)
         {
            this.AS = new obj_submitAS(this.timescore);
            world.add(this.AS);
            this.makeAS = true;
         }
         this.AS.y = -this.offset + 250;
         super.update();
         if(this.alpha > 0)
         {
            this.alpha = this.alpha - 0.01;
         }
         this.ax = this.ax - this.spd;
         if(this.ax < 0)
         {
            this.ax = 640 + this.ax;
         }
         if(Input.pressed(Key.DOWN) && this.page == 0)
         {
            this.page = 1;
         }
         if(Input.pressed(Key.UP) && this.page == 1)
         {
            this.page = 0;
         }
         if(this.page == 0 && this.offset > 0)
         {
            this.offset = this.offset - this.offset / 16;
         }
         if(this.page == 1 && this.offset < 480)
         {
            this.offset = this.offset + (480 - this.offset) / 16;
         }
         if(Input.pressed(Key.ESCAPE))
         {
            if(FP.world.typeCount("obj_transition") == 0)
            {
               t = new obj_transition();
               world.add(t);
               t.clear = false;
               t.goto = -1;
               global.masterplay = false;
               global.ending_song = 0;
            }
         }
      }
      
      override public function render() : void
      {
         graphic = this.z;
         var bz:int = -1;
         while(bz <= 1)
         {
            y = 0;
            x = this.ax + 640 * bz;
            super.render();
            bz = bz + 1;
         }
         graphic = this.img;
         x = 0;
         y = -this.offset;
         super.render();
         x = 44;
         y = 50 - this.offset;
         graphic = this.text;
         super.render();
         Draw.rect(128,-this.offset + 480,global.room_width - 256,16,16744448,0.6,false);
         var ay:int = 16;
         while(ay <= Math.max(25,this.row) * 16)
         {
            Draw.rect(128,-this.offset + 480 + ay,global.room_width - 256,16,3161,0.8,false);
            ay = ay + 32;
         }
         ay = 32;
         while(ay <= Math.max(25,this.row) * 16)
         {
            Draw.rect(128,-this.offset + 480 + ay,global.room_width - 256,16,10783755,0.4,false);
            ay = ay + 32;
         }
         x = 130;
         y = -this.offset + 480;
         graphic = this.text1;
         super.render();
         x = 300 - 5;
         y = -this.offset + 480;
         graphic = this.text2;
         super.render();
         x = 640 - 210 - 16;
         y = -this.offset + 480;
         graphic = this.text3;
         super.render();
         if(this.alpha > 0)
         {
            Draw.rect(0,0,640,480,16777215,this.alpha,false);
         }
      }
   }
}
