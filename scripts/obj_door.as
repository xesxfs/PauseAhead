package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Input;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.utils.Key;
   
   public class obj_door extends Entity
   {
       
      
      private const DOOR:Class = obj_door_DOOR;
      
      private const s_sbs3:Class = obj_door_s_sbs3;
      
      public var sound_door:Sfx;
      
      public var used:Boolean = false;
      
      public function obj_door(nx:int, ny:int)
      {
         this.sound_door = new Sfx(this.s_sbs3);
         super();
         x = nx;
         y = ny;
         if(global.level != 24 && global.level != 25 && global.level != 26)
         {
            graphic = new Image(this.DOOR);
         }
         setHitbox(96,96,0,0);
         layer = -1;
         type = "obj_door";
         Input.define("ACTION",Key.DOWN,Key.SPACE);
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         var myList:Array = null;
         var bb:obj_sawleft = null;
         var aa:obj_sawright = null;
         var cc:obj_ceilingsawleft = null;
         var dd:obj_ceilingsawright = null;
         super.update();
         if(FP.world.classCount(obj_secret) == 0 && (collide("player",x,y) && Input.check("ACTION") && global.esc_pause == false))
         {
            if(global.speedrunning == false && global.level != 24 && global.level != 25 && global.level != 26)
            {
               if(global.mute == false)
               {
                  this.sound_door.play(global.volume * 1);
               }
               global.pause = false;
               FP.world.remove(global.player);
               global.replay.play = true;
               global.replay.record = false;
               myList = new Array();
               FP.world.getClass(obj_sawleft,myList);
               for each(bb in myList)
               {
                  bb.x = bb.basex;
                  bb.dir = "left";
                  bb.delay = 14;
               }
               myList = [];
               FP.world.getClass(obj_sawright,myList);
               for each(aa in myList)
               {
                  aa.x = aa.basex;
                  aa.dir = "right";
                  aa.delay = 14;
               }
               myList = [];
               FP.world.getClass(obj_ceilingsawleft,myList);
               for each(cc in myList)
               {
                  cc.x = cc.basex;
                  cc.dir = "left";
                  cc.delay = 14;
               }
               myList = [];
               FP.world.getClass(obj_ceilingsawright,myList);
               for each(dd in myList)
               {
                  dd.x = dd.basex;
                  dd.dir = "right";
                  dd.delay = 14;
               }
            }
            else if(this.used == false)
            {
               this.used = true;
               if(global.mute == false)
               {
                  this.sound_door.play(global.volume * 1);
               }
               global.pause = false;
               FP.world.remove(global.player);
               t = new obj_transition();
               world.add(t);
               t.clear = true;
               t.goto = global.level + 1;
               if(global.level == 24)
               {
                  t.goto = 7;
               }
               if(global.level == 25)
               {
                  t.goto = 14;
               }
               if(global.level == 26)
               {
                  t.goto = 20;
               }
            }
         }
      }
   }
}
