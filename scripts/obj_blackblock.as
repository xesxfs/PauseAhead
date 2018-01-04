package
{
   import net.flashpunk.Entity;
   import net.flashpunk.utils.Draw;
   
   public class obj_blackblock extends Entity
   {
       
      
      public function obj_blackblock(nx:int, ny:int)
      {
         super();
         x = nx;
         y = ny;
         layer = 99;
      }
      
      override public function render() : void
      {
         Draw.rect(x,y,32,32,0,0.75,false);
      }
   }
}
