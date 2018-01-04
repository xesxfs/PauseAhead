package
{
   import net.flashpunk.Entity;
   import net.flashpunk.utils.Draw;
   import net.flashpunk.FP;
   
   public class obj_replayborder extends Entity
   {
       
      
      public function obj_replayborder()
      {
         super();
         layer = -57;
      }
      
      override public function render() : void
      {
         if(global.replay.play == true)
         {
            Draw.rectPlus(FP.camera.x + 30,FP.camera.y + 30,640 - 30 * 2,480 - 30 * 2,13421772,1,false,10,0);
         }
      }
   }
}
