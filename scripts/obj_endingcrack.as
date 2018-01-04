package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.FP;
   
   public class obj_endingcrack extends Entity
   {
       
      
      private const CRACK:Class = obj_endingcrack_CRACK;
      
      public var sprite:Image;
      
      public var alpha:Number = 0;
      
      public var txt:Text;
      
      public var basey:int = 0;
      
      public var vsp:Number = 0;
      
      public var crack_y:Number;
      
      public var text_y:Number;
      
      public function obj_endingcrack(nx:int, ny:int)
      {
         super();
         Text.size = 15;
         Text.align = "center";
         this.txt = new Text("[SPACE]");
         x = nx;
         y = ny;
         this.crack_y = y;
         this.basey = y - 30;
         this.text_y = this.basey + 10;
         y = y + 10;
         this.sprite = new Image(this.CRACK);
         graphic = this.sprite;
         this.sprite.scale = 2;
         setHitbox(32,32,-62,-64);
         layer = 107;
         type = "obj_crack";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            y = this.crack_y;
            if(this.text_y > this.basey)
            {
               this.vsp = this.vsp - 0.05;
            }
            if(this.text_y < this.basey)
            {
               this.vsp = this.vsp + 0.05;
            }
            this.text_y = this.text_y + this.vsp;
            if(collide("player",x,y))
            {
               this.alpha = this.alpha + 0.05;
               if(Input.pressed(Key.SPACE) || Input.pressed(Key.DOWN) || Input.pressed(Key.S))
               {
                  FP.world.remove(global.muteObj);
                  FP.world = new level_ending();
               }
            }
            else
            {
               this.alpha = this.alpha - 0.05;
            }
            if(this.alpha > 1)
            {
               this.alpha = 1;
            }
            if(this.alpha < 0)
            {
               this.alpha = 0;
            }
         }
      }
      
      override public function render() : void
      {
         y = this.crack_y;
         graphic = this.sprite;
         super.render();
         graphic = this.txt;
         this.txt.alpha = this.alpha;
         y = this.text_y;
         x = x + 64;
         super.render();
         x = x - 64;
      }
   }
}
