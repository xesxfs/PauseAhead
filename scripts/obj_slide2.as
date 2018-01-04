package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_slide2 extends Entity
   {
       
      
      private const s_t1:Class = obj_slide2_s_t1;
      
      public var sound_wind:Sfx;
      
      private const s_t2:Class = obj_slide2_s_t2;
      
      public var sound_sun:Sfx;
      
      private const CAVE:Class = obj_slide2_CAVE;
      
      private const CLOUDS:Class = obj_slide2_CLOUDS;
      
      private const BACKGROUND:Class = obj_slide2_BACKGROUND;
      
      private const FLARE:Class = obj_slide2_FLARE;
      
      public var bg_y:Number = 0;
      
      public var fg_y:Number = 0;
      
      public var bg_x:Number = 20;
      
      public var fy:Number = 1100;
      
      public var lx:Number = 313;
      
      public var ly:Number = 103;
      
      public var scale:Number = 0;
      
      public var angle:Number = 0;
      
      public var up:Boolean = true;
      
      public var double:Boolean = false;
      
      public var sun:Boolean = false;
      
      public var vsp:Number = 0.05;
      
      public var spr_cave:Image;
      
      public var spr_clouds:Image;
      
      public var spr_background:Image;
      
      public var spr_flare:Image;
      
      public function obj_slide2()
      {
         this.sound_wind = new Sfx(this.s_t1);
         this.sound_sun = new Sfx(this.s_t2);
         super();
         this.spr_cave = new Image(this.CAVE);
         this.spr_clouds = new Image(this.CLOUDS);
         this.spr_background = new Image(this.BACKGROUND);
         this.spr_flare = new Image(this.FLARE);
         this.spr_flare.blend = "add";
         this.spr_flare.centerOrigin();
         layer = -1;
         type = "obj_slide2";
         this.sound_wind.play(global.volume * 1);
      }
      
      public function point_distance(x1:Number, y1:Number, x2:Number, y2:Number) : Number
      {
         return Math.sqrt(Math.pow(x1 - x2,2) + Math.pow(y1 - y2,2));
      }
      
      public function random(max:Number) : Number
      {
         return Math.random() * max;
      }
      
      override public function update() : void
      {
         if(global.mute == true)
         {
            this.sound_wind.volume = 0;
         }
         else
         {
            this.sound_wind.volume = global.volume * (1 - this.scale / 10);
         }
         super.update();
         if(global.esc_pause == false)
         {
            this.bg_y = -this.fy / 30;
            this.fg_y = -this.fy / 10;
            this.bg_x = this.bg_x - 0.1;
            if(this.fy > 0)
            {
               this.fy = this.fy - this.point_distance(0,this.fy,0,0) / 100;
            }
            if(this.fy < 140)
            {
               this.sun = true;
            }
            if(this.sun == true)
            {
               if(this.double == false)
               {
                  if(this.up == true)
                  {
                     this.scale = this.scale + 0.003;
                     if(this.scale > 0.3)
                     {
                        this.up = false;
                     }
                  }
                  else
                  {
                     this.scale = this.scale - 0.003;
                  }
                  this.angle = this.angle + 5;
                  if(this.scale < 0.08 && this.up == false)
                  {
                     this.double = true;
                     this.sound_sun.play(global.volume * 1);
                  }
                  this.vsp = 0.03;
               }
               else
               {
                  this.angle = this.angle + 0.5;
                  this.vsp = this.vsp + 0.0001;
                  this.scale = this.scale + this.vsp;
                  if(this.scale > 10)
                  {
                     FP.world.add(new obj_whiteslowflash());
                     FP.world.add(new obj_slide3());
                     this.sound_wind.stop();
                     FP.world.remove(this);
                  }
               }
            }
         }
         this.sound_sun.volume = global.volume;
      }
      
      override public function render() : void
      {
         graphic = this.spr_background;
         x = 0;
         y = Math.round(this.bg_y);
         super.render();
         graphic = this.spr_clouds;
         x = Math.round(this.bg_x);
         y = Math.round(this.bg_y);
         super.render();
         graphic = this.spr_cave;
         x = 0;
         y = Math.round(this.fg_y);
         super.render();
         this.spr_flare.scale = this.scale;
         this.spr_flare.angle = this.angle;
         graphic = this.spr_flare;
         x = this.lx;
         y = this.ly + this.bg_y;
         super.render();
      }
   }
}
