package net.flashpunk.utils
{
   import net.flashpunk.FP;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   
   public class Input
   {
      
      public static var keyString:String = "";
      
      public static var lastKey:int;
      
      public static var mouseCursor:String;
      
      public static var mouseDown:Boolean = false;
      
      public static var mouseUp:Boolean = true;
      
      public static var mousePressed:Boolean = false;
      
      public static var mouseReleased:Boolean = false;
      
      public static var mouseWheel:Boolean = false;
      
      private static const KEYSTRING_MAX:uint = 100;
      
      private static var _enabled:Boolean = false;
      
      private static var _key:Vector.<Boolean> = new Vector.<Boolean>(256);
      
      private static var _keyNum:int = 0;
      
      private static var _press:Vector.<int> = new Vector.<int>(256);
      
      private static var _release:Vector.<int> = new Vector.<int>(256);
      
      private static var _pressNum:int = 0;
      
      private static var _releaseNum:int = 0;
      
      private static var _control:Object = {};
      
      private static var _mouseWheelDelta:int = 0;
      
      private static var _mouseVisible:Boolean = true;
       
      
      public function Input()
      {
         super();
      }
      
      public static function get mouseWheelDelta() : int
      {
         if(mouseWheel)
         {
            mouseWheel = false;
            return _mouseWheelDelta;
         }
         return 0;
      }
      
      public static function get mouseX() : int
      {
         return FP.screen.mouseX;
      }
      
      public static function get mouseY() : int
      {
         return FP.screen.mouseY;
      }
      
      public static function get mouseFlashX() : int
      {
         return FP.stage.mouseX;
      }
      
      public static function get mouseFlashY() : int
      {
         return FP.stage.mouseY;
      }
      
      public static function define(name:String, ... keys) : void
      {
         _control[name] = Vector.<int>(keys);
      }
      
      public static function check(input:*) : Boolean
      {
         var v:Vector.<int> = null;
         var i:int = 0;
         if(input is String)
         {
            if(!_control[input])
            {
               return false;
            }
            v = _control[input];
            i = v.length;
            while(i--)
            {
               if(v[i] < 0)
               {
                  if(_keyNum > 0)
                  {
                     return true;
                  }
               }
               else if(_key[v[i]])
               {
                  return true;
               }
            }
            return false;
         }
         return input < 0?Boolean(_keyNum > 0):Boolean(_key[input]);
      }
      
      public static function pressed(input:*) : Boolean
      {
         var v:Vector.<int> = null;
         var i:int = 0;
         if(input is String)
         {
            if(!_control[input])
            {
               return false;
            }
            v = _control[input];
            i = v.length;
            while(i--)
            {
               if(v[i] < 0?Boolean(_pressNum):Boolean(_press.indexOf(v[i]) >= 0))
               {
                  return true;
               }
            }
            return false;
         }
         return input < 0?Boolean(_pressNum):Boolean(_press.indexOf(input) >= 0);
      }
      
      public static function released(input:*) : Boolean
      {
         var v:Vector.<int> = null;
         var i:int = 0;
         if(input is String)
         {
            if(!_control[input])
            {
               return false;
            }
            v = _control[input];
            i = v.length;
            while(i--)
            {
               if(v[i] < 0?Boolean(_releaseNum):Boolean(_release.indexOf(v[i]) >= 0))
               {
                  return true;
               }
            }
            return false;
         }
         return input < 0?Boolean(_releaseNum):Boolean(_release.indexOf(input) >= 0);
      }
      
      public static function keys(name:String) : Vector.<int>
      {
         return _control[name] as Vector.<int>;
      }
      
      public static function enable() : void
      {
         if(!_enabled && FP.stage)
         {
            FP.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
            FP.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
            FP.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
            FP.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
            FP.stage.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
            FP.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
            _enabled = true;
         }
      }
      
      public static function update() : void
      {
         while(true)
         {
            if(!_pressNum--)
            {
               break;
            }
            _press[_pressNum] = -1;
         }
         _pressNum = 0;
         while(true)
         {
            if(!_releaseNum--)
            {
               break;
            }
            _release[_releaseNum] = -1;
         }
         _releaseNum = 0;
         if(mousePressed)
         {
            mousePressed = false;
         }
         if(mouseReleased)
         {
            mouseReleased = false;
         }
         if(mouseCursor)
         {
            if(mouseCursor == "hide")
            {
               if(_mouseVisible)
               {
                  Mouse.hide();
               }
               _mouseVisible = false;
            }
            else
            {
               if(!_mouseVisible)
               {
                  Mouse.show();
               }
               if(Mouse.cursor != mouseCursor)
               {
                  Mouse.cursor = mouseCursor;
               }
               _mouseVisible = true;
            }
         }
      }
      
      public static function clear() : void
      {
         _press.length = _pressNum = 0;
         _release.length = _releaseNum = 0;
         for(var i:int = _key.length; i--; )
         {
            _key[i] = false;
         }
         _keyNum = 0;
      }
      
      private static function onKeyDown(e:KeyboardEvent = null) : void
      {
         var code:int = lastKey = e.keyCode;
         if(code == Key.BACKSPACE)
         {
            keyString = keyString.substring(0,keyString.length - 1);
         }
         else if(e.charCode > 31 && e.charCode != 127)
         {
            if(keyString.length > KEYSTRING_MAX)
            {
               keyString = keyString.substring(1);
            }
            keyString = keyString + String.fromCharCode(e.charCode);
         }
         if(code < 0 || code > 255)
         {
            return;
         }
         if(!_key[code])
         {
            _key[code] = true;
            _keyNum++;
            _press[_pressNum++] = code;
         }
      }
      
      private static function onKeyUp(e:KeyboardEvent) : void
      {
         var code:int = e.keyCode;
         if(code < 0 || code > 255)
         {
            return;
         }
         if(_key[code])
         {
            _key[code] = false;
            _keyNum--;
            _release[_releaseNum++] = code;
         }
      }
      
      private static function onMouseDown(e:MouseEvent) : void
      {
         if(!mouseDown)
         {
            mouseDown = true;
            mouseUp = false;
            mousePressed = true;
         }
      }
      
      private static function onMouseUp(e:MouseEvent) : void
      {
         mouseDown = false;
         mouseUp = true;
         mouseReleased = true;
      }
      
      private static function onMouseWheel(e:MouseEvent) : void
      {
         mouseWheel = true;
         _mouseWheelDelta = e.delta;
      }
      
      private static function onMouseMove(e:MouseEvent) : void
      {
         if(mouseCursor == "hide")
         {
            Mouse.show();
            Mouse.hide();
         }
         FP.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
      }
   }
}
