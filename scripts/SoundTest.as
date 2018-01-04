package
{
   import net.flashpunk.World;
   import net.flashpunk.FP;
   
   public class SoundTest extends World
   {
       
      
      public function SoundTest()
      {
         super();
         add(global.muteObj);
         add(new obj_gamestatic());
         add(new obj_overlay());
         add(new obj_solidoverlay());
         add(new obj_transition());
         FP.screen.color = 12643838;
         global.soundtest = new obj_soundtest_page();
         add(global.soundtest);
         var i:int = 0;
         while(i < 9)
         {
            i = i + 1;
            if(i == 1 && global.music_unlocked[i] == 1 || i > 1 && i < 9 && global.music_unlocked[i + 1] == 1 || i == 9 && global.music_unlocked[2] == 1)
            {
               add(new obj_soundtest_song(i));
            }
         }
      }
   }
}
