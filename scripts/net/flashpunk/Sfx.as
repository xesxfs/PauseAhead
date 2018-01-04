package net.flashpunk
{
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class Sfx
   {
      
      private static var _sounds:Dictionary = new Dictionary();
      
      private static var _typePlaying:Dictionary = new Dictionary();
      
      private static var _typeTransforms:Dictionary = new Dictionary();
       
      
      public var complete:Function;
      
      private var _type:String;
      
      private var _vol:Number = 1;
      
      private var _pan:Number = 0;
      
      private var _filteredVol:Number;
      
      private var _filteredPan:Number;
      
      private var _sound:Sound;
      
      private var _channel:SoundChannel;
      
      private var _transform:SoundTransform;
      
      private var _position:Number = 0;
      
      private var _looping:Boolean;
      
      public function Sfx(source:*, complete:Function = null, type:String = null)
      {
         this._transform = new SoundTransform();
         super();
         this._type = type;
         if(source is Class)
         {
            this._sound = _sounds[source];
            if(!this._sound)
            {
               this._sound = _sounds[source] = new source();
            }
         }
         else if(source is Sound)
         {
            this._sound = source;
         }
         else
         {
            throw new Error("Sfx source needs to be of type Class or Sound");
         }
         this.complete = complete;
      }
      
      public static function getPan(type:String) : Number
      {
         var transform:SoundTransform = _typeTransforms[type];
         return Boolean(transform)?Number(transform.pan):Number(0);
      }
      
      public static function getVolume(type:String) : Number
      {
         var transform:SoundTransform = _typeTransforms[type];
         return Boolean(transform)?Number(transform.volume):Number(1);
      }
      
      public static function setPan(type:String, pan:Number) : void
      {
         var sfx:Sfx = null;
         var transform:SoundTransform = _typeTransforms[type];
         if(!transform)
         {
            transform = _typeTransforms[type] = new SoundTransform();
         }
         transform.pan = FP.clamp(pan,-1,1);
         for each(sfx in _typePlaying[type])
         {
            sfx.pan = sfx.pan;
         }
      }
      
      public static function setVolume(type:String, volume:Number) : void
      {
         var sfx:Sfx = null;
         var transform:SoundTransform = _typeTransforms[type];
         if(!transform)
         {
            transform = _typeTransforms[type] = new SoundTransform();
         }
         transform.volume = volume < 0?Number(0):Number(volume);
         for each(sfx in _typePlaying[type])
         {
            sfx.volume = sfx.volume;
         }
      }
      
      public function play(vol:Number = 1, pan:Number = 0) : void
      {
         if(this._channel)
         {
            this.stop();
         }
         this._pan = FP.clamp(pan,-1,1);
         this._vol = vol < 0?Number(0):Number(vol);
         this._filteredPan = FP.clamp(this._pan + getPan(this._type),-1,1);
         this._filteredVol = Math.max(0,this._vol * getVolume(this._type));
         this._transform.pan = this._filteredPan;
         this._transform.volume = this._filteredVol;
         this._channel = this._sound.play(0,0,this._transform);
         if(this._channel)
         {
            this.addPlaying();
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.onComplete);
         }
         this._looping = false;
         this._position = 0;
      }
      
      public function loop(vol:Number = 1, pan:Number = 0) : void
      {
         this.play(vol,pan);
         this._looping = true;
      }
      
      public function stop() : Boolean
      {
         if(!this._channel)
         {
            return false;
         }
         this.removePlaying();
         this._position = this._channel.position;
         this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onComplete);
         this._channel.stop();
         this._channel = null;
         return true;
      }
      
      public function setPos(apos:Number = 0) : void
      {
         this.stop();
         this._position = apos * 1000;
         this.resume();
      }
      
      public function resume() : void
      {
         this._channel = this._sound.play(this._position,0,this._transform);
         if(this._channel)
         {
            this.addPlaying();
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.onComplete);
         }
         this._position = 0;
      }
      
      private function onComplete(e:Event = null) : void
      {
         if(this._looping)
         {
            this.loop(this._vol,this._pan);
         }
         else
         {
            this.stop();
         }
         this._position = 0;
         if(this.complete != null)
         {
            this.complete();
         }
      }
      
      private function addPlaying() : void
      {
         if(!_typePlaying[this._type])
         {
            _typePlaying[this._type] = new Dictionary();
         }
         _typePlaying[this._type][this] = this;
      }
      
      private function removePlaying() : void
      {
         if(_typePlaying[this._type])
         {
            delete _typePlaying[this._type][this];
         }
      }
      
      public function get volume() : Number
      {
         return this._vol;
      }
      
      public function set volume(value:Number) : void
      {
         if(!this._channel)
         {
            return;
         }
         if(value < 0)
         {
            value = 0;
         }
         var filteredVol:Number = value * getVolume(this._type);
         if(filteredVol < 0)
         {
            filteredVol = 0;
         }
         if(this._filteredVol === filteredVol)
         {
            return;
         }
         this._vol = value;
         this._filteredVol = this._transform.volume = filteredVol;
         this._channel.soundTransform = this._transform;
      }
      
      public function get pan() : Number
      {
         return this._pan;
      }
      
      public function set pan(value:Number) : void
      {
         if(!this._channel)
         {
            return;
         }
         value = FP.clamp(value,-1,1);
         var filteredPan:Number = FP.clamp(value + getPan(this._type),-1,1);
         if(this._filteredPan === filteredPan)
         {
            return;
         }
         this._pan = value;
         this._filteredPan = this._transform.pan = filteredPan;
         this._channel.soundTransform = this._transform;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(value:String) : void
      {
         if(this._type == value)
         {
            return;
         }
         if(this._channel)
         {
            this.removePlaying();
            this._type = value;
            this.addPlaying();
            this.pan = this.pan;
            this.volume = this.volume;
         }
         else
         {
            this._type = value;
         }
      }
      
      public function get playing() : Boolean
      {
         return this._channel != null;
      }
      
      public function get position() : Number
      {
         return (Boolean(this._channel)?this._channel.position:this._position) / 1000;
      }
      
      public function get length() : Number
      {
         return this._sound.length / 1000;
      }
   }
}
