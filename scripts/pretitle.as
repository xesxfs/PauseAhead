package
{
   import net.flashpunk.World;
   import net.flashpunk.FP;
   
   public class pretitle extends World
   {
       
      
      public function pretitle()
      {
         super();
         FP.screen.color = 13421772;
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_askiisoft());
         add(global.muteObj);
      }
   }
}
