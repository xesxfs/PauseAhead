package net.flashpunk
{
   import flash.display.MovieClip;
   import flash.utils.getTimer;
   import net.flashpunk.utils.Draw;
   import flash.display.StageAlign;
   import flash.display.StageQuality;
   import flash.display.StageScaleMode;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import net.flashpunk.utils.Input;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   
   public class Engine extends MovieClip
   {
       
      
      public var paused:Boolean = false;
      
      public var maxElapsed:Number = 0.0333;
      
      public var maxFrameSkip:uint = 5;
      
      public var tickRate:uint = 4;
      
      private var _delta:Number = 0;
      
      private var _time:Number;
      
      private var _last:Number;
      
      private var _timer:Timer;
      
      private var _rate:Number;
      
      private var _skip:Number;
      
      private var _prev:Number;
      
      private var _updateTime:uint;
      
      private var _renderTime:uint;
      
      private var _gameTime:uint;
      
      private var _flashTime:uint;
      
      private var _frameLast:uint = 0;
      
      private var _frameListSum:uint = 0;
      
      private var _frameList:Vector.<uint>;
      
      public function Engine(width:uint, height:uint, frameRate:Number = 60, fixed:Boolean = false)
      {
         this._frameList = new Vector.<uint>();
         super();
         FP.width = width;
         FP.height = height;
         FP.halfWidth = width / 2;
         FP.halfHeight = height / 2;
         FP.assignedFrameRate = frameRate;
         FP.fixed = fixed;
         FP.timeInFrames = fixed;
         FP.engine = this;
         FP.screen = new Screen();
         FP.bounds = new Rectangle(0,0,width,height);
         FP._world = new World();
         FP.camera = FP._world.camera;
         Draw.resetTarget();
         if(FP.randomSeed == 0)
         {
            FP.randomizeSeed();
         }
         FP.entity = new Entity();
         FP._time = getTimer();
         addEventListener(Event.ADDED_TO_STAGE,this.onStage);
      }
      
      public function init() : void
      {
      }
      
      public function update() : void
      {
         if(FP.tweener.active && FP.tweener._tween)
         {
            FP.tweener.updateTweens();
         }
         if(FP._world.active)
         {
            if(FP._world._tween)
            {
               FP._world.updateTweens();
            }
            FP._world.update();
         }
         FP._world.updateLists();
         if(FP._goto)
         {
            this.checkWorld();
         }
      }
      
      public function render() : void
      {
         var t:Number = getTimer();
         if(!this._frameLast)
         {
            this._frameLast = t;
         }
         FP.screen.swap();
         Draw.resetTarget();
         FP.screen.refresh();
         if(FP._world.visible)
         {
            FP._world.render();
         }
         FP.screen.redraw();
         t = getTimer();
         this._frameListSum = this._frameListSum + (this._frameList[this._frameList.length] = t - this._frameLast);
         if(this._frameList.length > 10)
         {
            this._frameListSum = this._frameListSum - this._frameList.shift();
         }
         FP.frameRate = 1000 / (this._frameListSum / this._frameList.length);
         this._frameLast = t;
      }
      
      public function focusGained() : void
      {
      }
      
      public function focusLost() : void
      {
      }
      
      public function setStageProperties() : void
      {
         stage.frameRate = FP.assignedFrameRate;
         stage.align = StageAlign.TOP_LEFT;
         stage.quality = StageQuality.HIGH;
         stage.scaleMode = StageScaleMode.SHOW_ALL;
         stage.displayState = StageDisplayState.NORMAL;
      }
      
      private function onStage(e:Event = null) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onStage);
         stage.addEventListener(Event.ACTIVATE,this.onActivate);
         stage.addEventListener(Event.DEACTIVATE,this.onDeactivate);
         FP.stage = stage;
         this.setStageProperties();
         Input.enable();
         if(FP._goto)
         {
            this.checkWorld();
         }
         this.init();
         this._rate = 1000 / FP.assignedFrameRate;
         if(FP.fixed)
         {
            this._skip = this._rate * (this.maxFrameSkip + 1);
            this._last = this._prev = getTimer();
            this._timer = new Timer(this.tickRate);
            this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.start();
         }
         else
         {
            this._last = getTimer();
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(e:Event) : void
      {
         this._time = this._gameTime = getTimer();
         FP._flashTime = this._time - this._flashTime;
         this._updateTime = this._time;
         FP.elapsed = (this._time - this._last) / 1000;
         if(FP.elapsed > this.maxElapsed)
         {
            FP.elapsed = this.maxElapsed;
         }
         FP.elapsed = FP.elapsed * FP.rate;
         this._last = this._time;
         if(FP._console)
         {
            FP._console.update();
         }
         if(!this.paused)
         {
            this.update();
         }
         Input.update();
         this._time = this._renderTime = getTimer();
         FP._updateTime = this._time - this._updateTime;
         if(!this.paused)
         {
            this.render();
         }
         this._time = this._flashTime = getTimer();
         FP._renderTime = this._time - this._renderTime;
         FP._gameTime = this._time - this._gameTime;
      }
      
      private function onTimer(e:TimerEvent) : void
      {
         this._time = getTimer();
         this._delta = this._delta + (this._time - this._last);
         this._last = this._time;
         if(this._delta < this._rate)
         {
            return;
         }
         this._gameTime = this._time;
         FP._flashTime = this._time - this._flashTime;
         if(FP._console)
         {
            FP._console.update();
         }
         if(this._delta > this._skip)
         {
            this._delta = this._skip;
         }
         while(this._delta >= this._rate)
         {
            FP.elapsed = this._rate * FP.rate * 0.001;
            this._updateTime = this._time;
            this._delta = this._delta - this._rate;
            this._prev = this._time;
            if(!this.paused)
            {
               this.update();
            }
            Input.update();
            this._time = getTimer();
            FP._updateTime = this._time - this._updateTime;
         }
         this._renderTime = this._time;
         if(!this.paused)
         {
            this.render();
         }
         this._time = this._flashTime = getTimer();
         FP._renderTime = this._time - this._renderTime;
         FP._gameTime = this._time - this._gameTime;
      }
      
      private function checkWorld() : void
      {
         if(!FP._goto)
         {
            return;
         }
         FP._world.end();
         FP._world.updateLists();
         if(FP._world && FP._world.autoClear && FP._world._tween)
         {
            FP._world.clearTweens();
         }
         FP._world = FP._goto;
         FP._goto = null;
         FP.camera = FP._world.camera;
         FP._world.updateLists();
         FP._world.begin();
         FP._world.updateLists();
      }
      
      private function onActivate(e:Event) : void
      {
         FP.focused = true;
         this.focusGained();
         FP.world.focusGained();
      }
      
      private function onDeactivate(e:Event) : void
      {
         FP.focused = false;
         this.focusLost();
         FP.world.focusLost();
      }
   }
}
