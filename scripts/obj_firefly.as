package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_firefly extends Entity
   {
       
      
      private const FIREFLY:Class = obj_firefly_FIREFLY;
      
      public var base_x:int;
      
      public var base_y:int;
      
      public var hsp:Number = 0;
      
      public var vsp:Number = 0;
      
      public var dest_x:int;
      
      public var dest_y:int;
      
      public var die:Boolean = false;
      
      public var draw_me:Boolean = true;
      
      public var z:Image;
      
      public var x_index:Array;
      
      public var frame:int = 0;
      
      public var i:int = 0;
      
      public var y_index:Array;
      
      public function obj_firefly(nx:int, ny:int)
      {
         super();
         this.x_index = new Array();
         this.y_index = new Array();
         this.base_x = nx;
         this.base_y = ny;
         x = nx + this.random(10) - this.random(10);
         y = ny + this.random(10) - this.random(10);
         this.hsp = this.random(6) - this.random(6);
         this.vsp = this.random(6) - this.random(6);
         this.z = new Image(this.FIREFLY);
         this.z.alpha = 0.8 + this.random(0.2);
         this.z.scale = 0.8 + this.random(0.2);
         graphic = this.z;
         setHitbox(32,32,0,0);
         layer = -56;
         type = "obj_firefly";
      }
      
      public function point_distance(x1:int, y1:int, x2:int, y2:int) : Number
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
         if(global.pause == false && global.esc_pause == false)
         {
            this.dest_x = this.base_x + this.random(10) - this.random(10);
            this.dest_y = this.base_y + this.random(10) - this.random(10);
            if(FP.world.typeCount("player") == 1)
            {
               if(this.point_distance(x,y,global.player.x,global.player.y) < 100)
               {
                  this.die = true;
               }
            }
            if(this.die == true)
            {
               this.dest_y = -100;
            }
            if(x > this.dest_x)
            {
               this.hsp = this.hsp - 0.1;
            }
            if(x < this.dest_x)
            {
               this.hsp = this.hsp + 0.1;
            }
            if(y > this.dest_y)
            {
               this.vsp = this.vsp - 0.1;
            }
            if(y < this.dest_y)
            {
               this.vsp = this.vsp + 0.1;
            }
            if(this.die == false)
            {
               if(this.hsp > 3)
               {
                  this.hsp = 3;
               }
               if(this.hsp < -3)
               {
                  this.hsp = -3;
               }
               if(this.vsp > 3)
               {
                  this.vsp = 3;
               }
               if(this.vsp < -3)
               {
                  this.vsp = -3;
               }
            }
            x = x + this.hsp;
            y = y + this.vsp;
            if(y < -20 || global.replay.play == true)
            {
               this.draw_me = false;
            }
            this.z.alpha = 0.6 + this.random(0.4);
            this.z.scale = 0.6 + this.random(0.4);
            graphic = this.z;
            if(global.replay.play == false && global.master.player_freeze == false && this.draw_me == true)
            {
               this.x_index.push(x);
               this.y_index.push(y);
               this.frame = this.frame + 1;
            }
            if(global.replay.play == true && this.i < this.frame)
            {
               x = this.x_index[this.i];
               y = this.y_index[this.i];
               this.i++;
            }
         }
      }
      
      override public function render() : void
      {
         if(this.draw_me == true)
         {
            super.render();
         }
         else if(global.replay.play == true && this.i < this.frame)
         {
            super.render();
         }
      }
   }
}
