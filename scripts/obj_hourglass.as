package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   import net.flashpunk.graphics.Image;
   
   public class obj_hourglass extends Entity
   {
       
      
      private const H:Class = obj_hourglass_H;
      
      private const s_collect:Class = obj_hourglass_s_collect;
      
      public var sound_collect:Sfx;
      
      public var basey:int = 0;
      
      public var vsp:Number = 0;
      
      public function obj_hourglass(nx:int, ny:int)
      {
         this.sound_collect = new Sfx(this.s_collect);
         super();
         x = nx;
         y = ny;
         this.basey = y;
         y = y + 10;
         var z:Image = new Image(this.H);
         z.centerOrigin();
         graphic = z;
         setHitbox(40,44,20,22);
         layer = 0;
         type = "obj_hourglass";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(y > this.basey)
            {
               this.vsp = this.vsp - 0.05;
            }
            if(y < this.basey)
            {
               this.vsp = this.vsp + 0.05;
            }
            y = y + this.vsp;
         }
         if(collide("player",x,y) && global.pause == false && global.esc_pause == false)
         {
            global.master.second = global.master.second + 10;
            if(global.mute == false)
            {
               this.sound_collect.play(global.volume * 1);
            }
            FP.world.add(new obj_whiteflash());
            if(global.master.second > 59)
            {
               global.master.minute = global.master.minute + 1;
               global.master.second = global.master.second - 60;
            }
            FP.world.remove(this);
         }
      }
   }
}
