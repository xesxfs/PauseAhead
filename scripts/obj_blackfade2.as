package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_blackfade2 extends Entity
   {
       
      
      public var alpha:Number = 0;
      
      public function obj_blackfade2()
      {
         super();
         layer = -30;
         type = "obj_transition";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            global.blackfadevol = this.alpha;
            this.alpha = this.alpha + 0.003;
            if(this.alpha >= 1)
            {
               if(FP.world.typeCount("obj_blackfade3") == 0)
               {
                  world.add(new obj_blackfade3());
               }
            }
         }
      }
      
      override public function render() : void
      {
         Draw.rect(FP.camera.x - 5,FP.camera.y - 5,650,490,0,this.alpha);
      }
   }
}
