package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   
   public class obj_achievement_page extends Entity
   {
       
      
      private const SPIKES:Class = obj_achievement_page_SPIKES;
      
      public var spr_icon:Spritemap;
      
      private const A1:Class = obj_achievement_page_A1;
      
      private const A2:Class = obj_achievement_page_A2;
      
      private const A3:Class = obj_achievement_page_A3;
      
      private const A4:Class = obj_achievement_page_A4;
      
      public var selected:int = 0;
      
      public var offset:Number = 66;
      
      public var i:int = 0;
      
      public var spr_header:Image;
      
      public var spr_1:Image;
      
      public var spr_2:Image;
      
      public var spr_3:Image;
      
      public var spr_darken:Image;
      
      public var spr_back:Image;
      
      public var list_height:int = 64;
      
      public var desc_height:int = 32;
      
      public var blue:Boolean = false;
      
      public var unlocked:Boolean = false;
      
      public var myTxt:Text;
      
      public var sp_x:Number = 0;
      
      public var sp_y:Number = 0;
      
      public var sp_destx:Number = 0;
      
      public var sp_desty:Number = 0;
      
      public var overback:Boolean = false;
      
      public var hidden:Boolean = false;
      
      public var isHidden:Array;
      
      public var titles:Array;
      
      public var descriptions:Array;
      
      public function obj_achievement_page()
      {
         this.spr_icon = new Spritemap(this.SPIKES,20,20);
         this.myTxt = new Text("");
         this.isHidden = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
         this.titles = new Array("Thick Skull","Runaway Saw","See No Evil","Hear No Evil","Speak No Evil","Pushing Daisies","Treasure Hunter","You Hold The Key","Corrupt Beginnings","Escape","Sly","Untouchable","Slowpoke","King of Hell","Glutton For Punishment","Fast","Faster","Fastest","Trinket Collector","Champion");
         this.descriptions = new Array("Fail to grasp the core concept of Pausing","Let a special saw kill you before\nit disappears","Light all three boss statues in one go","Unlock all music in the sound test","Start a game with alternative dialogue","Brush against 500 flowers","Collect a secret","Collect all 3 secrets in one game","Return to the first level?","Complete the game","Complete the game with under 10 deaths","Complete the game with no deaths","Take over an hour to complete the game","Conquer the Belly of the Beast","Die over 600 times","Complete the game in under 15 minutes","Complete the game in under 10 minutes","Complete the game in under 5 minutes","Speedrun the game in under 5 minutes\nand collect all the trinkets","Unlock all achievements");
         super();
         this.descriptions[5] = this.descriptions[5] + (" (" + String(Math.max(500 - global.flowerRub,0)) + " to go)");
         this.descriptions[14] = this.descriptions[14] + (" (" + String(Math.max(600 - global.allDeaths,0)) + " to go)");
         type = "menupic";
         layer = -600;
         this.spr_1 = new Image(this.A1);
         this.spr_2 = new Image(this.A2);
         this.spr_3 = new Image(this.A3);
         this.spr_back = new Image(this.A4);
         this.spr_back.scale = 2;
         this.spr_back.centerOrigin();
         this.spr_icon.add("main",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);
         this.spr_icon.scale = 2;
         this.sp_x = 120 + 0 * 90 - 5;
         this.sp_destx = 120 + 0 * 90 - 5;
         this.sp_y = 74 + 0 * 70 - 5;
         this.sp_desty = 74 + 0 * 70 - 5;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         this.i = 0;
         var b:int = 0;
         var a:int = 0;
         while(a < 4)
         {
            while(b < 5)
            {
               if(FP.world.mouseX > 120 + b * 90 - (90 - 40) / 2 && FP.world.mouseY > 74 + a * 70 - (70 - 40) / 2 && FP.world.mouseX < 120 + b * 90 + 40 + (90 - 40) / 2 && FP.world.mouseY < 74 + a * 70 + 40 + (70 - 40) / 2)
               {
                  this.selected = this.i;
                  this.sp_destx = 120 + b * 90 - 5;
                  this.sp_desty = 74 + a * 70 - 5;
               }
               this.i = this.i + 1;
               b = b + 1;
            }
            a = a + 1;
            b = 0;
         }
         super.update();
         if(FP.world.mouseY > 400)
         {
            this.offset = this.offset - (FP.world.mouseY - 400) / 15;
         }
         if(FP.world.mouseY < 80)
         {
            this.offset = this.offset + (80 - FP.world.mouseY) / 15;
         }
         if(this.offset > 66)
         {
            this.offset = 66;
         }
         if(this.offset < -(64 * 20 - 480))
         {
            this.offset = -(64 * 20 - 480);
         }
         if(FP.world.mouseY < this.spr_back.height * this.spr_back.scale + 14 && FP.world.mouseX < this.spr_back.width * this.spr_back.scale + 14)
         {
            this.overback = true;
         }
         else
         {
            this.overback = false;
         }
         if(FP.world.typeCount("obj_transition") == 0)
         {
            if(this.overback && Input.mousePressed || Input.pressed(Key.ESCAPE))
            {
               t = new obj_transition();
               world.add(t);
               t.clear = false;
               t.goto = -1;
            }
         }
         if(this.sp_x < this.sp_destx)
         {
            this.sp_x = this.sp_x + Math.abs(this.sp_destx - this.sp_x) / 4;
         }
         if(this.sp_x > this.sp_destx)
         {
            this.sp_x = this.sp_x - Math.abs(this.sp_destx - this.sp_x) / 4;
         }
         if(this.sp_y < this.sp_desty)
         {
            this.sp_y = this.sp_y + Math.abs(this.sp_desty - this.sp_y) / 4;
         }
         if(this.sp_y > this.sp_desty)
         {
            this.sp_y = this.sp_y - Math.abs(this.sp_desty - this.sp_y) / 4;
         }
         if(FP.distance(this.sp_x,this.sp_y,this.sp_destx,this.sp_desty) < 1)
         {
            this.sp_x = this.sp_destx;
            this.sp_y = this.sp_desty;
         }
      }
      
      override public function render() : void
      {
         x = 0;
         y = 0;
         graphic = this.spr_2;
         super.render();
         this.i = 0;
         y = this.offset;
         x = 0;
         this.blue = false;
         this.unlocked = false;
         var b:int = 0;
         var a:int = 0;
         while(a < 4)
         {
            while(b < 5)
            {
               this.unlocked = false;
               this.hidden = false;
               if(this.i == 0 && global.achievement_1 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 1 && global.achievement_2 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 2 && global.achievement_3 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 3 && global.achievement_4 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 4 && global.achievement_5 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 5 && global.achievement_6 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 6 && global.achievement_7 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 7 && global.achievement_8 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 8 && global.achievement_9 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 9 && global.achievement_10 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 10 && global.achievement_11 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 11 && global.achievement_12 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 12 && global.achievement_13 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 13 && global.achievement_14 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 14 && global.achievement_15 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 15 && global.achievement_16 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 16 && global.achievement_17 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 17 && global.achievement_18 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 18 && global.achievement_19 == true)
               {
                  this.unlocked = true;
               }
               if(this.i == 19 && global.achievement_20 == true)
               {
                  this.unlocked = true;
               }
               this.isHidden[this.i] = 0;
               if((this.i == 2 || this.i == 6 || this.i == 7 || this.i == 8 || this.i == 9 || this.i == 13) && this.unlocked == false)
               {
                  this.isHidden[this.i] = 1;
                  this.hidden = true;
               }
               x = 120 + b * 90;
               y = 74 + a * 70;
               this.spr_icon.play("main",true,this.i + 1);
               graphic = this.spr_icon;
               super.render();
               if(this.unlocked == false)
               {
                  this.spr_icon.play("main",true,0);
                  this.spr_icon.alpha = 0.85;
                  if(this.hidden)
                  {
                     this.spr_icon.alpha = 1;
                  }
               }
               graphic = this.spr_icon;
               super.render();
               this.spr_icon.alpha = 1;
               x = x - 5;
               y = y - 5;
               graphic = this.spr_1;
               super.render();
               b = b + 1;
               this.i = this.i + 1;
            }
            b = 0;
            a = a + 1;
         }
         x = this.sp_x;
         y = this.sp_y;
         graphic = this.spr_3;
         super.render();
         y = 340;
         this.myTxt.size = 30;
         this.myTxt.text = this.titles[this.selected];
         this.myTxt.align = "center";
         this.myTxt.color = 5987163;
         x = 320 - this.myTxt.width / 2;
         graphic = this.myTxt;
         super.render();
         y = 380;
         this.myTxt.size = 24;
         this.myTxt.text = this.descriptions[this.selected];
         if(this.isHidden[this.selected])
         {
            this.myTxt.text = "This is a hidden achievement";
         }
         this.myTxt.align = "center";
         this.myTxt.color = 16777215;
         x = 320 - this.myTxt.width / 2;
         graphic = this.myTxt;
         super.render();
         x = this.spr_back.width / 2 + 14;
         y = this.spr_back.height / 2 + 14 + 10;
         graphic = this.spr_back;
         if(this.overback)
         {
            this.spr_back.color = 16776960;
            y = y - 4;
         }
         else
         {
            this.spr_back.color = 16777215;
         }
         super.render();
      }
   }
}
