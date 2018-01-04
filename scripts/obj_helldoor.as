package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Spritemap;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.FP;
   
   public class obj_helldoor extends Entity
   {
       
      
      private const s_sbs3:Class = obj_helldoor_s_sbs3;
      
      public var sound_door:Sfx;
      
      private const s_sbs4:Class = obj_helldoor_s_sbs4;
      
      public var sound_open:Sfx;
      
      private const FACE:Class = obj_helldoor_FACE;
      
      public var spr_face:Spritemap;
      
      public var animation_index:Number = 0;
      
      public var animation_max:Number = 10;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.1;
      
      public var open:Boolean = false;
      
      public var alpha:Number = 0;
      
      public var txt:Text;
      
      public var basey:int = 0;
      
      public var vsp:Number = 0;
      
      public var text_y:Number;
      
      public var face_alpha:Number = 1;
      
      public function obj_helldoor(nx:int, ny:int)
      {
         this.sound_door = new Sfx(this.s_sbs3);
         this.sound_open = new Sfx(this.s_sbs4);
         this.spr_face = new Spritemap(this.FACE,26,46);
         super();
         Text.size = 15;
         Text.align = "center";
         this.txt = new Text("[SPACE]");
         x = nx;
         y = ny;
         this.basey = y - 30;
         this.text_y = this.basey + 10;
         y = y + 10;
         this.spr_face.scale = 2;
         this.spr_face.add("main",[0,1,2,3,4,5,6,7,8,9,10]);
         setHitbox(64,32,-20,-40);
         layer = 1;
         type = "obj_helldoor";
         Input.define("ACTION",Key.DOWN,Key.SPACE);
      }
      
      override public function update() : void
      {
         var myList:Array = null;
         var bb:obj_helleye = null;
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(this.open == false)
            {
               if(global.hellkey_1 == true && global.hellkey_2 == true)
               {
                  if(this.text_y > this.basey)
                  {
                     this.vsp = this.vsp - 0.05;
                  }
                  if(this.text_y < this.basey)
                  {
                     this.vsp = this.vsp + 0.05;
                  }
                  this.text_y = this.text_y + this.vsp;
                  if(collide("player",x,y))
                  {
                     this.alpha = this.alpha + 0.05;
                     if(Input.pressed(Key.SPACE) || Input.pressed(Key.DOWN) || Input.pressed(Key.S))
                     {
                        this.open = true;
                        FP.world.add(new obj_shake2());
                        FP.world.add(new obj_whiteflash2());
                        myList = [];
                        FP.world.getClass(obj_helleye,myList);
                        for each(bb in myList)
                        {
                           FP.world.remove(bb);
                        }
                        this.sound_open.play(global.volume);
                     }
                  }
                  else
                  {
                     this.alpha = this.alpha - 0.05;
                  }
                  if(this.alpha > 1)
                  {
                     this.alpha = 1;
                  }
                  if(this.alpha < 0)
                  {
                     this.alpha = 0;
                  }
               }
            }
            else
            {
               this.animation_float = this.animation_float + this.animation_speed;
               if(this.animation_float >= 1)
               {
                  this.animation_index = this.animation_index + 1;
                  this.animation_float = 0;
               }
               if(this.animation_index > this.animation_max)
               {
                  this.animation_index = this.animation_max;
                  this.face_alpha = this.face_alpha - 0.1;
               }
            }
            if(this.open == true && this.animation_index == this.animation_max)
            {
               if(collide("player",x,y) && Input.check("ACTION"))
               {
                  if(global.mute == false)
                  {
                     this.sound_door.play(global.volume * 1);
                  }
                  global.pause = false;
                  FP.world.remove(global.player);
                  global.achievementQueue.push(14);
                  if(FP.world.typeCount("obj_transition") == 0)
                  {
                     world.add(new obj_blackfade2());
                  }
               }
            }
         }
         this.spr_face.play("main",true,this.animation_index);
         this.spr_face.alpha = this.face_alpha;
      }
      
      override public function render() : void
      {
         y = this.basey;
         this.spr_face.flipped = false;
         graphic = this.spr_face;
         super.render();
         this.spr_face.flipped = true;
         x = x + 26 * 2;
         super.render();
         x = x - 26 * 2;
         if(this.open == false)
         {
            graphic = this.txt;
            this.txt.alpha = this.alpha;
            y = this.text_y;
            y = y - 24;
            x = x + 24;
            super.render();
            x = x - 24;
            y = y + 24;
         }
      }
   }
}
