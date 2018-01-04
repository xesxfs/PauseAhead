package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   
   public class obj_mute extends Entity
   {
       
      
      private const VOL:Class = obj_mute_VOL;
      
      public var spr_volume:Spritemap;
      
      public var z:Image;
      
      public var drawme:Boolean = false;
      
      public var timer:int;
      
      public var px:int = 0;
      
      public var py:int = 0;
      
      public var pTimer:int = 0;
      
      public function obj_mute()
      {
         this.spr_volume = new Spritemap(this.VOL,320,40);
         super();
         this.drawme = false;
         this.timer = -20;
         this.spr_volume.scale = 2;
         this.spr_volume.add("sprite_index",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],0,true);
         layer = -7999;
         graphic = this.spr_volume;
      }
      
      override public function update() : void
      {
         if(global.achievementQueue.length > 0 && FP.world.classCount(obj_achievement) == 0 && FP.world.classCount(obj_transition) == 0)
         {
            global.achievementQueue.reverse();
            FP.world.add(new obj_achievement(global.achievementQueue.pop()));
            global.achievementQueue.reverse();
         }
         if(this.timer < -20)
         {
            this.timer = -20;
         }
         if(this.timer < 0)
         {
            this.drawme = false;
         }
         else
         {
            this.drawme = true;
         }
         global.vol_on = this.drawme;
         x = FP.camera.x + 640 - 480;
         y = FP.camera.y + 480 - 50;
         if(global.muted == true)
         {
            global.muted = false;
            this.timer = 50;
            this.drawme = true;
         }
         if(FP.world.mouseY >= y)
         {
            if(this.timer > 20)
            {
               this.timer = 20;
            }
            this.timer = this.timer + 1;
            if(Input.mouseDown)
            {
               this.pTimer = 0;
               this.timer = 20;
               this.drawme = true;
               global.volume = (FP.world.mouseX + 39 - x) / 480;
               global.volume = Math.round(global.volume * 20) / 20;
               if(global.volume > 1)
               {
                  global.volume = 1;
               }
               if(global.volume < 0)
               {
                  global.volume = 0;
                  global.mute = true;
               }
               else
               {
                  global.mute = false;
               }
            }
         }
         else
         {
            this.timer = this.timer - 1;
            this.pTimer = 0;
         }
         if(this.drawme == true)
         {
            if(FP.distance(this.px,this.py,FP.world.mouseX - FP.camera.x,FP.world.mouseY - FP.camera.y) < 10)
            {
               this.pTimer = this.pTimer + 1;
               if(this.pTimer > 100)
               {
                  this.drawme = false;
                  this.timer = -20;
               }
            }
            else
            {
               this.pTimer = 0;
            }
            this.px = FP.world.mouseX - FP.camera.x;
            this.py = FP.world.mouseY - FP.camera.y;
         }
      }
      
      override public function render() : void
      {
         if(this.drawme == true)
         {
            x = FP.camera.x;
            y = FP.camera.y - 75 + 480;
            this.spr_volume.play("sprite_index",true,global.volume * 20);
            super.render();
         }
      }
   }
}
