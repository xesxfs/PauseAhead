package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   
   public class obj_fireball extends Entity
   {
       
      
      private const SPIKES:Class = obj_fireball_SPIKES;
      
      public var spr_fireball:Spritemap;
      
      private const s_sbs3:Class = obj_fireball_s_sbs3;
      
      public var sound_thwomp:Sfx;
      
      public var i:Number = 0;
      
      public var a:Boolean = false;
      
      public var animation_index:Number = 0;
      
      public var animation_max:Number = 4;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.3;
      
      public var dir:Number = 0;
      
      public var vsp:Number = 0;
      
      public var hsp:Number = 0;
      
      public var timer:int = 0;
      
      public var part:int = 0;
      
      public var myTarget:Entity;
      
      public var fall:Boolean = false;
      
      public function obj_fireball(nx:int, ny:int, target:Entity)
      {
         this.spr_fireball = new Spritemap(this.SPIKES,22,30);
         this.sound_thwomp = new Sfx(this.s_sbs3);
         super();
         this.myTarget = target;
         x = nx;
         y = ny;
         this.spr_fireball.add("main",[0,1,2,3,4]);
         this.spr_fireball.scale = 1;
         graphic = this.spr_fireball;
         this.spr_fireball.play("main",true,this.i);
         this.spr_fireball.centerOO();
         this.spr_fireball.originY = this.spr_fireball.originY - 5;
         layer = 10;
         type = "obj_fireball";
         setHitbox(32,32,0,0);
         centerOrigin();
         originY = originY - 5;
         this.dir = 90;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(this.part == 0)
            {
               this.spr_fireball.scale = 1.2;
               this.spr_fireball.color = 12566463;
               layer = 1;
               y = y - 8;
               this.dir = 90;
               if(y < -40)
               {
                  this.part = 1;
               }
            }
            if(this.part == 1)
            {
               if(this.fall == true)
               {
                  this.timer++;
               }
               if(this.timer > 5)
               {
                  x = this.myTarget.x + 36;
                  this.part = 2;
                  if(x < 10)
                  {
                     x = 10;
                  }
                  if(x > 640 - 10)
                  {
                     x = 640 - 10;
                  }
               }
            }
            if(this.part == 2)
            {
               if(this.fall == true)
               {
                  this.spr_fireball.scale = 2;
                  this.spr_fireball.color = 16777215;
                  layer = -1;
                  this.dir = 270;
                  y = y + 16;
                  if(collide("player",x,y))
                  {
                     global.player.dead = true;
                  }
                  if(collide("solid",x,y))
                  {
                     if(global.mute == false)
                     {
                        this.sound_thwomp.play(global.volume * 0.8);
                     }
                     FP.world.add(new obj_eruption(x));
                     FP.world.add(new obj_shake());
                     FP.world.remove(this);
                  }
               }
            }
            this.spr_fireball.angle = this.dir - 90;
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
         }
         this.spr_fireball.play("main",true,this.animation_index);
      }
   }
}
