package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_background extends Entity
   {
       
      
      public var myAlpha:Number = 1;
      
      public var up:Boolean = true;
      
      private const BG1:Class = obj_background_BG1;
      
      private const BG2:Class = obj_background_BG2;
      
      private const BG3:Class = obj_background_BG3;
      
      private const BG4:Class = obj_background_BG4;
      
      private const BG5:Class = obj_background_BG5;
      
      private const BG6:Class = obj_background_BG6;
      
      private const BG7:Class = obj_background_BG7;
      
      private const BG8:Class = obj_background_BG8;
      
      private const BG9:Class = obj_background_BG9;
      
      private const BG10:Class = obj_background_BG10;
      
      private const BG11:Class = obj_background_BG11;
      
      private const BG12:Class = obj_background_BG12;
      
      private const BG13:Class = obj_background_BG13;
      
      private const BG14:Class = obj_background_BG14;
      
      private const BG15:Class = obj_background_BG15;
      
      private const BG16:Class = obj_background_BG16;
      
      private const BG17:Class = obj_background_BG17;
      
      private const BG18:Class = obj_background_BG18;
      
      private const BG19:Class = obj_background_BG19;
      
      private const BG20:Class = obj_background_BG20;
      
      private const BG22:Class = obj_background_BG22;
      
      private const BG23:Class = obj_background_BG23;
      
      private const BG24:Class = obj_background_BG24;
      
      private const BG27:Class = obj_background_BG27;
      
      public var z:Image;
      
      public var wait:int = 0;
      
      public function obj_background()
      {
         super();
         if(global.level == 1 || global.level == 21)
         {
            this.z = new Image(this.BG1);
         }
         if(global.level == 24 || global.level == 25 || global.level == 26 || global.level == 28)
         {
            this.z = new Image(this.BG24);
         }
         if(global.level == 2)
         {
            this.z = new Image(this.BG2);
         }
         if(global.level == 3)
         {
            this.z = new Image(this.BG3);
         }
         if(global.level == 4)
         {
            this.z = new Image(this.BG4);
         }
         if(global.level == 5)
         {
            this.z = new Image(this.BG5);
         }
         if(global.level == 6)
         {
            this.z = new Image(this.BG6);
         }
         if(global.level == 7)
         {
            this.z = new Image(this.BG7);
         }
         if(global.level == 8)
         {
            this.z = new Image(this.BG8);
         }
         if(global.level == 9)
         {
            this.z = new Image(this.BG9);
         }
         if(global.level == 10)
         {
            this.z = new Image(this.BG10);
         }
         if(global.level == 11)
         {
            this.z = new Image(this.BG11);
         }
         if(global.level == 12)
         {
            this.z = new Image(this.BG12);
         }
         if(global.level == 13)
         {
            this.z = new Image(this.BG13);
         }
         if(global.level == 14)
         {
            this.z = new Image(this.BG14);
         }
         if(global.level == 15)
         {
            this.z = new Image(this.BG15);
         }
         if(global.level == 16)
         {
            this.z = new Image(this.BG16);
         }
         if(global.level == 17)
         {
            this.z = new Image(this.BG17);
         }
         if(global.level == 18)
         {
            this.z = new Image(this.BG18);
         }
         if(global.level == 19)
         {
            this.z = new Image(this.BG19);
         }
         if(global.level == 20)
         {
            this.z = new Image(this.BG20);
         }
         if(global.level == 22)
         {
            this.z = new Image(this.BG22);
         }
         if(global.level == 23)
         {
            this.z = new Image(this.BG23);
         }
         if(global.level == 27)
         {
            this.z = new Image(this.BG27);
         }
         this.z.scale = 2;
         graphic = this.z;
         layer = 100;
         type = "background";
      }
      
      override public function render() : void
      {
         super.render();
         if(global.level == 27)
         {
            if(global.hell_intro == 2)
            {
               if(global.pause == false && global.esc_pause == false)
               {
                  this.wait = this.wait + 1;
                  if(this.wait == 12 && global.blur || this.wait == 9 && !global.blur)
                  {
                     FP.world.add(new obj_ember(Math.random() * 320,FP.camera.y + 490));
                  }
                  if(this.wait >= 24 && global.blur || this.wait >= 18 && !global.blur)
                  {
                     FP.world.add(new obj_ember(Math.random() * 320 + 320,FP.camera.y + 490));
                     this.wait = 0;
                  }
               }
               if(this.up == true)
               {
                  this.myAlpha = this.myAlpha + 0.04;
                  if(this.myAlpha > 0.9)
                  {
                     this.up = false;
                  }
               }
               else
               {
                  this.myAlpha = this.myAlpha - 0.04;
                  if(this.myAlpha < -0.2)
                  {
                     this.up = true;
                  }
               }
               this.z.alpha = Math.min(this.myAlpha,0.7);
               this.z.blend = "add";
               super.render();
               this.z.alpha = 1;
               this.z.blend = "normal";
            }
            else
            {
               this.z.blend = "hardlight";
               super.render();
               this.z.blend = "normal";
            }
         }
      }
   }
}
