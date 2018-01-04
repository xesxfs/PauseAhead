package net.flashpunk.debug
{
   import net.flashpunk.graphics.Text;
   import net.flashpunk.FP;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.Entity;
   import flash.display.Graphics;
   import flash.system.System;
   import flash.text.TextFormat;
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.text.TextField;
   
   public class Console
   {
      
      private static var textRef:Text;
       
      
      public var toggleKey:uint = 192;
      
      private var _enabled:Boolean;
      
      private var _paused:Boolean;
      
      private var _debug:Boolean;
      
      private var _scrolling:Boolean;
      
      private var _selecting:Boolean;
      
      private var _dragging:Boolean;
      
      private var _panning:Boolean;
      
      private var _sprite:Sprite;
      
      private var _format:TextFormat;
      
      private var _back:Bitmap;
      
      private var _fpsRead:Sprite;
      
      private var _fpsReadText:TextField;
      
      private var _fpsInfo:Sprite;
      
      private var _fpsInfoText0:TextField;
      
      private var _fpsInfoText1:TextField;
      
      private var _memReadText:TextField;
      
      private var _logRead:Sprite;
      
      private var _logReadText0:TextField;
      
      private var _logReadText1:TextField;
      
      private var _logHeight:uint;
      
      private var _logBar:Rectangle;
      
      private var _logBarGlobal:Rectangle;
      
      private var _logScroll:Number = 0;
      
      private var _entRead:Sprite;
      
      private var _entReadText:TextField;
      
      private var _debRead:Sprite;
      
      private var _debReadText0:TextField;
      
      private var _debReadText1:TextField;
      
      private var _butRead:Sprite;
      
      private var _butDebug:Bitmap;
      
      private var _butOutput:Bitmap;
      
      private var _butPlay:Bitmap;
      
      private var _butPause:Bitmap;
      
      private var _butStep:Bitmap;
      
      private var _entScreen:Sprite;
      
      private var _entSelect:Sprite;
      
      private var _entRect:Rectangle;
      
      private var _logLines:uint = 33;
      
      private const LOG:Vector.<String> = new Vector.<String>();
      
      private const ENTITY_LIST:Vector.<Entity> = new Vector.<Entity>();
      
      private const SCREEN_LIST:Vector.<Entity> = new Vector.<Entity>();
      
      private const SELECT_LIST:Vector.<Entity> = new Vector.<Entity>();
      
      private const WATCH_LIST:Vector.<String> = Vector.<String>(["x","y"]);
      
      private const CONSOLE_LOGO:Class = Console_CONSOLE_LOGO;
      
      private const CONSOLE_DEBUG:Class = Console_CONSOLE_DEBUG;
      
      private const CONSOLE_OUTPUT:Class = Console_CONSOLE_OUTPUT;
      
      private const CONSOLE_PLAY:Class = Console_CONSOLE_PLAY;
      
      private const CONSOLE_PAUSE:Class = Console_CONSOLE_PAUSE;
      
      private const CONSOLE_STEP:Class = Console_CONSOLE_STEP;
      
      public function Console()
      {
         this._sprite = new Sprite();
         this._format = new TextFormat("default");
         this._back = new Bitmap();
         this._fpsRead = new Sprite();
         this._fpsReadText = new TextField();
         this._fpsInfo = new Sprite();
         this._fpsInfoText0 = new TextField();
         this._fpsInfoText1 = new TextField();
         this._memReadText = new TextField();
         this._logRead = new Sprite();
         this._logReadText0 = new TextField();
         this._logReadText1 = new TextField();
         this._entRead = new Sprite();
         this._entReadText = new TextField();
         this._debRead = new Sprite();
         this._debReadText0 = new TextField();
         this._debReadText1 = new TextField();
         this._butRead = new Sprite();
         this._entScreen = new Sprite();
         this._entSelect = new Sprite();
         this._entRect = new Rectangle();
         super();
         Input.define("_ARROWS",Key.RIGHT,Key.LEFT,Key.DOWN,Key.UP);
      }
      
      public function log(... data) : void
      {
         var s:String = null;
         var i:int = 0;
         var a:Array = null;
         if(data.length > 1)
         {
            s = "";
            i = 0;
            while(i < data.length)
            {
               if(i > 0)
               {
                  s = s + " ";
               }
               s = s + data[i++].toString();
            }
         }
         else
         {
            s = data[0].toString();
         }
         if(s.indexOf("\n") >= 0)
         {
            a = s.split("\n");
            for each(s in a)
            {
               this.LOG.push(s);
            }
         }
         else
         {
            this.LOG.push(s);
         }
         if(this._enabled && this._sprite.visible)
         {
            this.updateLog();
         }
      }
      
      public function watch(... properties) : void
      {
         var i:String = null;
         if(properties.length > 1)
         {
            for each(i in properties)
            {
               this.WATCH_LIST.push(i);
            }
         }
         else if(properties[0] is Array || properties[0] is Vector.<*>)
         {
            for each(i in properties[0])
            {
               this.WATCH_LIST.push(i);
            }
         }
         else
         {
            this.WATCH_LIST.push(properties[0]);
         }
      }
      
      public function enable() : void
      {
         if(this._enabled)
         {
            return;
         }
         this._enabled = true;
         FP.engine.addChild(this._sprite);
         var big:Boolean = this.width >= 480;
         this._sprite.addChild(this._back);
         this._back.bitmapData = new BitmapData(this.width,this.height,true,4294967295);
         var b:BitmapData = new this.CONSOLE_LOGO().bitmapData;
         FP.matrix.identity();
         FP.matrix.tx = Math.max((this._back.bitmapData.width - b.width) / 2,0);
         FP.matrix.ty = Math.max((this._back.bitmapData.height - b.height) / 2,0);
         FP.matrix.scale(Math.min(this.width / this._back.bitmapData.width,1),Math.min(this.height / this._back.bitmapData.height,1));
         this._back.bitmapData.draw(b,FP.matrix,null,BlendMode.MULTIPLY);
         this._back.bitmapData.draw(this._back.bitmapData,null,null,BlendMode.INVERT);
         this._back.bitmapData.colorTransform(this._back.bitmapData.rect,new ColorTransform(1,1,1,0.5));
         this._sprite.addChild(this._entScreen);
         this._entScreen.addChild(this._entSelect);
         this._sprite.addChild(this._entRead);
         this._entRead.addChild(this._entReadText);
         this._entReadText.defaultTextFormat = this.format(16,16777215,"right");
         this._entReadText.embedFonts = true;
         this._entReadText.width = 100;
         this._entReadText.height = 20;
         this._entRead.x = this.width - this._entReadText.width;
         this._entRead.graphics.clear();
         this._entRead.graphics.beginFill(0,0.5);
         this._entRead.graphics.drawRoundRectComplex(0,0,this._entReadText.width,20,0,0,20,0);
         this._sprite.addChild(this._fpsRead);
         this._fpsRead.addChild(this._fpsReadText);
         this._fpsReadText.defaultTextFormat = this.format(16);
         this._fpsReadText.embedFonts = true;
         this._fpsReadText.width = 70;
         this._fpsReadText.height = 20;
         this._fpsReadText.x = 2;
         this._fpsReadText.y = 1;
         this._fpsRead.graphics.clear();
         this._fpsRead.graphics.beginFill(0,0.75);
         this._fpsRead.graphics.drawRoundRectComplex(0,0,!!big?Number(320):Number(160),20,0,0,0,20);
         if(big)
         {
            this._sprite.addChild(this._fpsInfo);
         }
         this._fpsInfo.addChild(this._fpsInfoText0);
         this._fpsInfo.addChild(this._fpsInfoText1);
         this._fpsInfoText0.defaultTextFormat = this.format(8,11184810);
         this._fpsInfoText1.defaultTextFormat = this.format(8,11184810);
         this._fpsInfoText0.embedFonts = true;
         this._fpsInfoText1.embedFonts = true;
         this._fpsInfoText0.width = this._fpsInfoText1.width = 60;
         this._fpsInfoText0.height = this._fpsInfoText1.height = 20;
         this._fpsInfo.x = 75;
         this._fpsInfoText1.x = 60;
         this._fpsRead.addChild(this._memReadText);
         this._memReadText.defaultTextFormat = this.format(16);
         this._memReadText.embedFonts = true;
         this._memReadText.width = 110;
         this._memReadText.height = 20;
         this._memReadText.x = this._fpsInfo.x + this._fpsInfo.width + 5;
         this._memReadText.y = 1;
         this._sprite.addChild(this._logRead);
         this._logRead.addChild(this._logReadText0);
         this._logRead.addChild(this._logReadText1);
         this._logReadText0.defaultTextFormat = this.format(16,16777215);
         this._logReadText1.defaultTextFormat = this.format(!!big?uint(16):uint(8),16777215);
         this._logReadText0.embedFonts = true;
         this._logReadText1.embedFonts = true;
         this._logReadText0.selectable = false;
         this._logReadText0.width = 80;
         this._logReadText0.height = 20;
         this._logReadText1.width = this.width;
         this._logReadText0.x = 2;
         this._logReadText0.y = 3;
         this._logReadText0.text = "OUTPUT:";
         this._logHeight = this.height - 60;
         this._logBar = new Rectangle(8,24,16,this._logHeight - 8);
         this._logBarGlobal = this._logBar.clone();
         this._logBarGlobal.y = this._logBarGlobal.y + 40;
         this._logLines = this._logHeight / (!!big?16.5:8.5);
         this._sprite.addChild(this._debRead);
         this._debRead.addChild(this._debReadText0);
         this._debRead.addChild(this._debReadText1);
         this._debReadText0.defaultTextFormat = this.format(16,16777215);
         this._debReadText1.defaultTextFormat = this.format(8,16777215);
         this._debReadText0.embedFonts = true;
         this._debReadText1.embedFonts = true;
         this._debReadText0.selectable = false;
         this._debReadText0.width = 80;
         this._debReadText0.height = 20;
         this._debReadText1.width = 160;
         this._debReadText1.height = int(this.height / 4);
         this._debReadText0.x = 2;
         this._debReadText0.y = 3;
         this._debReadText1.x = 2;
         this._debReadText1.y = 24;
         this._debReadText0.text = "DEBUG:";
         this._debRead.y = this.height - (this._debReadText1.y + this._debReadText1.height);
         this._sprite.addChild(this._butRead);
         this._butRead.addChild(this._butDebug = new this.CONSOLE_DEBUG());
         this._butRead.addChild(this._butOutput = new this.CONSOLE_OUTPUT());
         this._butRead.addChild(this._butPlay = new this.CONSOLE_PLAY()).x = 20;
         this._butRead.addChild(this._butPause = new this.CONSOLE_PAUSE()).x = 20;
         this._butRead.addChild(this._butStep = new this.CONSOLE_STEP()).x = 40;
         this.updateButtons();
         this._butRead.graphics.clear();
         this._butRead.graphics.beginFill(0,0.75);
         this._butRead.graphics.drawRoundRectComplex(-20,0,100,20,0,0,20,20);
         this.debug = true;
         this.paused = false;
      }
      
      public function get visible() : Boolean
      {
         return this._sprite.visible;
      }
      
      public function set visible(value:Boolean) : void
      {
         this._sprite.visible = value;
         if(this._enabled && value)
         {
            this.updateLog();
         }
      }
      
      public function update() : void
      {
         if(!this._enabled)
         {
            return;
         }
         if(this._paused)
         {
            this.updateButtons();
            if(this._debug)
            {
               if(FP.engine.paused)
               {
                  if(Input.mousePressed)
                  {
                     if(Input.mouseFlashY > 20 && (Input.mouseFlashX > this._debReadText1.width || Input.mouseFlashY < this._debRead.y))
                     {
                        if(Input.check(Key.SHIFT))
                        {
                           if(this.SELECT_LIST.length)
                           {
                              this.startDragging();
                           }
                           else
                           {
                              this.startPanning();
                           }
                        }
                        else
                        {
                           this.startSelection();
                        }
                     }
                  }
                  else
                  {
                     if(this._selecting)
                     {
                        this.updateSelection();
                     }
                     if(this._dragging)
                     {
                        this.updateDragging();
                     }
                     if(this._panning)
                     {
                        this.updatePanning();
                     }
                  }
                  if(Input.pressed(Key.A))
                  {
                     this.selectAll();
                  }
                  if(Input.check(Key.SHIFT))
                  {
                     if(this.SELECT_LIST.length)
                     {
                        if(Input.pressed("_ARROWS"))
                        {
                           this.updateKeyMoving();
                        }
                     }
                     else if(Input.check("_ARROWS"))
                     {
                        this.updateKeyPanning();
                     }
                  }
               }
               else
               {
                  this.updateEntityLists(FP.world.count != this.ENTITY_LIST.length);
                  this.renderEntities();
                  this.updateFPSRead();
                  this.updateEntityCount();
               }
               this.updateDebugRead();
            }
            else if(this._scrolling)
            {
               this.updateScrolling();
            }
            else if(Input.mousePressed)
            {
               this.startScrolling();
            }
         }
         else
         {
            this.updateFPSRead();
            this.updateEntityCount();
         }
         if(Input.pressed(this.toggleKey))
         {
            this.paused = !this._paused;
         }
      }
      
      public function get paused() : Boolean
      {
         return this._paused;
      }
      
      public function set paused(value:Boolean) : void
      {
         if(!this._enabled)
         {
            return;
         }
         this._paused = value;
         FP.engine.paused = value;
         this._back.visible = value;
         this._entScreen.visible = value;
         this._butRead.visible = value;
         if(value)
         {
            if(this._debug)
            {
               this.debug = true;
            }
            else
            {
               this.updateLog();
            }
         }
         else
         {
            this._debRead.visible = false;
            this._logRead.visible = true;
            this.updateLog();
            this.ENTITY_LIST.length = 0;
            this.SCREEN_LIST.length = 0;
            this.SELECT_LIST.length = 0;
         }
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
      
      public function set debug(value:Boolean) : void
      {
         if(!this._enabled)
         {
            return;
         }
         this._debug = value;
         this._debRead.visible = value;
         this._logRead.visible = !value;
         if(value)
         {
            this.updateEntityLists();
         }
         else
         {
            this.updateLog();
         }
         this.renderEntities();
      }
      
      private function stepFrame() : void
      {
         FP.engine.update();
         FP.engine.render();
         this.updateEntityCount();
         this.updateEntityLists();
         this.renderEntities();
      }
      
      private function startDragging() : void
      {
         this._dragging = true;
         this._entRect.x = Input.mouseX;
         this._entRect.y = Input.mouseY;
      }
      
      private function updateDragging() : void
      {
         this.moveSelected(Input.mouseX - this._entRect.x,Input.mouseY - this._entRect.y);
         this._entRect.x = Input.mouseX;
         this._entRect.y = Input.mouseY;
         if(Input.mouseReleased)
         {
            this._dragging = false;
         }
      }
      
      private function moveSelected(xDelta:int, yDelta:int) : void
      {
         var e:Entity = null;
         for each(e in this.SELECT_LIST)
         {
            e.x = e.x + xDelta;
            e.y = e.y + yDelta;
         }
         FP.engine.render();
         this.renderEntities();
         this.updateEntityLists(true);
      }
      
      private function startPanning() : void
      {
         this._panning = true;
         this._entRect.x = Input.mouseX;
         this._entRect.y = Input.mouseY;
      }
      
      private function updatePanning() : void
      {
         if(Input.mouseReleased)
         {
            this._panning = false;
         }
         this.panCamera(this._entRect.x - Input.mouseX,this._entRect.y - Input.mouseY);
         this._entRect.x = Input.mouseX;
         this._entRect.y = Input.mouseY;
      }
      
      private function panCamera(xDelta:int, yDelta:int) : void
      {
         FP.camera.x = FP.camera.x + xDelta;
         FP.camera.y = FP.camera.y + yDelta;
         FP.engine.render();
         this.updateEntityLists(true);
         this.renderEntities();
      }
      
      private function setCamera(x:int, y:int) : void
      {
         FP.camera.x = x;
         FP.camera.y = y;
         FP.engine.render();
         this.updateEntityLists(true);
         this.renderEntities();
      }
      
      private function startSelection() : void
      {
         this._selecting = true;
         this._entRect.x = Input.mouseFlashX;
         this._entRect.y = Input.mouseFlashY;
         this._entRect.width = 0;
         this._entRect.height = 0;
      }
      
      private function updateSelection() : void
      {
         this._entRect.width = Input.mouseFlashX - this._entRect.x;
         this._entRect.height = Input.mouseFlashY - this._entRect.y;
         if(Input.mouseReleased)
         {
            this.selectEntities(this._entRect);
            this.renderEntities();
            this._selecting = false;
            this._entSelect.graphics.clear();
         }
         else
         {
            this._entSelect.graphics.clear();
            this._entSelect.graphics.lineStyle(1,16777215);
            this._entSelect.graphics.drawRect(this._entRect.x,this._entRect.y,this._entRect.width,this._entRect.height);
         }
      }
      
      private function selectEntities(rect:Rectangle) : void
      {
         var e:Entity = null;
         if(rect.width < 0)
         {
            rect.x = rect.x - (rect.width = -rect.width);
         }
         else if(!rect.width)
         {
            rect.width = 1;
         }
         if(rect.height < 0)
         {
            rect.y = rect.y - (rect.height = -rect.height);
         }
         else if(!rect.height)
         {
            rect.height = 1;
         }
         FP.rect.width = FP.rect.height = 6;
         var sx:Number = FP.screen.scaleX * FP.screen.scale;
         var sy:Number = FP.screen.scaleY * FP.screen.scale;
         if(Input.check(Key.CONTROL))
         {
            for each(e in this.SCREEN_LIST)
            {
               if(this.SELECT_LIST.indexOf(e) < 0)
               {
                  FP.rect.x = (e.x - FP.camera.x) * sx - 3;
                  FP.rect.y = (e.y - FP.camera.y) * sy - 3;
                  if(rect.intersects(FP.rect))
                  {
                     this.SELECT_LIST.push(e);
                  }
               }
            }
         }
         else
         {
            this.SELECT_LIST.length = 0;
            for each(e in this.SCREEN_LIST)
            {
               FP.rect.x = (e.x - FP.camera.x) * sx - 3;
               FP.rect.y = (e.y - FP.camera.y) * sy - 3;
               if(rect.intersects(FP.rect))
               {
                  this.SELECT_LIST.push(e);
               }
            }
         }
      }
      
      private function selectAll() : void
      {
         var e:Entity = null;
         this.SELECT_LIST.length = 0;
         for each(e in this.SCREEN_LIST)
         {
            this.SELECT_LIST.push(e);
         }
         this.renderEntities();
      }
      
      private function startScrolling() : void
      {
         if(this.LOG.length > this._logLines)
         {
            this._scrolling = this._logBarGlobal.contains(Input.mouseFlashX,Input.mouseFlashY);
         }
      }
      
      private function updateScrolling() : void
      {
         this._scrolling = Input.mouseDown;
         this._logScroll = FP.scaleClamp(Input.mouseFlashY,this._logBarGlobal.y,this._logBarGlobal.bottom,0,1);
         this.updateLog();
      }
      
      private function updateKeyMoving() : void
      {
         FP.point.x = (!!Input.pressed(Key.RIGHT)?1:0) - (!!Input.pressed(Key.LEFT)?1:0);
         FP.point.y = (!!Input.pressed(Key.DOWN)?1:0) - (!!Input.pressed(Key.UP)?1:0);
         if(FP.point.x != 0 || FP.point.y != 0)
         {
            this.moveSelected(FP.point.x,FP.point.y);
         }
      }
      
      private function updateKeyPanning() : void
      {
         FP.point.x = (!!Input.check(Key.RIGHT)?1:0) - (!!Input.check(Key.LEFT)?1:0);
         FP.point.y = (!!Input.check(Key.DOWN)?1:0) - (!!Input.check(Key.UP)?1:0);
         if(FP.point.x != 0 || FP.point.y != 0)
         {
            this.panCamera(FP.point.x,FP.point.y);
         }
      }
      
      private function updateEntityLists(fetchList:Boolean = true) : void
      {
         var e:Entity = null;
         if(fetchList)
         {
            this.ENTITY_LIST.length = 0;
            FP.world.getAll(this.ENTITY_LIST);
         }
         this.SCREEN_LIST.length = 0;
         for each(e in this.ENTITY_LIST)
         {
            if(e.collideRect(e.x,e.y,FP.camera.x,FP.camera.y,FP.width,FP.height))
            {
               this.SCREEN_LIST.push(e);
            }
         }
      }
      
      private function renderEntities() : void
      {
         var g:Graphics = null;
         var sx:Number = NaN;
         var sy:Number = NaN;
         var e:Entity = null;
         this._entScreen.visible = this._debug;
         if(this._debug)
         {
            g = this._entScreen.graphics;
            sx = FP.screen.scaleX * FP.screen.scale;
            sy = FP.screen.scaleY * FP.screen.scale;
            g.clear();
            for each(e in this.SCREEN_LIST)
            {
               if(this.SELECT_LIST.indexOf(e) < 0)
               {
                  if(e.width && e.height)
                  {
                     g.lineStyle(1,16711680);
                     g.drawRect((e.x - e.originX - FP.camera.x) * sx,(e.y - e.originY - FP.camera.y) * sy,e.width * sx,e.height * sy);
                     if(e.mask)
                     {
                        e.mask.renderDebug(g);
                     }
                  }
                  g.lineStyle(1,65280);
                  g.drawRect((e.x - FP.camera.x) * sx - 3,(e.y - FP.camera.y) * sy - 3,6,6);
               }
               else
               {
                  if(e.width && e.height)
                  {
                     g.lineStyle(1,16777215);
                     g.drawRect((e.x - e.originX - FP.camera.x) * sx,(e.y - e.originY - FP.camera.y) * sy,e.width * sx,e.height * sy);
                     if(e.mask)
                     {
                        e.mask.renderDebug(g);
                     }
                  }
                  g.lineStyle(1,16777215);
                  g.drawRect((e.x - FP.camera.x) * sx - 3,(e.y - FP.camera.y) * sy - 3,6,6);
               }
            }
         }
      }
      
      private function updateLog() : void
      {
         var y:uint = 0;
         var i:int = 0;
         var n:int = 0;
         var s:String = null;
         if(this._paused)
         {
            this._logRead.y = 40;
            this._logRead.graphics.clear();
            this._logRead.graphics.beginFill(0,0.75);
            this._logRead.graphics.drawRoundRectComplex(0,0,this._logReadText0.width,20,0,20,0,0);
            this._logRead.graphics.drawRect(0,20,this.width,this._logHeight);
            this._logRead.graphics.beginFill(2105376,1);
            this._logRead.graphics.drawRoundRectComplex(this._logBar.x,this._logBar.y,this._logBar.width,this._logBar.height,8,8,8,8);
            if(this.LOG.length > this._logLines)
            {
               this._logRead.graphics.beginFill(16777215,1);
               y = this._logBar.y + 2 + (this._logBar.height - 16) * this._logScroll;
               this._logRead.graphics.drawRoundRectComplex(this._logBar.x + 2,y,12,12,6,6,6,6);
            }
            if(this.LOG.length)
            {
               i = this.LOG.length > this._logLines?int(Math.round((this.LOG.length - this._logLines) * this._logScroll)):int(0);
               n = i + Math.min(this._logLines,this.LOG.length);
               for(s = ""; i < n; )
               {
                  s = s + (this.LOG[i++] + "\n");
               }
               this._logReadText1.text = s;
            }
            else
            {
               this._logReadText1.text = "";
            }
            this._logReadText1.height = this._logHeight;
            this._logReadText1.x = 32;
            this._logReadText1.y = 24;
            this._fpsReadText.selectable = true;
            this._fpsInfoText0.selectable = true;
            this._fpsInfoText1.selectable = true;
            this._memReadText.selectable = true;
            this._entReadText.selectable = true;
            this._debReadText1.selectable = true;
         }
         else
         {
            this._logRead.y = this.height - 40;
            this._logReadText1.height = 20;
            this._logRead.graphics.clear();
            this._logRead.graphics.beginFill(0,0.75);
            this._logRead.graphics.drawRoundRectComplex(0,0,this._logReadText0.width,20,0,20,0,0);
            this._logRead.graphics.drawRect(0,20,this.width,20);
            this._logReadText1.text = Boolean(this.LOG.length)?this.LOG[this.LOG.length - 1]:"";
            this._logReadText1.x = 2;
            this._logReadText1.y = 21;
            this._logReadText1.selectable = false;
            this._fpsReadText.selectable = false;
            this._fpsInfoText0.selectable = false;
            this._fpsInfoText1.selectable = false;
            this._memReadText.selectable = false;
            this._entReadText.selectable = false;
            this._debReadText0.selectable = false;
            this._debReadText1.selectable = false;
         }
      }
      
      private function updateFPSRead() : void
      {
         this._fpsReadText.text = "FPS: " + FP.frameRate.toFixed();
         this._fpsInfoText0.text = "Update: " + String(FP._updateTime) + "ms\n" + "Render: " + String(FP._renderTime) + "ms";
         this._fpsInfoText1.text = "Game: " + String(FP._gameTime) + "ms\n" + "Flash: " + String(FP._flashTime) + "ms";
         this._memReadText.text = "MEM: " + Number(System.totalMemory / 1024 / 1024).toFixed(2) + "MB";
      }
      
      private function updateDebugRead() : void
      {
         var e:Entity = null;
         var i:String = null;
         var big:Boolean = this.width >= 480;
         var s:String = "Mouse: " + String(FP.world.mouseX) + ", " + String(FP.world.mouseY) + "\nCamera: " + String(FP.camera.x) + ", " + String(FP.camera.y);
         if(this.SELECT_LIST.length)
         {
            if(this.SELECT_LIST.length > 1)
            {
               s = s + ("\n\nSelected: " + String(this.SELECT_LIST.length));
            }
            else
            {
               e = this.SELECT_LIST[0];
               s = s + ("\n\n- " + String(e) + " -\n");
               for each(i in this.WATCH_LIST)
               {
                  if(e.hasOwnProperty(i))
                  {
                     s = s + ("\n" + i + ": " + e[i]);
                  }
               }
            }
         }
         this._debReadText1.text = s;
         this._debReadText1.setTextFormat(this.format(!!big?uint(16):uint(8)));
         this._debReadText1.width = Math.max(this._debReadText1.textWidth + 4,this._debReadText0.width);
         this._debReadText1.height = this._debReadText1.y + this._debReadText1.textHeight + 4;
         this._debRead.y = int(this.height - this._debReadText1.height);
         this._debRead.graphics.clear();
         this._debRead.graphics.beginFill(0,0.75);
         this._debRead.graphics.drawRoundRectComplex(0,0,this._debReadText0.width,20,0,20,0,0);
         this._debRead.graphics.drawRoundRectComplex(0,20,this._debReadText1.width + 20,this.height - this._debRead.y - 20,0,20,0,0);
      }
      
      private function updateEntityCount() : void
      {
         this._entReadText.text = String(FP.world.count) + " Entities";
      }
      
      private function updateButtons() : void
      {
         this._butRead.x = this._fpsInfo.x + this._fpsInfo.width + int((this._entRead.x - (this._fpsInfo.x + this._fpsInfo.width)) / 2) - 30;
         this._butDebug.visible = !this._debug;
         this._butOutput.visible = this._debug;
         this._butPlay.visible = FP.engine.paused;
         this._butPause.visible = !FP.engine.paused;
         if(this._butDebug.bitmapData.rect.contains(this._butDebug.mouseX,this._butDebug.mouseY))
         {
            this._butDebug.alpha = this._butOutput.alpha = 1;
            if(Input.mousePressed)
            {
               this.debug = !this._debug;
            }
         }
         else
         {
            this._butDebug.alpha = this._butOutput.alpha = 0.5;
         }
         if(this._butPlay.bitmapData.rect.contains(this._butPlay.mouseX,this._butPlay.mouseY))
         {
            this._butPlay.alpha = this._butPause.alpha = 1;
            if(Input.mousePressed)
            {
               FP.engine.paused = !FP.engine.paused;
               this.renderEntities();
            }
         }
         else
         {
            this._butPlay.alpha = this._butPause.alpha = 0.5;
         }
         if(this._butStep.bitmapData.rect.contains(this._butStep.mouseX,this._butStep.mouseY))
         {
            this._butStep.alpha = 1;
            if(Input.mousePressed)
            {
               this.stepFrame();
            }
         }
         else
         {
            this._butStep.alpha = 0.5;
         }
      }
      
      private function format(size:uint = 16, color:uint = 16777215, align:String = "left") : TextFormat
      {
         this._format.size = size;
         this._format.color = color;
         this._format.align = align;
         return this._format;
      }
      
      private function get width() : uint
      {
         return FP.width * FP.screen.scaleX * FP.screen.scale;
      }
      
      private function get height() : uint
      {
         return FP.height * FP.screen.scaleY * FP.screen.scale;
      }
   }
}
