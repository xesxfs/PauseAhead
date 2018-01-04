package
{
   import flash.display.MovieClip;
   import flash.events.ProgressEvent;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import flash.display.DisplayObject;
   
   [SWF(width="640",height="480")]
   public class Preloader extends MovieClip
   {
       
      
      public var wait:int = 0;
      
      public var ImgBG:Class;
      
      public var ImgBar:Class;
      
      public var ImgPlayer:Class;
      
      public var myBGClip:MovieClip;
      
      public var myBar:MovieClip;
      
      public var myPlayer:MovieClip;
      
      public function Preloader()
      {
         this.ImgBG = Preloader_ImgBG;
         this.ImgBar = Preloader_ImgBar;
         this.ImgPlayer = Preloader_ImgPlayer;
         super();
         addEventListener(Event.ENTER_FRAME,this.checkFrame);
         loaderInfo.addEventListener(ProgressEvent.PROGRESS,this.progress);
         this.myBGClip = new this.ImgBG();
         this.myBGClip.x = 0;
         this.myBGClip.y = 0;
         addChild(this.myBGClip);
         this.myPlayer = new this.ImgPlayer();
         this.myPlayer.x = 0;
         this.myPlayer.y = 190;
         addChild(this.myPlayer);
         this.myBar = new this.ImgBar();
         this.myBar.x = 158;
         this.myBar.y = 253;
         this.myBar.height = 32;
         this.myBar.width = 1;
         addChild(this.myBar);
      }
      
      private function progress(e:ProgressEvent) : void
      {
         this.myPlayer.x = loaderInfo.bytesLoaded / loaderInfo.bytesTotal * 323 + 158 - 44;
         this.myBar.width = loaderInfo.bytesLoaded / loaderInfo.bytesTotal * 323;
      }
      
      private function checkFrame(e:Event) : void
      {
         if(currentFrame == totalFrames)
         {
            this.wait = this.wait + 1;
            if(this.wait > 6)
            {
               removeEventListener(Event.ENTER_FRAME,this.checkFrame);
               this.startup();
            }
         }
      }
      
      private function startup() : void
      {
         var mainClass:Class = null;
         stop();
         loaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.progress);
         var domainLockTo:String = "i.adultswim.com";
         var url:String = stage.loaderInfo.url;
         var urlBeginning:int = url.indexOf("://") + 3;
         var urlTermination:int = url.indexOf("/",urlBeginning);
         var pageDomain:String = url.substring(urlBeginning,urlTermination);
         var lastDot:int = pageDomain.lastIndexOf(".") - 1;
         var CharacterAfterDomain:int = pageDomain.lastIndexOf(".",lastDot) + 1;
         var currentDomain:String = pageDomain.substring(CharacterAfterDomain,pageDomain.length);
         var validDomain:Boolean = currentDomain.lastIndexOf(domainLockTo) + domainLockTo.length == currentDomain.length;
         var debug:Boolean = false;
         debug = true;
         if(validDomain || debug)
         {
            mainClass = getDefinitionByName("Main") as Class;
            stage.addChild(new mainClass() as DisplayObject);
         }
      }
   }
}
