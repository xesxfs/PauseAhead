package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.utils.Draw;
   
   public class obj_soundtest_page extends Entity
   {
       
      
      private const PAUZ:Class = obj_soundtest_page_PAUZ;
      
      public var sound_pause:Sfx;
      
      private const A4:Class = obj_soundtest_page_A4;
      
      private const BG24:Class = obj_soundtest_page_BG24;
      
      private const PAUSE:Class = obj_soundtest_page_PAUSE;
      
      private const PLAY:Class = obj_soundtest_page_PLAY;
      
      private const PLAYER:Class = obj_soundtest_page_PLAYER;
      
      public var spr_player:Spritemap;
      
      public var sprite_index:String = "spr_standright";
      
      public var animation_index:Number = 0;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.3;
      
      public var animation_max:Number = 5;
      
      public var twitter:Text;
      
      public var z:Image;
      
      public var track:int = -1;
      
      public var len:Number = 1;
      
      public var pos:Number = 0;
      
      public var awidth:Number = 356;
      
      public var switchpos:Boolean = false;
      
      public var newpos:Number = 0;
      
      public var wait:int = 0;
      
      public var wait2:int = 0;
      
      public var changing:Boolean = false;
      
      public var spr_back:Image;
      
      public var overback:Boolean = false;
      
      public var spr_pause:Image;
      
      public var spr_play:Image;
      
      public var overpause:Boolean = false;
      
      public function obj_soundtest_page()
      {
         this.sound_pause = new Sfx(this.PAUZ);
         this.spr_player = new Spritemap(this.PLAYER,64,62);
         this.twitter = new Text("@Billtron209    @flashygoodness");
         super();
         global.testplay = false;
         global.resume = false;
         this.z = new Image(this.BG24);
         this.spr_player.add("spr_runright",[0,1,2,3,4,5,6,7,8,9]);
         this.spr_player.add("spr_standright",[10]);
         this.spr_player.add("spr_jumpright",[11,12]);
         this.spr_player.add("spr_fallright",[13,14]);
         this.spr_player.add("spr_runleft",[15,16,17,18,19,20,21,22,23,24]);
         this.spr_player.add("spr_standleft",[25]);
         this.spr_player.add("spr_jumpleft",[26,27]);
         this.spr_player.add("spr_fallleft",[28,29]);
         this.spr_back = new Image(this.A4);
         this.spr_back.scale = 2;
         this.spr_back.centerOrigin();
         this.spr_pause = new Image(this.PAUSE);
         this.spr_pause.scale = 2;
         this.spr_pause.centerOrigin();
         this.spr_play = new Image(this.PLAY);
         this.spr_play.scale = 2;
         this.spr_play.centerOrigin();
         this.z.scale = 2;
         graphic = this.z;
         layer = 100;
         type = "soundtest";
         this.twitter.size = 18;
         this.twitter.align = "left";
         this.twitter.alpha = 0.4;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         var az:Number = NaN;
         super.update();
         if(this.changing == true)
         {
            az = FP.world.mouseX;
            if(az > 320 + this.awidth / 2)
            {
               az = 320 + this.awidth / 2;
            }
            if(az < 320 - this.awidth / 2)
            {
               az = 320 - this.awidth / 2;
            }
            this.newpos = this.len * (az - (320 - this.awidth / 2)) / this.awidth;
            if(Input.mouseReleased && this.changing == true)
            {
               this.changing = false;
               this.newpos = this.len * (az - (320 - this.awidth / 2)) / this.awidth;
               this.switchpos = true;
               this.wait2 = 4;
            }
         }
         if(FP.world.mouseY > 400 - 61 - 13 && FP.world.mouseY < 398 + 36 && FP.world.mouseX > 320 - this.awidth / 2 && FP.world.mouseX < 320 + this.awidth / 2)
         {
            if(Input.mousePressed && this.track != -1)
            {
               this.newpos = this.len * (FP.world.mouseX - (320 - this.awidth / 2)) / this.awidth;
               this.changing = true;
            }
         }
         this.wait = this.wait - 1;
         this.wait2 = this.wait2 - 1;
         this.animation_float = this.animation_float + this.animation_speed;
         if(this.animation_float >= 1)
         {
            this.animation_index = this.animation_index + 1;
            this.animation_float = 0;
         }
         if(this.animation_index > this.animation_max)
         {
            this.animation_index = 0;
         }
         if(this.track == -1)
         {
            global.testplay = false;
         }
         if(global.testplay)
         {
            this.sprite_index = "spr_runright";
            this.animation_max = 9;
            this.animation_speed = 0.2;
         }
         else
         {
            this.animation_index = 0;
            this.sprite_index = "spr_standright";
            this.animation_float = 0;
         }
         if(FP.world.mouseY < this.spr_back.height * this.spr_back.scale + 14 && FP.world.mouseX < this.spr_back.width * this.spr_back.scale + 14)
         {
            this.overback = true;
         }
         else
         {
            this.overback = false;
         }
         if(FP.world.mouseY < this.spr_pause.height * this.spr_pause.scale + 14 && FP.world.mouseX > 640 - this.spr_pause.width * this.spr_pause.scale - 20)
         {
            this.overpause = true;
         }
         else
         {
            this.overpause = false;
         }
         if(this.track != -1)
         {
            if(this.overpause && Input.mousePressed || (Input.pressed(Key.SHIFT) || Input.pressed(Key.C)))
            {
               this.sound_pause.play(global.volume * 1);
               global.testplay = !global.testplay;
               if(global.testplay)
               {
                  global.resume = true;
               }
            }
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
      }
      
      override public function render() : void
      {
         if(this.wait > 0)
         {
            this.pos = 0;
         }
         if(this.wait2 > 0)
         {
            this.pos = this.newpos;
         }
         x = 0;
         y = 0;
         graphic = this.z;
         super.render();
         x = 320 - this.twitter.width / 4 - 24;
         y = 480 - 160 + 4;
         graphic = this.twitter;
         super.render();
         Draw.rectPlus(320 - this.awidth / 2,FP.camera.y + 398,this.awidth * this.pos / this.len,36,8589426,1,true,1,8);
         graphic = this.spr_player;
         x = 320 - this.awidth / 2 + this.awidth * this.pos / this.len - 30;
         if(this.changing == true)
         {
            x = 320 - this.awidth / 2 + this.awidth * this.newpos / this.len - 30;
         }
         x = x - 4;
         y = 400 - 61 - 13;
         this.spr_player.play(this.sprite_index,true,this.animation_index);
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
         x = 640 - (this.spr_pause.width / 2 + 20);
         y = this.spr_pause.height / 2 + 14 + 10;
         if(global.testplay)
         {
            graphic = this.spr_pause;
         }
         else
         {
            graphic = this.spr_play;
         }
         if(this.overpause)
         {
            this.spr_pause.color = 16776960;
            this.spr_play.color = 16776960;
            y = y - 4;
         }
         else
         {
            this.spr_pause.color = 16777215;
            this.spr_play.color = 16777215;
         }
         super.render();
      }
   }
}
