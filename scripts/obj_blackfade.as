package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_blackfade extends Entity
   {
       
      
      public var alpha:Number = 1;
      
      public var timer:int = -60;
      
      public function obj_blackfade()
      {
         super();
         x = 0;
         y = 0;
         layer = 101;
      }
      
      override public function update() : void
      {
         if(global.pause == false && global.esc_pause == false && global.master.player_freeze == false)
         {
            this.timer = this.timer + 1;
            if(this.timer > 5)
            {
               this.alpha = this.alpha - 0.02;
               this.timer = 0;
            }
            if(this.alpha < 0)
            {
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(0,0,640,480,0,this.alpha,false);
      }
   }
}
