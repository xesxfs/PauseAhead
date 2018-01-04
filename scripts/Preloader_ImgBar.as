package
{
   import mx.core.MovieClipLoaderAsset;
   import flash.utils.ByteArray;
   
   public class Preloader_ImgBar extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function Preloader_ImgBar()
      {
         this.dataClass = Preloader_ImgBar_dataClass;
         super();
         initialWidth = 400 / 20;
         initialHeight = 400 / 20;
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
