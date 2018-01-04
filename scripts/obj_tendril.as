package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_tendril extends Entity
   {
       
      
      private const TENDRIL:Class = obj_tendril_TENDRIL;
      
      private const s_sbs3:Class = obj_tendril_s_sbs3;
      
      public var sound_thwomp:Sfx;
      
      private const s_sbs4:Class = obj_tendril_s_sbs4;
      
      public var sound_minithwomp:Sfx;
      
      public var z:Image;
      
      public var a:Boolean = false;
      
      public var up:Boolean = true;
      
      public var drawblock:Boolean = false;
      
      public var vsp:Number = 0;
      
      public var wait:int = 40;
      
      public var tb:int = 0;
      
      public function obj_tendril()
      {
         this.sound_thwomp = new Sfx(this.s_sbs3);
         this.sound_minithwomp = new Sfx(this.s_sbs4);
         super();
         if(global.mute == false)
         {
            this.sound_minithwomp.play(global.volume * 1);
         }
         this.tb = Math.round(Math.random() * 8);
         while(global.tendrilblock[this.tb] == true)
         {
            this.tb = Math.round(Math.random() * 8);
         }
         x = 64 * this.tb;
         global.tendrilblock[this.tb] = true;
         y = 840;
         this.z = new Image(this.TENDRIL);
         this.z.scale = 2;
         this.z.originX = 4;
         graphic = this.z;
         setHitbox(64,216 * 2,0,0);
         layer = 9;
         type = "obj_tendril";
      }
      
      public function point_distance(x1:int, y1:int, x2:int, y2:int) : Number
      {
         return Math.sqrt(Math.pow(x1 - x2,2) + Math.pow(y1 - y2,2));
      }
      
      override public function update() : void
      {
         super.update();
         if(this.a == false)
         {
            FP.world.add(new obj_cracked(x,448));
            FP.world.add(new obj_cracked(x + 32,448));
            this.a = true;
         }
         if(global.pause == false && global.esc_pause == false)
         {
            if(collide("player",x,y) && global.pause == false && global.esc_pause == false)
            {
               global.player.dead = true;
            }
            this.wait = this.wait - 1;
            if(y < 440 && this.drawblock == false)
            {
               this.drawblock = true;
               FP.world.add(new obj_shake());
               if(global.mute == false)
               {
                  this.sound_thwomp.play(global.volume * 0.8);
               }
            }
            if(this.up == true && this.wait <= 0)
            {
               y = y - this.point_distance(0,y,0,46) / 10;
            }
            if(y < 47.5)
            {
               this.up = false;
            }
            if(this.up == false)
            {
               this.vsp = this.vsp + 0.3;
            }
            y = y + this.vsp;
            if(y > 480 + 2 && this.up == false)
            {
               FP.world.add(new obj_flashblock(x,448));
               global.tendrilblock[this.tb] = false;
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         if(this.drawblock == true)
         {
            Draw.rect(x,448,64,32,0,0.75);
         }
         super.render();
      }
   }
}
