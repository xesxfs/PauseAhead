package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_slide1 extends Entity
   {
       
      
      private const s_t1:Class = obj_slide1_s_t1;
      
      public var sound_touch1:Sfx;
      
      private const s_t2:Class = obj_slide1_s_t2;
      
      public var sound_touch2:Sfx;
      
      private const HAND:Class = obj_slide1_HAND;
      
      public var spr_hand:Spritemap;
      
      private const CRACK:Class = obj_slide1_CRACK;
      
      public var spr_crack:Spritemap;
      
      public var hand_x:Number = 0;
      
      public var hand_y:Number = 0;
      
      public var crack_x:Number = 0;
      
      public var crack_y:Number = 0;
      
      public var f:Number = 0;
      
      public var hand:int = 0;
      
      public var crack:int = 0;
      
      public var part:int = 0;
      
      public var shake:int = 0;
      
      public function obj_slide1()
      {
         this.sound_touch1 = new Sfx(this.s_t1);
         this.sound_touch2 = new Sfx(this.s_t2);
         this.spr_hand = new Spritemap(this.HAND,238,174);
         this.spr_crack = new Spritemap(this.CRACK,102,186);
         super();
         global.ending_song = 1;
         global.masterplay = true;
         this.spr_hand.add("main",[0,1]);
         graphic = this.spr_hand;
         this.spr_hand.play("main",true,this.hand);
         this.spr_crack.add("main",[0,1,2]);
         graphic = this.spr_crack;
         this.spr_crack.play("main",true,this.crack);
         layer = 0;
         type = "obj_slide1";
      }
      
      public function point_distance(x1:Number, y1:Number, x2:Number, y2:Number) : Number
      {
         return Math.sqrt(Math.pow(x1 - x2,2) + Math.pow(y1 - y2,2));
      }
      
      public function random(max:Number) : Number
      {
         return Math.random() * max;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            if(this.part == 0)
            {
               if(this.f == 0)
               {
                  global.achievementQueue.push(10);
               }
               this.f = this.f + this.point_distance(0,this.f,0,500) / 60;
               this.hand_x = Math.round(this.f / 4) - 140;
               this.hand_y = 320 - Math.round(this.f / 4);
               this.crack_x = Math.round(-this.f / 6 + 320);
               this.crack_y = 100 + Math.round(this.f / 16);
               if(this.f > 450)
               {
                  this.part = 1;
                  this.shake = 40;
                  FP.world.add(new obj_flash());
                  if(global.mute == false)
                  {
                     this.sound_touch1.play(global.volume * 1);
                  }
               }
            }
            if(this.part == 1)
            {
               this.shake = this.shake - 1;
               this.hand = 1;
               this.crack = 1;
               this.f = this.f - this.point_distance(0,this.f,0,350) / 15;
               this.hand_x = Math.round(this.f / 4) - 140;
               this.hand_y = 320 - Math.round(this.f / 4);
               this.crack_x = Math.round(-450 / 6 + 320);
               this.crack_y = 100 + Math.round(450 / 16);
               if(this.shake > 0)
               {
                  this.hand_x = this.hand_x + (this.random(3) - this.random(3));
                  this.hand_y = this.hand_y + (this.random(3) - this.random(3));
                  this.crack_x = this.crack_x + (this.random(2) - this.random(2));
                  this.crack_y = this.crack_y + (this.random(2) - this.random(2));
               }
               if(this.f < 350.4)
               {
                  this.part = 2;
                  this.shake = 40;
                  FP.world.add(new obj_flash());
                  if(global.mute == false)
                  {
                     this.sound_touch2.play(global.volume * 1);
                  }
               }
            }
            if(this.part == 2)
            {
               this.shake = this.shake - 1;
               this.hand = 1;
               this.crack = 2;
               this.f = this.f - this.point_distance(0,this.f,0,-600) / 30;
               this.hand_x = Math.round(this.f / 4) - 140;
               this.hand_y = 320 - Math.round(this.f / 4);
               this.crack_x = Math.round(-450 / 6 + 320);
               this.crack_y = 100 + Math.round(450 / 16);
               if(this.shake > 0)
               {
                  this.hand_x = this.hand_x + (this.random(3) - this.random(3));
                  this.hand_y = this.hand_y + (this.random(3) - this.random(3));
                  this.crack_x = this.crack_x + (this.random(2) - this.random(2));
                  this.crack_y = this.crack_y + (this.random(2) - this.random(2));
               }
               if(this.f < -500)
               {
                  if(FP.world.classCount(obj_ending_transition) == 0)
                  {
                     FP.world.add(new obj_ending_transition());
                  }
               }
            }
         }
         this.spr_crack.play("main",true,this.crack);
         this.spr_hand.play("main",true,this.hand);
      }
      
      override public function render() : void
      {
         Draw.rect(0,0,640,480,0,1,false);
         graphic = this.spr_crack;
         x = Math.round(this.crack_x);
         y = Math.round(this.crack_y);
         super.render();
         graphic = this.spr_hand;
         x = Math.round(this.hand_x);
         y = Math.round(this.hand_y);
         super.render();
      }
   }
}
