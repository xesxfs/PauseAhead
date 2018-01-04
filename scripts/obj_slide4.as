package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   
   public class obj_slide4 extends Entity
   {
       
      
      private const S4:Class = obj_slide4_S4;
      
      public var alpha1:Number = 0;
      
      public var alpha2:Number = -0.5;
      
      public var alpha3:Number = 0;
      
      public var alpha4:Number = 0;
      
      public var alpha5:Number = 0;
      
      public var alpha6:Number = 0;
      
      public var timer:Number = 0;
      
      public var down:Boolean = false;
      
      public var z:Image;
      
      public var txt1:Text;
      
      public var txt2:Text;
      
      public var txt3:Text;
      
      public var txt4:Text;
      
      public var txt5:Text;
      
      public var swi:Boolean = false;
      
      public function obj_slide4()
      {
         super();
         this.z = new Image(this.S4);
         layer = -20;
         type = "obj_slide4";
         x = 0;
         y = 0;
         this.txt1 = new Text("One gets away,");
         this.txt1.size = 20;
         this.txt1.color = 0;
         this.txt1.align = "left";
         this.txt2 = new Text("A thousand stay trapped within.");
         this.txt2.size = 20;
         this.txt2.color = 0;
         this.txt2.align = "left";
         this.txt3 = new Text("It makes no difference to me...");
         this.txt3.size = 20;
         this.txt3.color = 0;
         this.txt3.align = "left";
         this.txt4 = new Text("All of life is a game,");
         this.txt4.size = 20;
         this.txt4.color = 0;
         this.txt4.align = "left";
         this.txt5 = new Text("And all of us are merely players.");
         this.txt5.size = 20;
         this.txt5.color = 0;
         this.txt5.align = "left";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            if(this.alpha2 >= 0 && this.swi == false)
            {
               global.ending_song = 2;
               global.masterplay = true;
               this.swi = true;
            }
            this.alpha1 = this.alpha1 + 0.01;
            if(this.down == false)
            {
               if(this.alpha1 >= 1)
               {
                  this.alpha2 = this.alpha2 + 0.01;
               }
               if(this.alpha2 >= 1)
               {
                  this.alpha3 = this.alpha3 + 0.008;
               }
               if(this.alpha3 >= 1)
               {
                  this.alpha4 = this.alpha4 + 0.005;
               }
               if(this.alpha4 >= 1.2)
               {
                  this.alpha5 = this.alpha5 + 0.008;
               }
               if(this.alpha5 >= 1)
               {
                  this.alpha4 = 1;
                  this.alpha6 = this.alpha6 + 0.01;
               }
               if(this.alpha6 >= 1)
               {
                  this.timer = this.timer + 1;
               }
               if(this.timer > 220)
               {
                  this.down = true;
               }
            }
            if(this.down == true)
            {
               this.alpha2 = this.alpha2 - 0.01;
               this.alpha3 = this.alpha3 - 0.01;
               this.alpha4 = this.alpha4 - 0.01;
               this.alpha5 = this.alpha5 - 0.01;
               this.alpha6 = this.alpha6 - 0.01;
               if(this.alpha2 < 0)
               {
                  if(FP.world.classCount(obj_credits) == 0)
                  {
                     FP.world.add(new obj_credits());
                  }
               }
            }
            if(this.alpha1 > 1)
            {
               this.alpha1 = 1;
            }
            if(this.alpha2 > 1)
            {
               this.alpha2 = 1;
            }
            if(this.alpha3 > 1)
            {
               this.alpha3 = 1;
            }
            if(this.alpha5 > 1)
            {
               this.alpha5 = 1;
            }
            if(this.alpha6 > 1)
            {
               this.alpha6 = 1;
            }
         }
      }
      
      override public function render() : void
      {
         x = 0;
         y = 0;
         this.z.alpha = this.alpha1;
         graphic = this.z;
         super.render();
         x = 40;
         y = 110;
         this.txt1.alpha = this.alpha2;
         graphic = this.txt1;
         super.render();
         x = 40;
         y = 145;
         this.txt2.alpha = this.alpha3;
         graphic = this.txt2;
         super.render();
         x = 40;
         y = 180;
         this.txt3.alpha = this.alpha4;
         graphic = this.txt3;
         super.render();
         x = 140;
         y = 225;
         this.txt4.alpha = this.alpha5;
         graphic = this.txt4;
         super.render();
         x = 140;
         y = 255;
         this.txt5.alpha = this.alpha6;
         graphic = this.txt5;
         super.render();
      }
   }
}
