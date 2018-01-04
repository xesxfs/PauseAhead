package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_bossbutton extends Entity
   {
       
      
      private const BB:Class = obj_bossbutton_BB;
      
      private const BB1:Class = obj_bossbutton_BB1;
      
      private const BB2:Class = obj_bossbutton_BB2;
      
      public var on:Boolean = false;
      
      public var alpha:Number = 0;
      
      public var button:Image;
      
      public var buttonlight:Image;
      
      public var buttondark:Image;
      
      public var randalph:Number = 0.5;
      
      public function obj_bossbutton(nx:int, ny:int)
      {
         super();
         x = nx;
         y = ny;
         layer = 30;
         this.button = new Image(this.BB);
         this.buttonlight = new Image(this.BB1);
         this.buttondark = new Image(this.BB2);
         this.button.scale = 2;
         this.buttondark.scale = 2;
         this.buttonlight.scale = 2;
         type = "solid";
         setHitbox(40,6,0,-80);
      }
      
      override public function update() : void
      {
         if(global.pause == false && global.esc_pause == false)
         {
            if(collide("player",x,y - 2) || collide("obj_shadowplayer",x - 32,y - 2))
            {
               this.on = true;
            }
            else
            {
               this.on = false;
            }
            if(this.on == true)
            {
               this.button.color = 16711680;
            }
            else
            {
               this.button.color = 16777215;
            }
            this.randalph = Math.random() * 0.2;
            if(FP.world.classCount(obj_statue) == 0 && FP.world.classCount(obj_blackflash) == 0 && FP.world.classCount(obj_blacktext) == 0)
            {
               this.alpha = this.alpha + 0.01;
            }
            else
            {
               this.alpha = this.alpha - 0.01;
               this.randalph = 0;
            }
            if(FP.world.classCount(obj_statue) != 0)
            {
               if(FP.world.classCount(obj_whiteflash2) == 0 && layer != 600)
               {
                  FP.world.add(new obj_whiteflash2());
               }
               y = y + 1;
               layer = 600;
            }
            if(this.alpha > 1)
            {
               this.alpha = 1;
            }
            if(this.alpha < 0)
            {
               this.alpha = 0;
               this.on = false;
            }
         }
      }
      
      override public function render() : void
      {
         if(this.alpha < 1)
         {
            graphic = this.buttondark;
            super.render();
         }
         if(this.alpha > 0)
         {
            this.button.alpha = this.alpha - 0.2 + this.randalph;
            graphic = this.button;
            super.render();
            this.buttonlight.alpha = this.alpha;
            graphic = this.buttonlight;
            super.render();
         }
      }
   }
}
