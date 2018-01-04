package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_guillitine extends Entity
   {
       
      
      private const s_sbs3:Class = obj_guillitine_s_sbs3;
      
      public var sound_thwomp:Sfx;
      
      private const G:Class = obj_guillitine_G;
      
      private const BASE:Class = obj_guillitine_BASE;
      
      private const A1:Class = obj_guillitine_A1;
      
      private const A2:Class = obj_guillitine_A2;
      
      public var down:Boolean = false;
      
      public var offset:int = 0;
      
      public var spr_g:Image;
      
      public var spr_base:Image;
      
      public var spr_altar:Image;
      
      public var mytype:int = 0;
      
      public var bloody:Boolean = false;
      
      public function obj_guillitine(nx:int, ny:int, gNumb:int)
      {
         this.sound_thwomp = new Sfx(this.s_sbs3);
         super();
         this.mytype = gNumb;
         x = nx;
         y = ny;
         this.spr_g = new Image(this.G);
         this.spr_base = new Image(this.BASE);
         this.spr_g.scale = 2;
         this.spr_base.scale = 2;
         if(this.mytype == 1 && global.hellkey_1 == true)
         {
            this.bloody = true;
         }
         if(this.mytype == 2 && global.hellkey_2 == true)
         {
            this.bloody = true;
         }
         if(this.bloody == true)
         {
            this.spr_altar = new Image(this.A2);
         }
         else
         {
            this.spr_altar = new Image(this.A1);
         }
         this.spr_altar.scale = 2;
         setHitbox(16,128,-16 - 8,0);
         layer = -1;
         type = "obj_guillitine";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(collide("player",x,y))
            {
               this.down = true;
               global.player.dead = true;
               if(this.mytype == 1)
               {
                  if(global.hellkey_1 == false)
                  {
                     global.helltext = global.helltext + 1;
                  }
                  global.hellkey_1 = true;
               }
               if(this.mytype == 2)
               {
                  if(global.hellkey_2 == false)
                  {
                     global.helltext = global.helltext + 1;
                  }
                  global.hellkey_2 = true;
               }
               FP.world.add(new obj_shake());
               FP.world.add(new obj_whiteflash2());
            }
            if(this.down == true)
            {
               this.offset = this.offset + 8;
               if(this.offset > 128 - 28)
               {
                  this.offset = 128 - 28;
               }
            }
         }
      }
      
      override public function render() : void
      {
         y = y + this.offset;
         graphic = this.spr_g;
         super.render();
         y = y - this.offset;
         graphic = this.spr_base;
         super.render();
         y = y + 128;
         x = x - 16;
         graphic = this.spr_altar;
         super.render();
         y = y - 128;
         x = x + 16;
      }
   }
}
