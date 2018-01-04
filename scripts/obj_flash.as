package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_flash extends Entity
   {
       
      
      public var alpha:Number = 1;
      
      public function obj_flash()
      {
         super();
         layer = -12;
         type = "obj_flash";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
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
         Draw.rect(0,0,640,480,16777215,this.alpha);
      }
   }
}
