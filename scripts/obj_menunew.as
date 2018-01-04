package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_menunew extends Entity
   {
       
      
      public var z:Text;
      
      public var scaleplus:Number = 0;
      
      public function obj_menunew()
      {
         super();
         x = 260;
         y = 407 - 40;
         this.z = new Text("START");
         this.z.size = 30;
         this.z.centerOrigin();
         graphic = this.z;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         super.update();
         if(FP.world.mouseY > y - this.z.height / 2 && FP.world.mouseY < y + this.z.height / 2 && FP.world.mouseX > x - this.z.width / 2 && FP.world.mouseX < x + this.z.width / 2 && global.yesno == false)
         {
            this.z.color = 16776960;
            this.scaleplus = 0.2;
            if(Input.mousePressed)
            {
               if(global.level_start != 1)
               {
                  if(global.yesno == false && FP.world.typeCount("obj_transition") == 0)
                  {
                     world.add(new obj_yesno());
                     world.add(new obj_yesnoyes());
                     world.add(new obj_yesnono());
                     global.yesno = true;
                  }
               }
               else if(FP.world.typeCount("obj_transition") == 0)
               {
                  t = new obj_transition();
                  world.add(t);
                  t.clear = true;
                  t.goto = 1;
               }
            }
         }
         else
         {
            this.z.color = 16777215;
            this.scaleplus = 0;
         }
         this.z.alpha = 0.8 + Math.random() * 0.2;
         this.z.scaleX = 0.98 + Math.random() * 0.02 + this.scaleplus;
         this.z.scaleY = 0.98 + Math.random() * 0.02 + 0.3 + this.scaleplus;
         this.z.angle = Math.random() - Math.random();
         graphic = this.z;
      }
   }
}
