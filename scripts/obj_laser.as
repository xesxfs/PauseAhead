package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_laser extends Entity
   {
       
      
      public var dist:int = 400;
      
      public var angle:Number = 0;
      
      public var attack:obj_lasereruption;
      
      public var attacking:Boolean = false;
      
      public var alpha:Number = -0.6;
      
      public var speed:Number = 0;
      
      public var up:Boolean = true;
      
      public var die:Boolean = false;
      
      public var timer:int = 100;
      
      public var dist1:Number = 0;
      
      public var dist2:Number = 0;
      
      public var dist3:Number = 0;
      
      public var dist4:Number = 0;
      
      public var dist5:Number = 0;
      
      public var dist6:Number = 0;
      
      public function obj_laser(na:int)
      {
         super();
         this.angle = na;
         x = 320 + 20;
         y = 240 + 20;
         layer = 10;
         type = "obj_laser";
      }
      
      override public function update() : void
      {
         var tdist:Number = NaN;
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            this.alpha = this.alpha + 0.01;
            if(this.alpha > 1)
            {
               this.alpha = 1;
            }
            if(this.alpha >= 1)
            {
               if(this.up == true)
               {
                  this.speed = this.speed + 0.005;
                  if(this.speed > 1)
                  {
                     this.speed = 1;
                     this.timer = this.timer - 1;
                  }
                  if(this.timer <= 0)
                  {
                     this.timer = 100;
                     this.up = false;
                  }
               }
               if(this.up == false)
               {
                  this.speed = this.speed - 0.005;
                  if(this.speed <= -1)
                  {
                     this.speed = -1;
                     this.timer = this.timer - 1;
                  }
                  if(this.timer <= 0)
                  {
                     this.up = true;
                     this.die = true;
                     this.timer = 1000;
                  }
               }
               if(this.speed > 0 && this.die == true)
               {
                  if(this.attacking == true)
                  {
                     this.attack.die = true;
                  }
                  global.boss.die = true;
                  FP.world.remove(this);
               }
            }
            this.angle = this.angle + this.speed;
            this.dist1 = Math.random() * this.dist;
            this.dist2 = this.dist1 + Math.random() * 80;
            this.dist3 = Math.random() * this.dist;
            this.dist4 = this.dist3 + Math.random() * 80;
            this.dist5 = Math.random() * this.dist;
            this.dist6 = this.dist3 + Math.random() * 80;
            if(y + Math.sin(this.angle * FP.RAD) * this.dist > 448)
            {
               tdist = this.dist;
               while(y + Math.sin(this.angle * FP.RAD) * tdist > 448)
               {
                  tdist = tdist - 5;
               }
               tdist = tdist + 5;
               if(this.alpha >= 1)
               {
                  if(this.attacking == false)
                  {
                     this.attack = new obj_lasereruption(x + Math.cos(this.angle * FP.RAD) * tdist);
                     FP.world.add(this.attack);
                     this.attacking = true;
                  }
                  else
                  {
                     this.attack.x = x + Math.cos(this.angle * FP.RAD) * tdist;
                  }
               }
               if(this.dist1 > tdist)
               {
                  this.dist1 = tdist;
               }
               if(this.dist2 > tdist)
               {
                  this.dist2 = tdist;
               }
               if(this.dist3 > tdist)
               {
                  this.dist3 = tdist;
               }
               if(this.dist4 > tdist)
               {
                  this.dist4 = tdist;
               }
               if(this.dist5 > tdist)
               {
                  this.dist5 = tdist;
               }
               if(this.dist6 > tdist)
               {
                  this.dist6 = tdist;
               }
            }
            else if(this.attacking == true)
            {
               this.attack.die = true;
               this.attacking = false;
            }
         }
      }
      
      override public function render() : void
      {
         var base_angle:Number = this.angle;
         if(this.attacking == true)
         {
            this.angle = FP.angle(x,y,this.attack.x - this.attack.thin * 22,this.attack.y + 26 * 2);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist1,y + Math.sin(this.angle * FP.RAD) * this.dist1,x + Math.cos(this.angle * FP.RAD) * this.dist2,y + Math.sin(this.angle * FP.RAD) * this.dist2,12087922,this.alpha,3);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist3,y + Math.sin(this.angle * FP.RAD) * this.dist3,x + Math.cos(this.angle * FP.RAD) * this.dist4,y + Math.sin(this.angle * FP.RAD) * this.dist4,13500416,this.alpha,4);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist5,y + Math.sin(this.angle * FP.RAD) * this.dist5,x + Math.cos(this.angle * FP.RAD) * this.dist6,y + Math.sin(this.angle * FP.RAD) * this.dist6,8405056,this.alpha,4);
            this.angle = FP.angle(x,y,this.attack.x + this.attack.thin * 22,this.attack.y + 26 * 2);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist1,y + Math.sin(this.angle * FP.RAD) * this.dist1,x + Math.cos(this.angle * FP.RAD) * this.dist2,y + Math.sin(this.angle * FP.RAD) * this.dist2,12087922,this.alpha,3);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist3,y + Math.sin(this.angle * FP.RAD) * this.dist3,x + Math.cos(this.angle * FP.RAD) * this.dist4,y + Math.sin(this.angle * FP.RAD) * this.dist4,13500416,this.alpha,4);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist5,y + Math.sin(this.angle * FP.RAD) * this.dist5,x + Math.cos(this.angle * FP.RAD) * this.dist6,y + Math.sin(this.angle * FP.RAD) * this.dist6,8405056,this.alpha,4);
            this.angle = base_angle;
         }
         else
         {
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist1,y + Math.sin(this.angle * FP.RAD) * this.dist1,x + Math.cos(this.angle * FP.RAD) * this.dist2,y + Math.sin(this.angle * FP.RAD) * this.dist2,12087922,this.alpha,3);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist3,y + Math.sin(this.angle * FP.RAD) * this.dist3,x + Math.cos(this.angle * FP.RAD) * this.dist4,y + Math.sin(this.angle * FP.RAD) * this.dist4,13500416,this.alpha,4);
            Draw.linePlus(x + Math.cos(this.angle * FP.RAD) * this.dist5,y + Math.sin(this.angle * FP.RAD) * this.dist5,x + Math.cos(this.angle * FP.RAD) * this.dist6,y + Math.sin(this.angle * FP.RAD) * this.dist6,8405056,this.alpha,4);
         }
      }
   }
}
