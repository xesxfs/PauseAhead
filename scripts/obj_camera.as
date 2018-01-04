package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   
   public class obj_camera extends Entity
   {
       
      
      public var ax:Number = 0;
      
      public var ay:Number = 0;
      
      public function obj_camera()
      {
         super();
         this.ax = global.player.x + 36;
         this.ay = global.player.y;
         x = global.player.x + 35;
         y = global.player.y;
         layer = -1;
         type = "obj_camera";
      }
      
      public function point_distance(x1:int, y1:int, x2:int, y2:int) : Number
      {
         return Math.sqrt(Math.pow(x1 - x2,2) + Math.pow(y1 - y2,2));
      }
      
      override public function update() : void
      {
         if(global.esc_pause == false)
         {
            if(world.typeCount("player") != 0)
            {
               this.ax = global.player.x + 36;
               this.ay = global.player.y;
               if(global.level == 27 && (global.hellkey_1 == false || global.hellkey_2 == false))
               {
                  this.ay = global.player.y + 64 + 32;
               }
               if(global.level == 27 && global.hell_intro != 2)
               {
                  this.ay = global.player.y - 64 - 16 - 32;
               }
            }
            if(x < this.ax)
            {
               x = x + this.point_distance(x,0,this.ax,0) / 6;
            }
            if(x > this.ax)
            {
               x = x - this.point_distance(x,0,this.ax,0) / 6;
            }
            if(y < this.ay)
            {
               y = y + this.point_distance(y,0,this.ay,0) / 6;
            }
            if(y > this.ay)
            {
               y = y - this.point_distance(y,0,this.ay,0) / 6;
            }
            FP.camera.x = x - 320;
            FP.camera.y = y - 240;
            if(FP.camera.x < 0)
            {
               FP.camera.x = 0;
            }
            if(FP.camera.y < 0)
            {
               FP.camera.y = 0;
            }
            if(FP.camera.x > global.room_width - 640)
            {
               FP.camera.x = global.room_width - 640;
            }
            if(FP.camera.y > global.room_height - 480)
            {
               FP.camera.y = global.room_height - 480;
            }
            if(world.typeCount("obj_shake") != 0)
            {
               FP.camera.x = FP.camera.x + (Math.random() * 5 - Math.random() * 5);
               FP.camera.y = FP.camera.y + (Math.random() * 5 - Math.random() * 5);
            }
            if(world.typeCount("obj_shake2") != 0 && global.pause == false && global.esc_pause == false)
            {
               FP.camera.x = FP.camera.x + (Math.random() * global.shaketimer / 10 - Math.random() * global.shaketimer / 10);
               FP.camera.y = FP.camera.y + (Math.random() * global.shaketimer / 10 - Math.random() * global.shaketimer / 10);
            }
         }
      }
   }
}
