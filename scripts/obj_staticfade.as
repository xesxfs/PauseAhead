package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_staticfade extends Entity
   {
       
      
      private const STATIC:Class = obj_staticfade_STATIC;
      
      public var spr_static:Spritemap;
      
      public var i:int = 0;
      
      public var z:int = 0;
      
      public var alpha:Number = 0;
      
      public function obj_staticfade()
      {
         this.spr_static = new Spritemap(this.STATIC,320,240);
         super();
         this.spr_static.add("main",[0,1,2,3]);
         this.spr_static.alpha = 0;
         this.spr_static.scale = 2;
         graphic = this.spr_static;
         this.spr_static.play("main",true,0);
         layer = -7998;
         type = "staticfade";
      }
      
      override public function render() : void
      {
         this.alpha = this.alpha + 0.002;
         global.staticvol = this.alpha;
         if(this.alpha > 1)
         {
            FP.world.remove(global.muteObj);
            FP.world = new pretitle2();
         }
         this.spr_static.alpha = this.alpha;
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
         super.render();
      }
   }
}
