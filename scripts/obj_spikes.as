package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_spikes extends Entity
   {
       
      
      private const SPIKES:Class = obj_spikes_SPIKES;
      
      public var spr_spikes:Spritemap;
      
      public var i:Number = 0;
      
      public function obj_spikes(nx:int, ny:int)
      {
         this.spr_spikes = new Spritemap(this.SPIKES,32,33);
         super();
         x = nx;
         y = ny;
         this.spr_spikes.add("main",[0,1,2]);
         this.i = Math.round(Math.random() * 2);
         graphic = this.spr_spikes;
         this.spr_spikes.play("main",true,this.i);
         setHitbox(32,20,0,-12);
         layer = -1;
         type = "obj_spikes";
      }
      
      override public function update() : void
      {
         super.update();
         if(collide("player",x,y) && global.pause == false && global.esc_pause == false)
         {
            global.player.dead = true;
         }
         this.spr_spikes.play("main",true,this.i);
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
