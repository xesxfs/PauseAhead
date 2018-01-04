package
{
   import mx.core.MovieClipLoaderAsset;
   import flash.utils.ByteArray;
   
   public class Preloader_ImgPlayer extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function Preloader_ImgPlayer()
      {
         this.dataClass = Preloader_ImgPlayer_dataClass;
         super();
         initialWidth = 1240 / 20;
         initialHeight = 1240 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
