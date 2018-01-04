package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_speedruntimer extends Entity
   {
       
      
      public var counter:Number = 0;
      
      public var time:String = "";
      
      public var z:Text;
      
      public var b:Image;
      
      private const OVER:Class = obj_speedruntimer_OVER;
      
      public var done:Boolean = false;
      
      public var draw:Boolean = true;
      
      public var timer:int = 0;
      
      public var alpha:Number = 1;
      
      public function obj_speedruntimer()
      {
         super();
         this.z = new Text("");
         this.b = new Image(this.OVER);
         layer = -900;
      }
      
      override public function update() : void
      {
         if(global.speedrun_time >= 60)
         {
            this.counter = 1;
            global.speedrun_time = global.speedrun_time - 60;
         }
         if(this.counter >= 1)
         {
            global.speed_second = global.speed_second + 1;
            if(global.speed_second == 60)
            {
               global.speed_second = 0;
               global.speed_minute = global.speed_minute + 1;
            }
            this.counter = 0;
         }
         if(this.done == true)
         {
            this.timer = this.timer + 1;
            if(this.timer > 30)
            {
               this.timer = 0;
               this.draw = !this.draw;
            }
            if(FP.world.classCount(obj_slide4) != 0)
            {
               this.alpha = this.alpha - 0.01;
               if(this.alpha < 0)
               {
                  FP.world.remove(this);
               }
            }
         }
      }
      
      override public function render() : void
      {
         graphic = this.b;
         this.b.alpha = this.alpha;
         x = FP.camera.x + 320 - this.b.width / 2;
         y = FP.camera.y + 40 - this.b.height / 2 - 3;
         super.render();
         this.time = "";
         if(global.speed_minute < 10)
         {
            this.time = this.time + "0";
         }
         this.time = this.time + String(global.speed_minute);
         this.time = this.time + ":";
         if(global.speed_second < 10)
         {
            this.time = this.time + "0";
         }
         this.time = this.time + String(global.speed_second);
         this.z.text = this.time;
         this.z.size = 50;
         this.z.align = "center";
         this.z.text = String(this.time);
         this.z.alpha = this.alpha;
         if(this.draw == true)
         {
            graphic = this.z;
            x = FP.camera.x + 320 - Text(graphic).width / 2;
            y = FP.camera.y + 40 - Text(graphic).height / 2;
            super.render();
         }
      }
   }
}
