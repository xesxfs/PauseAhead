package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_rubble extends Entity
   {
       
      
      private const RUBBLE:Class = obj_rubble_RUBBLE;
      
      public var spr_invertspikes:Spritemap;
      
      public var i:Number = 0;
      
      public var a:int = 0;
      
      public var turn:int = 0;
      
      public var vsp:Number = 0;
      
      public var hsp:Number = 0;
      
      public function obj_rubble(nx:int, ny:int, pow:int)
      {
         this.spr_invertspikes = new Spritemap(this.RUBBLE,8,8);
         super();
         x = nx;
         y = ny;
         this.turn = Math.round(Math.random());
         this.vsp = -2 * pow - Math.random() * 2 * pow;
         this.hsp = Math.random() * 2 * pow - Math.random() * 2 * pow;
         this.spr_invertspikes.add("main",[0,1,2,3,4]);
         this.i = Math.round(Math.random() * 4);
         this.spr_invertspikes.scale = 2 + Math.random() * 0.4;
         graphic = this.spr_invertspikes;
         this.spr_invertspikes.play("main",true,this.i);
         layer = 1;
         type = "obj_rubble";
         setHitbox(2,2);
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false && global.pause == false)
         {
            this.a = this.a + 1;
            if(this.a > 40 && collide("solid",x,y))
            {
               FP.world.remove(this);
            }
            this.spr_invertspikes.play("main",true,this.i);
            this.vsp = this.vsp + 0.05;
            if(this.vsp > 4)
            {
               this.vsp = 4;
            }
            x = x + this.hsp;
            y = y + this.vsp;
            if(this.turn == 1)
            {
               this.spr_invertspikes.angle = this.spr_invertspikes.angle + this.hsp;
            }
            if(this.turn == 0)
            {
               this.spr_invertspikes.angle = this.spr_invertspikes.angle - this.hsp;
            }
         }
         if(y > 480 || x < 0 || x > 640 || y < 0)
         {
            FP.world.remove(this);
         }
      }
   }
}
