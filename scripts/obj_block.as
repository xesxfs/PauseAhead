package
{
   import net.flashpunk.Entity;
   
   public class obj_block extends Entity
   {
       
      
      public function obj_block(nx:int, ny:int, sx:int = 1, sy:int = 1)
      {
         super();
         x = nx;
         y = ny;
         setHitbox(32 * sx,32 * sy,0,0);
         layer = 0;
         type = "solid";
      }
   }
}
