package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_bigthwomp extends Entity
   {
       
      
      private const s_sbs3:Class = obj_bigthwomp_s_sbs3;
      
      public var sound_thwomp:Sfx;
      
      private const THWOMP:Class = obj_bigthwomp_THWOMP;
      
      private const THWOMP2:Class = obj_bigthwomp_THWOMP2;
      
      public var down:Boolean = false;
      
      public var wait:Number = 0;
      
      public var up:Boolean = false;
      
      public var i:int = 0;
      
      public var ugh:Boolean = false;
      
      public var b:obj_recordme2;
      
      public var z1:Image;
      
      public var z2:Image;
      
      public var test:Boolean = false;
      
      public function obj_bigthwomp(nx:int, ny:int)
      {
         var b:obj_recordme2 = null;
         this.sound_thwomp = new Sfx(this.s_sbs3);
         super();
         x = nx;
         y = ny;
         this.z1 = new Image(this.THWOMP);
         this.z2 = new Image(this.THWOMP2);
         graphic = this.z1;
         setHitbox(64,64,0,0);
         layer = -1;
         type = "obj_bigthwomp";
         this.i = 20;
         if(global.level != 27)
         {
            b = new obj_recordme2();
            FP.world.add(b);
            b.ox = x;
            b.oy = y;
            b.object = this;
            b.big = true;
         }
         if(global.level == 12)
         {
            this.wait = 10;
         }
      }
      
      override public function update() : void
      {
         var z:int = 0;
         var count:int = 0;
         var nn:Boolean = false;
         var myList:Array = null;
         var bb:obj_transition = null;
         var count2:int = 0;
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
               this.b = new obj_recordme2();
               FP.world.add(this.b);
               this.b.ox = x;
               this.b.oy = y;
               this.b.object = this;
               this.b.big = true;
               this.ugh = true;
            }
         }
         if(global.pause == false && global.master.player_freeze == false && global.delay <= 0 && global.esc_pause == false)
         {
            z = 0;
            if(FP.world.typeCount("obj_transition") == 0)
            {
               if(this.up == false && this.down == false && this.wait <= 0)
               {
                  count = 0;
                  while(count < this.i)
                  {
                     count++;
                     if(global.level != 12)
                     {
                        if(collide("player",x - 32,y + z))
                        {
                           this.down = true;
                        }
                        if(collide("player",x + 32,y + z))
                        {
                           this.down = true;
                        }
                     }
                     else
                     {
                        if(collide("player",x - 20,y + z))
                        {
                           this.down = true;
                        }
                        if(collide("player",x + 20,y + z))
                        {
                           this.down = true;
                        }
                     }
                     z = z + 32;
                  }
               }
            }
            else
            {
               nn = false;
               myList = [];
               FP.world.getClass(obj_transition,myList);
               for each(bb in myList)
               {
                  if(bb.i > 45)
                  {
                     nn = true;
                  }
               }
               if(nn = true)
               {
                  if(this.up == false && this.down == false && this.wait <= 0)
                  {
                     count2 = 0;
                     while(count2 < this.i)
                     {
                        count2++;
                        if(collide("player",x - 5,y + z))
                        {
                           this.down = true;
                        }
                        if(collide("player",x + 5,y + z))
                        {
                           this.down = true;
                        }
                        z = z + 64;
                     }
                  }
               }
            }
            if(this.down == true && this.wait <= 0)
            {
               y = y + 8;
               if(collide("solid",x,y))
               {
                  this.down = false;
                  this.wait = 100;
                  this.up = true;
                  if(global.replay.play == false)
                  {
                     if(global.level != 15)
                     {
                        FP.world.add(new obj_shake());
                     }
                  }
                  if(global.mute == false && global.replay.play == false && global.level != 15)
                  {
                     this.sound_thwomp.play(global.volume * 1);
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
         if(global.level != 27)
         {
            this.b.down = false;
            if(this.down == true || this.wait > 0)
            {
               this.b.down = true;
            }
         }
      }
      
      override public function render() : void
      {
         if(global.replay.play == false)
         {
            if(this.down == true || this.wait > 0)
            {
               graphic = this.z2;
            }
            else
            {
               graphic = this.z1;
            }
            if(x > FP.camera.x - 70 && x < FP.camera.x + 640 + 70 && y > FP.camera.y - 70 && y < FP.camera.y + 480 + 70)
            {
               super.render();
            }
         }
      }
   }
}
