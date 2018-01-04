package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_yesno extends Entity
   {
       
      
      public var a:Text;
      
      public var b:Text;
      
      public function obj_yesno()
      {
         super();
         layer = -6000;
         type = "obj_yesno";
         this.a = new Text("ARE YOU SURE?");
         this.a.size = 30;
         this.a.centerOrigin();
         this.b = new Text("THIS WILL OVERWRITE YOUR PREVIOUS GAME.");
         this.b.size = 15;
         this.b.centerOrigin();
         x = 320 + global.pxoff;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.yesno == false)
         {
            FP.world.remove(this);
         }
      }
      
      override public function render() : void
      {
         Draw.rect(0,0,global.room_width,global.room_height,0,0.6,false);
         Draw.rectPlus(FP.camera.x + 320 - 185,FP.camera.y + 240 - 65,185 * 2,65 * 2,0,1,true,4,5);
         Draw.rectPlus(FP.camera.x + 320 - 175,FP.camera.y + 240 - 55,175 * 2,55 * 2,13421772,1,false,4,5);
         Draw.rectPlus(FP.camera.x + 320 - 185,FP.camera.y + 240 - 65,185 * 2,65 * 2,13421772,1,false,4,5);
         graphic = this.a;
         y = 210;
         super.render();
         graphic = this.b;
         y = 235;
         super.render();
      }
   }
}
