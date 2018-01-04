package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_recordme2 extends Entity
   {
       
      
      private const THWOMP1:Class = obj_recordme2_THWOMP1;
      
      private const THWOMP2:Class = obj_recordme2_THWOMP2;
      
      private const THWOMP3:Class = obj_recordme2_THWOMP3;
      
      public var trial:int = 1;
      
      public var frame:int = 0;
      
      public var framemax:Array;
      
      public var check:Boolean = false;
      
      public var i:int = 0;
      
      public var big:Boolean = false;
      
      public var ox:int = 0;
      
      public var oy:int = 0;
      
      public var object:obj_bigthwomp;
      
      public var current_room:int;
      
      public var myImage:Image;
      
      public var myImage2:Image;
      
      public var down:Boolean = false;
      
      public var objectx1:Array;
      
      public var objecty1:Array;
      
      public var objectx2:Array;
      
      public var objecty2:Array;
      
      public var objectdown1:Array;
      
      public var objectdown2:Array;
      
      public function obj_recordme2()
      {
         this.framemax = [];
         this.current_room = global.level;
         this.objectx1 = new Array();
         this.objecty1 = new Array();
         this.objectx2 = new Array();
         this.objecty2 = new Array();
         this.objectdown1 = new Array();
         this.objectdown2 = new Array();
         super();
         layer = 0;
         type = "obj_recordme2";
      }
      
      override public function update() : void
      {
         var oh:int = 0;
         var myList:Array = null;
         var bb:obj_recordme2 = null;
         super.update();
         if(this.check == false)
         {
            if(this.big == true)
            {
               this.myImage = new Image(this.THWOMP2);
               this.myImage2 = new Image(this.THWOMP3);
            }
            else
            {
               this.myImage = new Image(this.THWOMP1);
            }
            graphic = this.myImage;
            oh = 0;
            myList = [];
            FP.world.getClass(obj_recordme2,myList);
            for each(bb in myList)
            {
               if(bb.ox == this.ox && bb.oy == this.oy)
               {
                  oh = oh + 1;
                  bb.object = this.object;
               }
            }
            if(oh > 1)
            {
               FP.world.remove(this);
            }
            this.check = true;
         }
         if(global.pause == false && global.replay.record == true && global.master.player_freeze == false && global.esc_pause == false)
         {
            this.objectx2.push(this.object.x);
            this.objectx1[this.trial] = this.objectx2;
            this.objecty2.push(this.object.y);
            this.objecty1[this.trial] = this.objecty2;
            if(this.big == true)
            {
               if(this.object.down == true || this.object.wait > 0)
               {
                  this.objectdown2.push(true);
               }
               else
               {
                  this.objectdown2.push(false);
               }
               this.objectdown1[this.trial] = this.objectdown2;
            }
            this.frame = this.frame + 1;
         }
         this.framemax[this.trial] = this.frame - 1;
      }
      
      override public function render() : void
      {
         var z:int = 0;
         if(global.level != this.current_room)
         {
            FP.world.remove(this);
         }
         if(FP.world.classCount(obj_menunew) != 0)
         {
            FP.world.remove(this);
         }
         if(global.replay.play == false)
         {
            this.i = 0;
         }
         if(global.replay.play == true)
         {
            z = 0;
            while(z < this.trial)
            {
               z = z + 1;
               if(this.i < this.framemax[z])
               {
                  x = this.objectx1[z][Math.min(this.i,this.framemax[z])];
                  y = this.objecty1[z][Math.min(this.i,this.framemax[z])];
                  if(this.big == true)
                  {
                     if(this.objectdown1[z][Math.min(this.i,this.framemax[z])] == true)
                     {
                        graphic = this.myImage2;
                     }
                     else
                     {
                        graphic = this.myImage;
                     }
                  }
                  super.render();
               }
            }
            if(global.pause == false && global.esc_pause == false)
            {
               this.i = this.i + 1;
            }
         }
      }
   }
}
