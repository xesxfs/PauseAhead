package net.flashpunk.graphics
{
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.display.BitmapData;
   import net.flashpunk.FP;
   import flash.text.TextField;
   
   public class Text extends Image
   {
      
      public static var font:String = "default";
      
      public static var size:uint = 16;
      
      public static var align:String = "left";
      
      public static var defaultLeading:Number = 0;
      
      public static var wordWrap:Boolean = false;
      
      public static var resizable:Boolean = true;
      
      private static var _styleIndices:Vector.<int> = new Vector.<int>();
      
      private static var _styleMatched:Array = new Array();
      
      private static var _styleFormats:Vector.<TextFormat> = new Vector.<TextFormat>();
      
      private static var _styleFrom:Vector.<int> = new Vector.<int>();
      
      private static var _styleTo:Vector.<int> = new Vector.<int>();
      
      private static var _FONT_DEFAULT:Class = Text__FONT_DEFAULT;
       
      
      public var resizable:Boolean;
      
      protected var _styles:Object;
      
      protected var _field:TextField;
      
      protected var _width:uint;
      
      protected var _height:uint;
      
      protected var _textWidth:uint;
      
      protected var _textHeight:uint;
      
      protected var _form:TextFormat;
      
      protected var _text:String;
      
      protected var _richText:String;
      
      protected var _font:String;
      
      protected var _size:uint;
      
      protected var _align:String;
      
      protected var _leading:Number;
      
      protected var _wordWrap:Boolean;
      
      public function Text(text:String, x:Number = 0, y:Number = 0, options:Object = null, h:Number = 0)
      {
         var property:* = null;
         this._styles = new Object();
         this._field = new TextField();
         this._font = Text.font;
         this._size = Text.size;
         this._align = Text.align;
         this._leading = Text.defaultLeading;
         this._wordWrap = Text.wordWrap;
         this.resizable = Text.resizable;
         var width:uint = 0;
         var height:uint = h;
         if(options)
         {
            if(options is Number)
            {
               width = Number(options);
               options = null;
            }
            else
            {
               if(options.hasOwnProperty("font"))
               {
                  this._font = options.font;
               }
               if(options.hasOwnProperty("size"))
               {
                  this._size = options.size;
               }
               if(options.hasOwnProperty("align"))
               {
                  this._align = options.align;
               }
               if(options.hasOwnProperty("wordWrap"))
               {
                  this._wordWrap = options.wordWrap;
               }
               if(options.hasOwnProperty("resizable"))
               {
                  this.resizable = options.resizable;
               }
               if(options.hasOwnProperty("width"))
               {
                  width = options.width;
               }
               if(options.hasOwnProperty("height"))
               {
                  height = options.height;
               }
            }
         }
         this._field.embedFonts = true;
         this._field.wordWrap = this._wordWrap;
         this._form = new TextFormat(this._font,this._size,16777215);
         this._form.align = this._align;
         this._form.leading = this._leading;
         this._field.defaultTextFormat = this._form;
         this._field.text = this._text = text;
         this._width = uint(width) || uint(this._field.textWidth + 4);
         this._height = uint(height) || uint(this._field.textHeight + 4);
         _source = new BitmapData(this._width,this._height,true,0);
         super(_source);
         this.updateTextBuffer();
         this.x = x;
         this.y = y;
         if(options)
         {
            for(property in options)
            {
               if(hasOwnProperty(property))
               {
                  this[property] = options[property];
                  continue;
               }
               throw new Error("\"" + property + "\" is not a property of Text");
            }
         }
      }
      
      public function setStyle(tagName:String, params:*) : void
      {
         var format:TextFormat = null;
         var key:* = null;
         if(params is TextFormat || !params)
         {
            format = params;
         }
         else
         {
            format = new TextFormat();
            for(key in params)
            {
               if(format.hasOwnProperty(key))
               {
                  format[key] = params[key];
                  continue;
               }
               throw new Error("\"" + key + "\" is not a TextFormat property");
            }
         }
         this._styles[tagName] = format;
         if(this._richText)
         {
            this.updateTextBuffer();
         }
      }
      
      private function matchStyles() : void
      {
         var i:int = 0;
         var j:int = 0;
         var substring:String = null;
         var tagLength:int = 0;
         var tagName:String = null;
         var endTagString:String = null;
         var start:int = 0;
         var end:int = 0;
         var fragments:Array = this._richText.split("<");
         _styleIndices.length = 0;
         _styleMatched.length = 0;
         _styleFormats.length = 0;
         _styleFrom.length = 0;
         _styleTo.length = 0;
         for(i = 1; i < fragments.length; i++)
         {
            if(!_styleMatched[i])
            {
               substring = fragments[i];
               tagLength = substring.indexOf(">");
               if(tagLength > 0)
               {
                  tagName = substring.substr(0,tagLength);
                  if(this._styles[tagName])
                  {
                     fragments[i] = substring.slice(tagLength + 1);
                     endTagString = "/" + tagName + ">";
                     for(j = i + 1; j < fragments.length; j++)
                     {
                        if(fragments[j].substr(0,tagLength + 2) == endTagString)
                        {
                           fragments[j] = fragments[j].slice(tagLength + 2);
                           _styleMatched[j] = true;
                           break;
                        }
                     }
                     _styleFormats.push(this._styles[tagName]);
                     _styleFrom.push(i);
                     _styleTo.push(j);
                     continue;
                  }
               }
               fragments[i - 1] = fragments[i - 1].concat("<");
            }
         }
         _styleIndices[0] = 0;
         j = 0;
         for(i = 0; i < fragments.length; i++)
         {
            j = j + fragments[i].length;
            _styleIndices[i + 1] = j;
         }
         this._field.text = this._text = fragments.join("");
         this._field.setTextFormat(this._form);
         for(i = 0; i < _styleFormats.length; i++)
         {
            start = _styleIndices[_styleFrom[i]];
            end = _styleIndices[_styleTo[i]];
            if(start != end)
            {
               this._field.setTextFormat(_styleFormats[i],start,end);
            }
         }
      }
      
      override protected function updateColorTransform() : void
      {
         if(this._richText)
         {
            if(_alpha == 1)
            {
               _tint = null;
            }
            else
            {
               _tint = _colorTransform;
               _tint.redMultiplier = 1;
               _tint.greenMultiplier = 1;
               _tint.blueMultiplier = 1;
               _tint.redOffset = 0;
               _tint.greenOffset = 0;
               _tint.blueOffset = 0;
               _tint.alphaMultiplier = _alpha;
            }
            if(this._form.color != _color)
            {
               this.updateTextBuffer();
            }
            else
            {
               updateBuffer();
            }
            return;
         }
         super.updateColorTransform();
      }
      
      public function updateTextBuffer() : void
      {
         var i:int = 0;
         var tlm:TextLineMetrics = null;
         var remainder:Number = NaN;
         if(this._richText)
         {
            this._form.color = _color;
            this.matchStyles();
         }
         else
         {
            this._form.color = 16777215;
            this._field.setTextFormat(this._form);
         }
         this._field.width = this._width;
         this._textWidth = this._field.textWidth + 4;
         this._textHeight = this._field.textHeight + 4;
         if(this.resizable && (this._textWidth > this._width || this._textHeight > this._height))
         {
            if(this._width < this._textWidth)
            {
               this._width = this._textWidth;
            }
            if(this._height < this._textHeight)
            {
               this._height = this._textHeight;
            }
         }
         if(this._width > _source.width || this._height > _source.height)
         {
            _source = new BitmapData(Math.max(this._width,_source.width),Math.max(this._height,_source.height),true,0);
            _sourceRect = _source.rect;
            createBuffer();
         }
         else
         {
            _source.fillRect(_sourceRect,0);
         }
         this._field.width = this._width;
         this._field.height = this._height;
         var offsetRequired:Boolean = false;
         for(i = 0; i < this._field.numLines; i++)
         {
            tlm = this._field.getLineMetrics(i);
            remainder = tlm.x % 1;
            if(remainder > 0.1 && remainder < 0.9)
            {
               offsetRequired = true;
               break;
            }
         }
         if(offsetRequired)
         {
            for(i = 0; i < this._field.numLines; i++)
            {
               tlm = this._field.getLineMetrics(i);
               remainder = tlm.x % 1;
               this._field.x = -remainder;
               FP.rect.x = 0;
               FP.rect.y = 2 + tlm.height * i;
               FP.rect.width = this._width;
               FP.rect.height = tlm.height;
               _source.draw(this._field,this._field.transform.matrix,null,null,FP.rect);
            }
         }
         else
         {
            _source.draw(this._field);
         }
         super.updateBuffer();
      }
      
      override public function centerOrigin() : void
      {
         originX = this._width / 2;
         originY = this._height / 2;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(value:String) : void
      {
         if(this._text == value && !this._richText)
         {
            return;
         }
         this._field.text = this._text = value;
         if(this._richText)
         {
            this._richText = null;
            super.updateColorTransform();
         }
         this.updateTextBuffer();
      }
      
      public function get richText() : String
      {
         return this._richText || this._text;
      }
      
      public function set richText(value:String) : void
      {
         if(this._richText == value)
         {
            return;
         }
         var fromPlain:Boolean = !this._richText;
         this._richText = value;
         if(this._richText == "")
         {
            this._text = "";
            this._field.text = "";
         }
         if(fromPlain && this._richText)
         {
            this._form.color = 4294967295;
            this.updateColorTransform();
         }
         else
         {
            this.updateTextBuffer();
         }
      }
      
      public function get font() : String
      {
         return this._font;
      }
      
      public function set font(value:String) : void
      {
         if(this._font == value)
         {
            return;
         }
         this._form.font = this._font = value;
         this.updateTextBuffer();
      }
      
      public function get size() : uint
      {
         return this._size;
      }
      
      public function set size(value:uint) : void
      {
         if(this._size == value)
         {
            return;
         }
         this._form.size = this._size = value;
         this.updateTextBuffer();
      }
      
      public function get align() : String
      {
         return this._align;
      }
      
      public function set align(value:String) : void
      {
         if(this._align == value)
         {
            return;
         }
         this._form.align = this._align = value;
         this.updateTextBuffer();
      }
      
      public function get leading() : Number
      {
         return this._leading;
      }
      
      public function set leading(value:Number) : void
      {
         if(this._leading == value)
         {
            return;
         }
         this._form.leading = this._leading = value;
         this.updateTextBuffer();
      }
      
      public function get wordWrap() : Boolean
      {
         return this._wordWrap;
      }
      
      public function set wordWrap(value:Boolean) : void
      {
         if(this._wordWrap == value)
         {
            return;
         }
         this._field.wordWrap = this._wordWrap = value;
         this.updateTextBuffer();
      }
      
      override public function get width() : uint
      {
         return this._width;
      }
      
      public function set width(value:uint) : void
      {
         if(this._width == value)
         {
            return;
         }
         this._width = value;
         this.updateTextBuffer();
      }
      
      override public function get height() : uint
      {
         return this._height;
      }
      
      public function set height(value:uint) : void
      {
         if(this._height == value)
         {
            return;
         }
         this._height = value;
         this.updateTextBuffer();
      }
      
      override public function get scaledWidth() : uint
      {
         return this._width * scaleX * scale;
      }
      
      override public function get scaledHeight() : uint
      {
         return this._height * scaleY * scale;
      }
      
      public function get textWidth() : uint
      {
         return this._textWidth;
      }
      
      public function get textHeight() : uint
      {
         return this._textHeight;
      }
   }
}
