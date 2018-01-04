package
{
   import mx.core.MovieClipLoaderAsset;
   import flash.utils.ByteArray;
   
   public class Preloader_ImgBG extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function Preloader_ImgBG()
      {
         this.dataClass = Preloader_ImgBG_dataClass;
         super();
         initialWidth = 12800 / 20;
         initialHeight = 9600 / 20;
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
