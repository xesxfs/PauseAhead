package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_hellblock extends Entity
   {
       
      
      private const OVERA:Class = obj_hellblock_OVERA;
      
      public var z:Image;
      
      public function obj_hellblock(nx:int, ny:int, sx:int = 1, sy:int = 1)
      {
         super();
         x = nx;
         y = ny;
         setHitbox(32 * sx,32 * sy,0,0);
         type = "solid";
         layer = 99;
         this.z = new Image(this.OVERA);
         this.z.scale = 2;
         graphic = this.z;
      }
      
      override public function update() : void
      {
         super.update();
         if(global.hell_intro == 2)
         {
            FP.world.remove(this);
         }
      }
      
      override public function render() : void
      {
         super.render();
         this.z.blend = "hardlight";
         super.render();
         this.z.blend = "normal";
      }
   }
}
