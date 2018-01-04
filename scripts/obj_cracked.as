package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_cracked extends Entity
   {
       
      
      private const invertSPIKES:Class = obj_cracked_invertSPIKES;
      
      public var spr_invertspikes:Spritemap;
      
      public var i:Number = 0;
      
      public var a:Boolean = false;
      
      public function obj_cracked(nx:int, ny:int)
      {
         this.spr_invertspikes = new Spritemap(this.invertSPIKES,16,16);
         super();
         x = nx;
         y = ny;
         this.spr_invertspikes.add("main",[0,1]);
         this.i = Math.round(Math.random() * 1);
         this.spr_invertspikes.scale = 2;
         graphic = this.spr_invertspikes;
         this.spr_invertspikes.play("main",true,this.i);
         layer = 10;
         type = "obj_cracked";
         setHitbox(32,32,0,0);
      }
      
      override public function update() : void
      {
         if(this.a == false)
         {
            this.a = true;
         }
         super.update();
         if(collide("obj_tendril",x,y))
         {
            FP.world.add(new obj_rubble(x + Math.random() * 32,y,2));
            FP.world.add(new obj_rubble(x + Math.random() * 32,y,3));
            FP.world.add(new obj_rubble(x + Math.random() * 32,y,2));
            FP.world.add(new obj_rubble(x + Math.random() * 32,y,3));
            FP.world.add(new obj_rubble(x + Math.random() * 32,y,2));
            FP.world.remove(this);
         }
         this.spr_invertspikes.play("main",true,this.i);
      }
   }
}
