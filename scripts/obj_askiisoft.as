package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   
   public class obj_askiisoft extends Entity
   {
       
      
      private const s_sbs3:Class = obj_askiisoft_s_sbs3;
      
      public var sound_logo:Sfx;
      
      private const ASKI:Class = obj_askiisoft_ASKI;
      
      public var up:Boolean = true;
      
      public var alpha:Number = -0.2;
      
      public var logo:Image;
      
      public function obj_askiisoft()
      {
         this.sound_logo = new Sfx(this.s_sbs3);
         super();
         this.sound_logo.play(global.volume * 1);
         x = 320;
         y = 240;
         layer = -6000;
         this.logo = new Image(this.ASKI);
         this.logo.scale = 3;
         this.logo.centerOO();
         type = "askiisoft";
      }
      
      public function checkDomain(allowed:*) : Boolean
      {
         var d:String = null;
         var url:String = FP.stage.loaderInfo.url;
         var startCheck:int = url.indexOf("://") + 3;
         if(url.substr(0,startCheck) == "file://")
         {
            return true;
         }
         var domainLen:int = url.indexOf("/",startCheck) - startCheck;
         var host:String = url.substr(startCheck,domainLen);
         if(allowed is String)
         {
            allowed = [allowed];
         }
         for each(d in allowed)
         {
            if(host.substr(-d.length,d.length) == d)
            {
               return true;
            }
         }
         return false;
      }
      
      override public function update() : void
      {
         var t:obj_transition = null;
         this.sound_logo.volume = global.volume * 1;
         if(this.checkDomain(["i.adultswim.com","www.adultswim.com","adultswim.com","games.adultswim.com",""]) == false)
         {
            this.up = true;
         }
         if(this.up == true)
         {
            this.alpha = this.alpha + 0.01;
         }
         if(this.alpha > 1.8)
         {
            this.up = false;
         }
         if(this.up == false)
         {
            this.alpha = this.alpha - 0.01;
         }
         if(this.up == false && this.alpha <= -0.1)
         {
            t = new obj_transition();
            world.add(t);
            t.clear = false;
            t.goto = -1;
            FP.world.remove(this);
         }
      }
      
      override public function render() : void
      {
         this.logo.alpha = this.alpha;
         graphic = this.logo;
         super.render();
      }
   }
}
