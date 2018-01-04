package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   
   public class obj_credits extends Entity
   {
       
      
      public var text:Text;
      
      public var credits:String;
      
      public function obj_credits()
      {
         super();
         x = -25;
         y = 500;
         layer = -28;
         type = "obj_credts";
         this.credits = "PAUSE AHEAD";
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\n\n\n\n\n\nProgramming and design\n______________\nTadakuni Amano";
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\nAdditional level design\n______________\nKenju";
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\nArt\n______________\nDavid Zhang\nRakugaki-Otoko\nFrancis Coulombe\nBen Pettengill\nWill Olthouse\nflashygoodness";
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\nMusic\n______________\nBill Kiley";
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\nAdditional Music\n______________\nflashygoodness";
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\nSound effects\n______________\nflashygoodness";
         if(global.sunglasses)
         {
            this.credits = this.credits + "\n\n\n\n\n\n\n\n\nSpecial thanks to\n______________\nChevy Ray Johnston - Flashpunk\nToby Fox - Additional Dialogue";
         }
         else
         {
            this.credits = this.credits + "\n\n\n\n\n\n\n\n\nSpecial thanks to\n______________\nChevy Ray Johnston - Flashpunk";
         }
         this.credits = this.credits + "\n\n\n\n\n\n\n\n\nPause Ahead\nFlash version\nAskiisoft (c) 2013\n\n\n\n\n\n\n\n\n\n\n\n\n\nThanks for playing!";
         this.text = new Text(this.credits);
         this.text.align = "center";
         this.text.size = 20;
         this.text.color = 0;
         graphic = this.text;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            if(global.sunglasses)
            {
               if(y > -2030)
               {
                  y = y - 1;
               }
               else if(FP.world.classCount(obj_whitefade2) == 0)
               {
                  FP.world.add(new obj_whitefade2());
               }
            }
            else if(y > -2030)
            {
               y = y - 1;
            }
            else if(FP.world.classCount(obj_whitefade2) == 0)
            {
               FP.world.add(new obj_whitefade2());
            }
         }
      }
      
      override public function render() : void
      {
         super.render();
      }
   }
}
