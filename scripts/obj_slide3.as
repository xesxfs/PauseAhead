package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_slide3 extends Entity
   {
       
      
      private const s_t1:Class = obj_slide3_s_t1;
      
      public var sound_crack:Sfx;
      
      private const s_t2:Class = obj_slide3_s_t2;
      
      public var sound_dissolve:Sfx;
      
      private const s_t3:Class = obj_slide3_s_t3;
      
      public var sound_step:Sfx;
      
      private const s_t4:Class = obj_slide3_s_t4;
      
      public var sound_shatter:Sfx;
      
      private const S3:Class = obj_slide3_S3;
      
      public var spr_slide3:Spritemap;
      
      public var slide:int = 0;
      
      public var alpha:Number = 1;
      
      public var alpha2:Number = -3.5;
      
      public var alpha3:Number = -0.5;
      
      public var alpha4:Number = -0.5;
      
      public var alpha5:Number = -0.5;
      
      public var alpha6:Number = -0.5;
      
      public var alpha7:Number = -0.5;
      
      public var part:int = 0;
      
      public var check:Boolean = false;
      
      public function obj_slide3()
      {
         this.sound_crack = new Sfx(this.s_t1);
         this.sound_dissolve = new Sfx(this.s_t2);
         this.sound_step = new Sfx(this.s_t3);
         this.sound_shatter = new Sfx(this.s_t4);
         this.spr_slide3 = new Spritemap(this.S3,640,480);
         super();
         x = 0;
         y = 0;
         this.spr_slide3.add("main",[0,1,2,3,4,5]);
         graphic = this.spr_slide3;
         layer = 0;
         type = "obj_slide3";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            if(this.part == 0)
            {
               this.alpha2 = this.alpha2 + 0.02;
               if(this.alpha2 > 0 && this.check == false)
               {
                  this.check = true;
                  if(global.mute == false)
                  {
                     this.sound_step.play(global.volume * 1);
                  }
               }
               if(this.alpha2 > 1)
               {
                  this.part = 1;
                  this.check = false;
               }
            }
            if(this.part == 1)
            {
               this.alpha3 = this.alpha3 + 0.02;
               if(this.alpha3 > 0 && this.check == false)
               {
                  this.check = true;
                  if(global.mute == false)
                  {
                     this.sound_step.play(global.volume * 1);
                  }
               }
               if(this.alpha3 > 1)
               {
                  this.part = 2;
                  this.check = false;
               }
            }
            if(this.part == 2)
            {
               this.alpha4 = this.alpha4 + 0.02;
               if(this.alpha4 > 0 && this.check == false)
               {
                  this.check = true;
                  if(global.mute == false)
                  {
                     this.sound_step.play(global.volume * 1);
                  }
               }
               if(this.alpha4 > 1)
               {
                  this.part = 3;
                  this.check = false;
               }
            }
            if(this.part == 3)
            {
               this.alpha5 = this.alpha5 + 0.01;
               if(this.alpha5 > 0)
               {
                  FP.world.add(new obj_flash());
                  this.sound_crack.play(global.volume * 1);
                  this.part = 4;
                  this.alpha5 = 1;
               }
            }
            if(this.part == 4)
            {
               this.alpha6 = this.alpha6 + 0.005;
               if(this.alpha6 > 0)
               {
                  FP.world.add(new obj_flash());
                  this.part = 5;
                  this.alpha6 = 1;
                  FP.world.add(new obj_rocks());
                  this.sound_shatter.play(global.volume * 1);
                  this.sound_dissolve.play(global.volume * 1);
               }
            }
            this.sound_dissolve.volume = global.volume * 1;
            this.sound_shatter.volume = global.volume * 1;
         }
      }
      
      override public function render() : void
      {
         this.spr_slide3.alpha = this.alpha;
         this.spr_slide3.play("main",true,0);
         super.render();
         this.spr_slide3.alpha = this.alpha2;
         this.spr_slide3.play("main",true,1);
         super.render();
         this.spr_slide3.alpha = this.alpha3;
         this.spr_slide3.play("main",true,2);
         super.render();
         this.spr_slide3.alpha = this.alpha4;
         this.spr_slide3.play("main",true,3);
         super.render();
         this.spr_slide3.alpha = this.alpha5;
         this.spr_slide3.play("main",true,4);
         super.render();
         this.spr_slide3.alpha = this.alpha6;
         this.spr_slide3.play("main",true,5);
         super.render();
      }
   }
}
