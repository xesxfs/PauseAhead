package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_flashblock extends Entity
   {
       
      
      public var alpha:Number = 1;
      
      public function obj_flashblock(nx:int, ny:int)
      {
         super();
         x = nx;
         y = ny;
         layer = -10;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            this.alpha = this.alpha - 0.05;
            if(this.alpha < 0)
            {
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(x,y,64,32,16777215,this.alpha,false);
      }
   }
}
