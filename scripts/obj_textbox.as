package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   
   public class obj_textbox extends Entity
   {
       
      
      private const TB:Class = obj_textbox_TB;
      
      public var spr_textbox:Image;
      
      private const s_sbs3:Class = obj_textbox_s_sbs3;
      
      public var sound_textbox:Sfx;
      
      public var state:Number = 0;
      
      public var text:String = "";
      
      public var offset:Number = 580;
      
      public var desty:Number = 0;
      
      public var vsp:Number = 0;
      
      public var destroy:Boolean = false;
      
      public var myTxt:Text;
      
      public function obj_textbox(txt:String)
      {
         this.sound_textbox = new Sfx(this.s_sbs3);
         this.myTxt = new Text("");
         super();
         this.text = txt;
         layer = -100;
         type = "obj_textbox";
         Text.size = 30;
         Text.align = "center";
         this.myTxt.text = this.text;
         graphic = this.myTxt;
         this.spr_textbox = new Image(this.TB);
         this.spr_textbox.scaleX = this.myTxt.width;
         this.spr_textbox.scaleY = this.myTxt.height;
      }
      
      public function point_distance(x1:int, y1:int, x2:int, y2:int) : Number
      {
         return Math.sqrt(Math.pow(x1 - x2,2) + Math.pow(y1 - y2,2));
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            if(this.state == 0)
            {
               this.desty = 150;
               if(this.offset > this.desty)
               {
                  this.offset = this.offset - this.point_distance(0,this.offset,0,this.desty) / 8;
               }
               if(this.destroy == true && this.offset <= this.desty + 20)
               {
                  this.state = 1;
                  if(global.mute == false)
                  {
                     this.sound_textbox.play(global.volume * 1);
                  }
               }
            }
            else
            {
               this.vsp = this.vsp + 2;
               this.offset = this.offset - this.vsp;
            }
            if(this.offset < -100)
            {
               FP.world.remove(this);
            }
         }
      }
      
      override public function render() : void
      {
         graphic = this.spr_textbox;
         x = FP.camera.x + 320 - Text(this.myTxt).width / 2;
         y = FP.camera.y + this.offset - Text(this.myTxt).height / 2;
         super.render();
         graphic = this.myTxt;
         x = FP.camera.x + 320 - Text(graphic).width / 2;
         y = FP.camera.y + this.offset - Text(graphic).height / 2;
         super.render();
      }
   }
}
