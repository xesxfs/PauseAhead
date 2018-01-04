package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Image;
   
   public class obj_thwomp extends Entity
   {
       
      
      private const s_sbs4:Class = obj_thwomp_s_sbs4;
      
      public var sound_minithwomp:Sfx;
      
      private const THWOMP:Class = obj_thwomp_THWOMP;
      
      public var down:Boolean = false;
      
      public var wait:Number = 0;
      
      public var up:Boolean = false;
      
      public var i:int = 0;
      
      public var b:obj_recordme;
      
      public var ugh:Boolean = false;
      
      public var test:Boolean = false;
      
      public function obj_thwomp(nx:int, ny:int)
      {
         this.sound_minithwomp = new Sfx(this.s_sbs4);
         super();
         x = nx;
         y = ny;
         graphic = new Image(this.THWOMP);
         setHitbox(32,32,0,0);
         layer = -1;
         type = "obj_thwomp";
         this.i = 20;
      }
      
      override public function update() : void
      {
         var z:int = 0;
         var count:int = 0;
         super.update();
         if(this.test == false)
         {
            this.i = 0;
            while(!collide("solid",x,y + this.i * 32))
            {
               this.i = this.i + 1;
            }
            this.i = this.i + 1;
            this.test = true;
         }
         if(this.ugh == false)
         {
            if(global.level != 27)
            {
               this.b = new obj_recordme();
               FP.world.add(this.b);
               this.b.ox = x;
               this.b.oy = y;
               this.b.object = this;
               this.b.big = false;
               this.ugh = true;
            }
         }
         if(global.pause == false && global.master.player_freeze == false && global.delay <= 0 && global.esc_pause == false)
         {
            z = 0;
            if(this.up == false && this.down == false && this.wait <= 0)
            {
               count = 0;
               while(count < this.i)
               {
                  count++;
                  if(collide("player",x - 5,y + z))
                  {
                     this.down = true;
                  }
                  if(collide("player",x + 5,y + z))
                  {
                     this.down = true;
                  }
                  z = z + 32;
               }
            }
            if(this.down == true && this.wait <= 0)
            {
               y = y + 5;
               if(collide("solid",x,y))
               {
                  this.down = false;
                  this.wait = 20;
                  this.up = true;
                  if(global.mute == false && global.replay.play == false)
                  {
                     this.sound_minithwomp.play(global.volume * 1);
                  }
               }
            }
            this.wait = this.wait - 1;
            if(this.up == true && this.wait <= 0)
            {
               y = y - 2;
               if(collide("solid",x,y))
               {
                  this.up = false;
                  this.wait = 20;
                  this.down = false;
               }
            }
            if(collide("player",x,y))
            {
               global.player.dead = true;
            }
         }
         if(collide("solid",x,y + 1))
         {
            while(collide("solid",x,y + 1))
            {
               y = y - 1;
            }
         }
         if(collide("solid",x,y - 1))
         {
            while(collide("solid",x,y - 1))
            {
               y = y + 1;
            }
         }
      }
      
      override public function render() : void
      {
         if(global.replay.play == false)
         {
            if(x > FP.camera.x - 40 && x < FP.camera.x + 640 + 40 && y > FP.camera.y - 40 && y < FP.camera.y + 480 + 40)
            {
               super.render();
            }
         }
      }
   }
}
