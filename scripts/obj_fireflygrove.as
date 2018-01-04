package
{
   import net.flashpunk.Entity;
   import net.flashpunk.FP;
   
   public class obj_fireflygrove extends Entity
   {
       
      
      public var a:Boolean = false;
      
      public var ni:int;
      
      public function obj_fireflygrove(nx:int, ny:int, numb:int)
      {
         super();
         x = nx;
         y = ny;
         this.ni = numb;
         layer = -1;
         type = "obj_fireflygrove";
      }
      
      override public function update() : void
      {
         var i:int = 0;
         super.update();
         if(this.a == false)
         {
            i = 0;
            while(i < this.ni)
            {
               FP.world.add(new obj_firefly(x,y));
               i++;
            }
            FP.world.remove(this);
         }
      }
   }
}
