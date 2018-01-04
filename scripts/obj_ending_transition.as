package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_ending_transition extends Entity
   {
       
      
      private const TRANSITION:Class = obj_ending_transition_TRANSITION;
      
      public var z:Image;
      
      public var ay:Number;
      
      public function obj_ending_transition()
      {
         super();
         this.z = new Image(this.TRANSITION);
         graphic = this.z;
         y = 480;
         this.ay = 480;
         layer = -10;
         type = "obj_ending_transition";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            this.ay = this.ay - 40;
            if(this.ay == -960)
            {
               FP.world.remove(FP.world.classFirst(obj_slide1));
               FP.world.add(new obj_slide2());
            }
            if(this.ay < -960 * 3)
            {
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         graphic = this.z;
         y = this.ay + 960;
         this.z.scaleY = -1;
         super.render();
         Draw.rect(0,this.ay + 960,640,this.ay + 960 + 960,0,1,false);
         graphic = this.z;
         y = this.ay + 960 + 480;
         this.z.scaleY = 1;
         super.render();
      }
   }
}
