package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.FP;
   
   public class obj_rocks extends Entity
   {
       
      
      private const ROCK:Class = obj_rocks_ROCK;
      
      public var spr_rocks:Spritemap;
      
      public var y0:Number = 0;
      
      public var y1:Number = 0;
      
      public var y2:Number = 0;
      
      public var y3:Number = 0;
      
      public function obj_rocks()
      {
         this.spr_rocks = new Spritemap(this.ROCK,640,480);
         super();
         this.spr_rocks.add("main",[0,1,2,3]);
         graphic = this.spr_rocks;
         FP.world.add(new obj_whitefade());
         layer = -10;
         type = "obj_rocks";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.esc_pause == false)
         {
            this.y0 = this.y0 - 0.4;
            this.y1 = this.y1 - 0.3;
            this.y2 = this.y2 - 0.2;
            this.y3 = this.y3 - 0.1;
         }
      }
      
      override public function render() : void
      {
         y = this.y3;
         this.spr_rocks.play("main",true,3);
         super.render();
         y = this.y2;
         this.spr_rocks.play("main",true,2);
         super.render();
         y = this.y1;
         this.spr_rocks.play("main",true,1);
         super.render();
         this.spr_rocks.play("main",true,0);
         y = this.y0;
         super.render();
      }
   }
}
