package
{
   import net.flashpunk.Entity;
   import com.adultswim.highscores.ASHighScores;
   
   public class obj_AS extends Entity
   {
       
      
      public var submit_timer:int = 0;
      
      public var score:int = 0;
      
      public function obj_AS(myScore:int)
      {
         super();
         this.score = myScore;
      }
      
      override public function update() : void
      {
         super.update();
         this.submit_timer = this.submit_timer + 1;
         if(this.submit_timer == 60)
         {
            ASHighScores.init("5559");
            ASHighScores.submitScore(this.score);
         }
      }
   }
}
