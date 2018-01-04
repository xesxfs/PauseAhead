package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_lasereruption extends Entity
   {
       
      
      private const SPIKES:Class = obj_lasereruption_SPIKES;
      
      public var spr_eruption:Spritemap;
      
      public var i:int = 0;
      
      public var a:Boolean = false;
      
      public var animation:Array;
      
      public var e_height:int = 1;
      
      public var base_y:Number;
      
      public var timer:int = 0;
      
      public var thin:Number = 0.5;
      
      public var timer2:int = 0;
      
      public var die:Boolean = false;
      
      public function obj_lasereruption(nx:int)
      {
         this.spr_eruption = new Spritemap(this.SPIKES,22,26);
         super();
         this.animation = new Array();
         x = nx;
         y = 448;
         this.base_y = 448;
         this.spr_eruption.add("main",[0,1,2,3,4,5,6]);
         this.spr_eruption.scale = 2;
         graphic = this.spr_eruption;
         this.spr_eruption.play("main",true,this.i);
         this.spr_eruption.originX = 22 / 2;
         layer = 10;
         type = "obj_lasereruption";
         this.animation.push(0,1,2,3,4,5,6,1,2,3,4,5,6);
      }
      
      override public function update() : void
      {
         var local1:Array = null;
         var local2:int = 0;
         var local3:Number = NaN;
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(collide("player",x,y))
            {
               global.player.dead = true;
            }
            this.timer++;
            this.timer2++;
            if(this.timer2 > 2)
            {
               if(this.e_height < 10)
               {
                  this.e_height = this.e_height + 1;
               }
               setHitbox(22 * 2 * this.thin,26 * this.e_height * 2 + 26 * 2,22 * this.thin,this.e_height * 2 * 26);
            }
            if(this.timer > 2)
            {
               if(this.e_height >= 10 && this.die == true)
               {
                  this.thin = this.thin - 0.2;
               }
               if(this.thin <= 0)
               {
                  FP.world.remove(this);
               }
               this.animation[0] = this.animation[1];
               this.animation[1] = this.animation[2];
               this.animation[2] = this.animation[3];
               this.animation[3] = this.animation[4];
               this.animation[4] = this.animation[5];
               this.animation[5] = this.animation[6];
               this.animation[6] = this.animation[7];
               this.animation[7] = this.animation[8];
               this.animation[8] = this.animation[9];
               this.animation[9] = this.animation[10];
               this.animation[10] = this.animation[11];
               this.animation[11] = this.animation[12];
               local1 = this.animation;
               local2 = 12;
               local3 = local1[local2] + 1;
               local1[local2] = local3;
               if(this.animation[12] > 6)
               {
                  this.animation[12] = 1;
               }
               this.timer = 0;
               this.spr_eruption.scaleX = this.thin;
            }
         }
      }
      
      override public function render() : void
      {
         this.i = 0;
         while(this.i < this.e_height)
         {
            y = this.base_y - (this.e_height - this.i) * 26 * 2;
            if(this.i == 0)
            {
               this.spr_eruption.play("main",true,0);
            }
            else
            {
               this.spr_eruption.play("main",true,this.animation[this.i]);
            }
            super.render();
            this.i++;
         }
      }
   }
}
