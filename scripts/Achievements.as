package
{
   import net.flashpunk.World;
   import net.flashpunk.FP;
   
   public class Achievements extends World
   {
       
      
      public function Achievements()
      {
         super();
         add(global.muteObj);
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_transition());
         FP.screen.color = 12643838;
         add(new obj_achievement_page());
      }
   }
}
