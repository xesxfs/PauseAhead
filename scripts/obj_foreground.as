package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   
   public class obj_foreground extends Entity
   {
       
      
      private const FG1:Class = obj_foreground_FG1;
      
      private const FG2:Class = obj_foreground_FG2;
      
      private const FG3:Class = obj_foreground_FG3;
      
      private const FG4:Class = obj_foreground_FG4;
      
      private const FG5:Class = obj_foreground_FG5;
      
      private const FG7:Class = obj_foreground_FG7;
      
      private const FG6:Class = obj_foreground_FG6;
      
      private const FG8:Class = obj_foreground_FG8;
      
      private const FG9:Class = obj_foreground_FG9;
      
      private const FG10:Class = obj_foreground_FG10;
      
      private const FG12:Class = obj_foreground_FG12;
      
      private const FG14:Class = obj_foreground_FG14;
      
      private const FG16:Class = obj_foreground_FG16;
      
      private const FG17:Class = obj_foreground_FG17;
      
      private const FG19:Class = obj_foreground_FG19;
      
      public function obj_foreground()
      {
         var z:Image = null;
         super();
         layer = -55;
         if(global.level == 1)
         {
            graphic = new Image(this.FG1);
         }
         if(global.level == 2)
         {
            graphic = new Image(this.FG2);
         }
         if(global.level == 3)
         {
            graphic = new Image(this.FG3);
         }
         if(global.level == 4)
         {
            graphic = new Image(this.FG4);
         }
         if(global.level == 5)
         {
            graphic = new Image(this.FG5);
         }
         if(global.level == 6)
         {
            graphic = new Image(this.FG6);
         }
         if(global.level == 7)
         {
            graphic = new Image(this.FG7);
         }
         if(global.level == 8)
         {
            graphic = new Image(this.FG8);
         }
         if(global.level == 9)
         {
            graphic = new Image(this.FG9);
         }
         if(global.level == 10)
         {
            graphic = new Image(this.FG10);
         }
         if(global.level == 12)
         {
            graphic = new Image(this.FG12);
         }
         if(global.level == 14)
         {
            graphic = new Image(this.FG14);
         }
         if(global.level == 16)
         {
            graphic = new Image(this.FG16);
         }
         if(global.level == 17)
         {
            graphic = new Image(this.FG17);
         }
         if(global.level == 19)
         {
            z = new Image(this.FG19);
            z.scale = 2;
            graphic = z;
            layer = -57;
         }
         type = "foreground";
      }
   }
}
