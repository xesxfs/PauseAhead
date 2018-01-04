package
{
   import net.flashpunk.World;
   import net.flashpunk.FP;
   
   public class pretitle2 extends World
   {
       
      
      public function pretitle2()
      {
         super();
         FP.screen.color = 13421772;
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_askiisoft());
         add(new obj_staticfade2());
         add(global.muteObj);
      }
   }
}
