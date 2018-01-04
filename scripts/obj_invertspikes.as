package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_invertspikes extends Entity
   {
       
      
      private const invertSPIKES:Class = obj_invertspikes_invertSPIKES;
      
      public var spr_invertspikes:Spritemap;
      
      public var i:Number = 0;
      
      public function obj_invertspikes(nx:int, ny:int)
      {
         this.spr_invertspikes = new Spritemap(this.invertSPIKES,32,32);
         super();
         x = nx;
         y = ny;
         this.spr_invertspikes.add("main",[0,1,2]);
         this.i = Math.round(Math.random() * 2);
         graphic = this.spr_invertspikes;
         this.spr_invertspikes.play("main",true,this.i);
         setHitbox(32,20,0,0);
         layer = -1;
         type = "obj_invertspikes";
      }
      
      override public function update() : void
      {
         super.update();
         if(collide("player",x,y) && global.pause == false && global.esc_pause == false)
         {
            global.player.dead = true;
         }
         this.spr_invertspikes.play("main",true,this.i);
      }
      
      override public function render() : void
      {
         if(x > FP.camera.x - 40 && x < FP.camera.x + 640 + 40 && y > FP.camera.y - 40 && y < FP.camera.y + 480 + 40)
         {
            super.render();
         }
      }
   }
}
