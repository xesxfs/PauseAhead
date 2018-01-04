package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_replaystatic extends Entity
   {
       
      
      private const STATIC:Class = obj_replaystatic_STATIC;
      
      public var spr_static:Spritemap;
      
      public var i:int = 0;
      
      public var z:int = 0;
      
      public function obj_replaystatic()
      {
         this.spr_static = new Spritemap(this.STATIC,320,240);
         super();
         this.spr_static.add("main",[0,1,2,3]);
         this.spr_static.alpha = 0.2;
         this.spr_static.blend = "add";
         this.spr_static.scale = 2;
         graphic = this.spr_static;
         this.spr_static.play("main",true,0);
         layer = -600;
      }
      
      override public function render() : void
      {
         x = FP.camera.x;
         y = FP.camera.y;
         this.z++;
         if(this.z > 2)
         {
            this.i++;
            this.z = 0;
         }
         if(this.i > 3)
         {
            this.i = 0;
         }
         this.spr_static.play("main",true,this.i);
         if(global.replay.play == true)
         {
            super.render();
         }
      }
   }
}
