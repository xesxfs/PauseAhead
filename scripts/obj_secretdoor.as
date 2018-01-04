package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.utils.Input;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Key;
   
   public class obj_secretdoor extends Entity
   {
       
      
      private const DOOR2:Class = obj_secretdoor_DOOR2;
      
      private const s_sbs3:Class = obj_secretdoor_s_sbs3;
      
      public var sound_door:Sfx;
      
      public var alpha:Number = 0;
      
      public var a:int = 0;
      
      public var z:Image;
      
      public function obj_secretdoor()
      {
         this.sound_door = new Sfx(this.s_sbs3);
         super();
         x = 276;
         y = 672;
         this.z = new Image(this.DOOR2);
         this.z.alpha = 0;
         graphic = this.z;
         setHitbox(96,96,0,0);
         layer = -1;
         type = "obj_door";
         Input.define("ACTION",Key.DOWN,Key.SPACE);
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         super.update();
         if(global.pause == false && global.master.player_freeze == false && global.esc_pause == false)
         {
            this.a = this.a + 1;
         }
         if(this.a > 600)
         {
            this.alpha = this.alpha + 0.01;
            this.z.alpha = this.alpha;
            graphic = this.z;
            if(collide("player",x,y) && Input.check("ACTION"))
            {
               if(global.mute == false)
               {
                  this.sound_door.play(global.volume * 1);
               }
               global.pause = false;
               FP.world.remove(global.player);
               if(FP.world.typeCount("obj_transition") == 0)
               {
                  t = new obj_transition();
                  world.add(t);
                  t.clear = true;
                  t.goto = 25;
               }
            }
         }
      }
      
      override public function render() : void
      {
         graphic = this.z;
         super.render();
      }
   }
}
