package com.adultswim.highscores
{
   import flash.net.URLVariables;
   import flash.net.URLRequest;
   import flash.external.ExternalInterface;
   import flash.net.navigateToURL;
   
   public class ASHighScores
   {
      
      protected static var highscoreId:String = "0";
      
      protected static var debug:Boolean = false;
       
      
      public function ASHighScores()
      {
         super();
      }
      
      public static function init(gameHighscoreID:String, debugMode:Boolean = false) : void
      {
         highscoreId = gameHighscoreID;
         debug = debugMode;
      }
      
      public static function submitScore(score:int, window:String = "_self") : void
      {
         var strURI:String = null;
         var nTimestamp:Number = NaN;
         var sTimestamp:String = null;
         var strN1:String = null;
         var strN2:String = null;
         var n1:Number = NaN;
         var n2:Number = NaN;
         var var2:Number = NaN;
         var strToPass:String = null;
         var md5:MD5 = null;
         var variables:URLVariables = null;
         var request:URLRequest = null;
         if(ExternalInterface.available)
         {
            if(ASHighScores.highscoreId == null || ASHighScores.highscoreId == "0")
            {
               if(debug)
               {
                  ExternalInterface.call("console.log","ASHighscores:: Your Game ID (" + ASHighScores.highscoreId + ") is invalid");
               }
               throw new Error("ASHighscores - You must initilize the highscores system before submitting a score.  ASHighscores.init(myGameHighscoreID)");
            }
            strURI = ExternalInterface.call("getLittleServer");
            if(strURI == null || strURI == "")
            {
               if(debug)
               {
                  ExternalInterface.call("console.log","ASHighscores::Cannot find javascript method \'getLittleServer\'.  Include as-highscores-api-test.js in your container html file");
               }
               throw new Error("Cannot find javascript method \'getLittleServer\'.  Include as-highscores-api-test.js in your container html file");
            }
            nTimestamp = ExternalInterface.call("getSrvrTime");
            sTimestamp = nTimestamp.toString();
            strN1 = sTimestamp.substr(-3,3);
            strN2 = sTimestamp.substr(-4,3);
            n1 = parseInt(strN1);
            n2 = parseInt(strN2);
            var2 = n1 * n2 * score + score;
            strToPass = highscoreId + "," + score + "," + sTimestamp + "," + var2;
            md5 = new MD5(strToPass);
            variables = new URLVariables();
            variables.attr1 = "score=" + score + "|gameId=" + highscoreId + "|timestamp=" + sTimestamp + "|key=" + md5._hash;
            request = new URLRequest(strURI);
            request.data = variables;
            if(debug)
            {
               ExternalInterface.call("console.log","ASHighscores::Submitting High score, attempting to open in window " + window);
            }
            navigateToURL(request,window);
            return;
         }
         throw new Error("ASHighscores::submitScore - You must be running the game in a browser to submit a high score");
      }
   }
}
