package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.Sfx;
   
   public class obj_flower extends Entity
   {
       
      
      private const f1:Class = obj_flower_f1;
      
      public var spr_flower1:Spritemap;
      
      private const f2:Class = obj_flower_f2;
      
      public var spr_flower2:Spritemap;
      
      private const f3:Class = obj_flower_f3;
      
      public var spr_flower3:Spritemap;
      
      private const f4:Class = obj_flower_f4;
      
      public var spr_flower4:Spritemap;
      
      private const s_sbs3:Class = obj_flower_s_sbs3;
      
      public var sound_brush:Sfx;
      
      public var animation_index:Number = 0;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.3;
      
      public var animation_max:Number = 4;
      
      public var play:Boolean = false;
      
      public var flip:Boolean = false;
      
      public var myType:int = 0;
      
      public var replay_index:Array;
      
      public var frame:int = 0;
      
      public var i:int = 0;
      
      public var flip_index:Array;
      
      public function obj_flower(nx:int, ny:int, typez:int)
      {
         this.spr_flower1 = new Spritemap(this.f1,32,32);
         this.spr_flower2 = new Spritemap(this.f2,32,32);
         this.spr_flower3 = new Spritemap(this.f3,32,32);
         this.spr_flower4 = new Spritemap(this.f4,32,32);
         this.sound_brush = new Sfx(this.s_sbs3);
         super();
         this.replay_index = new Array();
         this.flip_index = new Array();
         x = nx;
         y = ny;
         this.myType = typez;
         this.spr_flower1.add("main",[0,1,2,3,4]);
         this.spr_flower2.add("main",[0,1,2,3,4]);
         this.spr_flower3.add("main",[0,1,2,3,4]);
         this.spr_flower4.add("main",[0,1,2,3,4]);
         if(this.myType == 0)
         {
            graphic = this.spr_flower1;
         }
         if(this.myType == 1)
         {
            graphic = this.spr_flower2;
         }
         if(this.myType == 2)
         {
            graphic = this.spr_flower3;
         }
         if(this.myType == 3)
         {
            graphic = this.spr_flower4;
         }
         setHitbox(5,20,-16 + 3,0);
         layer = -54;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(collide("player",x,y) && this.play == false && Math.abs(global.player.hsp) > 0.1)
            {
               global.flowerRub = global.flowerRub + 1;
               if(global.flowerRub > 500 && global.flowerRub < 504)
               {
                  global.achievementQueue.push(6);
               }
               if(global.player.hsp > 0)
               {
                  this.play = true;
                  this.flip = false;
                  this.spr_flower1.flipped = this.flip;
                  this.spr_flower2.flipped = this.flip;
                  this.spr_flower3.flipped = this.flip;
                  this.spr_flower4.flipped = this.flip;
               }
               if(global.player.hsp < 0)
               {
                  this.play = true;
                  this.flip = true;
                  this.spr_flower1.flipped = this.flip;
                  this.spr_flower2.flipped = this.flip;
                  this.spr_flower3.flipped = this.flip;
                  this.spr_flower4.flipped = this.flip;
               }
               if(global.mute == false)
               {
                  this.sound_brush.play(global.volume * 1);
               }
            }
            if(this.play == false)
            {
               this.animation_index = 0;
               this.animation_float = 0;
               this.animation_speed = 0.25;
               this.animation_max = 5;
            }
            else
            {
               this.animation_float = this.animation_float + this.animation_speed;
               if(this.animation_float >= 1)
               {
                  this.animation_index = this.animation_index + 1;
                  this.animation_float = 0;
               }
               if(this.animation_index > this.animation_max)
               {
                  this.animation_index = 0;
                  this.play = false;
               }
            }
            if(global.replay.play == true && this.i < this.frame)
            {
               this.animation_index = this.replay_index[this.i];
               this.flip = this.flip_index[this.i];
               this.spr_flower1.flipped = this.flip;
               this.spr_flower2.flipped = this.flip;
               this.spr_flower3.flipped = this.flip;
               this.spr_flower4.flipped = this.flip;
               this.i++;
            }
            if(this.myType == 0)
            {
               this.spr_flower1.play("main",true,this.animation_index);
            }
            if(this.myType == 1)
            {
               this.spr_flower2.play("main",true,this.animation_index);
            }
            if(this.myType == 2)
            {
               this.spr_flower3.play("main",true,this.animation_index);
            }
            if(this.myType == 3)
            {
               this.spr_flower4.play("main",true,this.animation_index);
            }
            if(global.replay.play == false && global.master.player_freeze == false)
            {
               this.replay_index.push(this.animation_index);
               this.flip_index.push(this.flip);
               this.frame = this.frame + 1;
            }
         }
      }
   }
}
