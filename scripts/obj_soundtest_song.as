package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_soundtest_song extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public var myNum:int;
      
      public var basey:Number = 0;
      
      public function obj_soundtest_song(num:int)
      {
         super();
         type = "menupic";
         this.myNum = num;
         if(this.myNum == 1)
         {
            this.z = new Text("1. Hiatus ");
         }
         if(this.myNum == 2)
         {
            this.z = new Text("2. Time and Space");
         }
         if(this.myNum == 3)
         {
            this.z = new Text("3. Boss of Nova");
         }
         if(this.myNum == 4)
         {
            this.z = new Text("4. Headless Beast");
         }
         if(this.myNum == 5)
         {
            this.z = new Text("5. Passage");
         }
         if(this.myNum == 6)
         {
            this.z = new Text("6. The Dying of the Light");
         }
         if(this.myNum == 7)
         {
            this.z = new Text("7. Nihil Descent I");
         }
         if(this.myNum == 8)
         {
            this.z = new Text("8. Nihil Descent II");
         }
         if(this.myNum == 9)
         {
            this.z = new Text("9. Resignation");
         }
         x = FP.camera.x + 140 + 26;
         y = this.myNum * 36 - 32;
         this.z.size = 23;
         this.z.align = "left";
         graphic = this.z;
         layer = -5;
         this.basey = y;
      }
      
      override public function update() : void
      {
         super.update();
         if(FP.world.mouseY > y && FP.world.mouseY < y + this.z.height && FP.world.mouseX > x && FP.world.mouseX < x + this.z.width)
         {
            this.z.color = 16776960;
            this.scaleplus = 0.2;
            if(Input.mousePressed)
            {
               if(global.soundtest.track != this.myNum)
               {
                  global.soundtest.wait = 3;
                  global.testplay = true;
               }
               global.soundtest.track = this.myNum;
            }
         }
         else
         {
            this.z.color = 13421772;
            if(global.soundtest.track == this.myNum)
            {
               this.z.color = 16744512;
            }
            this.scaleplus = 0;
         }
         this.z.alpha = 1;
         y = this.basey - this.scaleplus;
      }
   }
}
