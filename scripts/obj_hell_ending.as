package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Text;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
   import net.flashpunk.FP;
   
   public class obj_hell_ending extends Entity
   {
       
      
      public var i:int = 0;
      
      public var a:int = 0;
      
      public var b:int = 0;
      
      public var wait:int = 0;
      
      public var myTxt:Text;
      
      public var myStr:String = "";
      
      public var draw:Boolean = true;
      
      public var die:Boolean = false;
      
      public var timer:int = 0;
      
      public var titleStr:String = "";
      
      public var resultStr:String = "";
      
      public var pnum:String = "";
      
      public var myTitle:Text;
      
      public var fTimer:int = 0;
      
      public var second:Array;
      
      public var minute:Array;
      
      public var deaths:int = 0;
      
      public var totalsecond:int = 0;
      
      public var totalminute:int = 0;
      
      public var hellsecond:int = 0;
      
      public var hellminute:int = 0;
      
      public var helltime:int = 0;
      
      public function obj_hell_ending()
      {
         this.myTxt = new Text("");
         this.myTitle = new Text("");
         this.second = new Array();
         this.minute = new Array();
         super();
         var i:int = 0;
         for(i = 0; i < 27; i++)
         {
            this.deaths = this.deaths + global.gamedeaths[i];
         }
         var totalTime:int = 0;
         for(i = 0; i < 27; i++)
         {
            totalTime = totalTime + global.gametime[i];
         }
         this.helltime = global.gametime[26];
         this.totalminute = 0;
         this.totalsecond = 0;
         var myCounter:int = 0;
         while(totalTime > 0)
         {
            myCounter = myCounter + 1;
            totalTime = totalTime - 1;
            if(myCounter >= 60)
            {
               myCounter = 0;
               this.totalsecond = this.totalsecond + 1;
               if(this.totalsecond >= 60)
               {
                  this.totalsecond = 0;
                  this.totalminute = this.totalminute + 1;
               }
            }
         }
         var myCounter2:int = 0;
         while(this.helltime > 0)
         {
            myCounter2 = myCounter2 + 1;
            this.helltime = this.helltime - 1;
            if(myCounter2 >= 60)
            {
               myCounter2 = 0;
               this.hellsecond = this.hellsecond + 1;
               if(this.hellsecond >= 60)
               {
                  this.hellsecond = 0;
                  this.hellminute = this.hellminute + 1;
               }
            }
         }
         this.pnum = "";
         if(global.playernumber < 10)
         {
            this.pnum = this.pnum + "0";
         }
         this.pnum = this.pnum + global.playernumber;
         this.titleStr = this.titleStr + ("SUBJECT " + this.pnum + "\n");
         this.resultStr = this.resultStr + "\nStatus - Terminated";
         this.resultStr = this.resultStr + "\nCompetion Time - ";
         if(this.totalminute < 10)
         {
            this.resultStr = this.resultStr + "0";
         }
         this.resultStr = this.resultStr + (String(this.totalminute) + ":");
         if(this.totalsecond < 10)
         {
            this.resultStr = this.resultStr + "0";
         }
         this.resultStr = this.resultStr + String(this.totalsecond);
         this.resultStr = this.resultStr + "\nNihil Completion Time - ";
         if(this.hellminute < 10)
         {
            this.resultStr = this.resultStr + "0";
         }
         this.resultStr = this.resultStr + (String(this.hellminute) + ":");
         if(this.hellsecond < 10)
         {
            this.resultStr = this.resultStr + "0";
         }
         this.resultStr = this.resultStr + String(this.hellsecond);
         this.resultStr = this.resultStr + ("\nDeaths - " + String(this.deaths));
         this.resultStr = this.resultStr + "\n\n\nTo pass into that dark,\nnever having known freedom.\nNever to laugh, to learn, to love.\nIs there more tragic a fate?";
         layer = -100;
         type = "obj_hellend";
         Text.size = 26;
         Text.align = "left";
         this.myTxt.text = "";
         this.myTxt.size = 26;
         this.myTxt.align = "left";
         this.myTxt.color = 65280;
         graphic = this.myTxt;
         x = 34;
         y = 40;
         if(this.deaths < 10)
         {
            global.achievementQueue.push(11);
         }
         if(this.deaths == 0)
         {
            global.achievementQueue.push(12);
         }
         if(this.totalminute >= 60)
         {
            global.achievementQueue.push(13);
         }
         if(this.totalminute < 15)
         {
            global.achievementQueue.push(16);
         }
         if(this.totalminute < 10)
         {
            global.achievementQueue.push(17);
         }
         if(this.totalminute < 5)
         {
            global.achievementQueue.push(18);
         }
         if(this.totalminute < 5 && global.trinket_count >= 21)
         {
            global.achievementQueue.push(19);
         }
      }
      
      override public function update() : void
      {
         super.update();
         this.i = this.i + 1;
         if(this.i == 68)
         {
            this.myStr = this.myStr + "S";
         }
         if(this.i == 74)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 79)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 83)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 85)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 88)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 91)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 94)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 98)
         {
            this.myStr = this.myStr + "w";
         }
         if(this.i == 101)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 105)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 109)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 114)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 116)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 121)
         {
            this.myStr = this.myStr + ",";
         }
         if(this.i == 154)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 170)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 173)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 176)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 180)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 183)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 189)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 190)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 196)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 201)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 204)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 208)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 211)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 215)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 218)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 222)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 225)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 228)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 231)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 234)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 240)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 245)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.i == 288)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 313)
         {
            this.myStr = this.myStr + "Y";
         }
         if(this.i == 319)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 323)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 327)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 332)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 334)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 337)
         {
            this.myStr = this.myStr + "v";
         }
         if(this.i == 340)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 343)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 347)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 350)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 352)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 355)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 357)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 361)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 366)
         {
            this.myStr = this.myStr + "x";
         }
         if(this.i == 376)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 380)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 398)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 404)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 408)
         {
            this.myStr = this.myStr + "y";
         }
         if(this.i == 412)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 415)
         {
            this.myStr = this.myStr + "w";
         }
         if(this.i == 418)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 421)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 426)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 429)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 431)
         {
            this.myStr = this.myStr + "y";
         }
         if(this.i == 434)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 436)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 439)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 442)
         {
            this.myStr = this.myStr + "w";
         }
         if(this.i == 448)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 450)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 453)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 455)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 459)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 462)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 467)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 470)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 491)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 499)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 511)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 517)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 519)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 520)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 524)
         {
            this.myStr = this.myStr + "g";
         }
         if(this.i == 527)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 532)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 544)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 550)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 552)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 555)
         {
            this.myStr = this.myStr + "g";
         }
         if(this.i == 559)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 564)
         {
            this.myStr = this.myStr + "b";
         }
         if(this.i == 566)
         {
            this.myStr = this.myStr + "y";
         }
         if(this.i == 570)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 572)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 575)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 579)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 581)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 587)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 589)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 602)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 613)
         {
            this.myStr = this.myStr + ",";
         }
         if(this.i == 616)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 628)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 631)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 638)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 642)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 647)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 649)
         {
            this.myStr = this.myStr + "w";
         }
         if(this.i == 652)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 654)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 658)
         {
            this.myStr = this.myStr + "g";
         }
         if(this.i == 688)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 700)
         {
            this.myStr = this.myStr + "p";
         }
         if(this.i == 705)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 710)
         {
            this.myStr = this.myStr + "p";
         }
         if(this.i == 713)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 716)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 720)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 726)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 728)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 733)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 737)
         {
            this.myStr = this.myStr + "m";
         }
         if(this.i == 740)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 743)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 746)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 747)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 750)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 752)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 757)
         {
            this.myStr = this.myStr + "p";
         }
         if(this.i == 760)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 763)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 766)
         {
            this.myStr = this.myStr + "m";
         }
         if(this.i == 769)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 771)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 777)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 780)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 785)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.i == 805)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.i == 815)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.i == 851)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 870)
         {
            this.myStr = this.myStr + "I";
         }
         if(this.i == 876)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 880)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 882)
         {
            this.myStr = this.myStr + "m";
         }
         if(this.i == 886)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 889)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 892)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 896)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 897)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 898)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 902)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 905)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 909)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 913)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 915)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 920)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 922)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 924)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 926)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 929)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 933)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 937)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 945)
         {
            this.myStr = this.myStr + "x";
         }
         if(this.i == 950)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 953)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 958)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 962)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 966)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 969)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 973)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 985)
         {
            this.myStr = this.myStr + ",";
         }
         if(this.i == 995)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 1014)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1016)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1022)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1025)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1027)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1029)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1032)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 1035)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1040)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1042)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1047)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1050)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1054)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.i == 1069)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 1087)
         {
            this.myStr = this.myStr + "I";
         }
         if(this.i == 1094)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1099)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1101)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1104)
         {
            this.myStr = this.myStr + "v";
         }
         if(this.i == 1107)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1109)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1114)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 1116)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 1122)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1126)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 1128)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1133)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1137)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1139)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1143)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 1146)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1150)
         {
            this.myStr = this.myStr + "m";
         }
         if(this.i == 1152)
         {
            this.myStr = this.myStr + "y";
         }
         if(this.i == 1156)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1159)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 1162)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 1164)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1167)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 1173)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1177)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1179)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1181)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1188)
         {
            this.myStr = this.myStr + ",";
         }
         if(this.i == 1220)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 1240)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1243)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1245)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 1249)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1252)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 1254)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1258)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1265)
         {
            this.myStr = this.myStr + "I";
         }
         if(this.i == 1271)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1277)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1278)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1283)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1286)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1291)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1293)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1295)
         {
            this.myStr = this.myStr + "g";
         }
         if(this.i == 1299)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1302)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1304)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1309)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1311)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1313)
         {
            this.myStr = this.myStr + "v";
         }
         if(this.i == 1316)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1319)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1322)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1323)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 1329)
         {
            this.myStr = this.myStr + "p";
         }
         if(this.i == 1330)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1333)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1335)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 1339)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1342)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1346)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1347)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1352)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1355)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1358)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1359)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1362)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 1366)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1370)
         {
            this.myStr = this.myStr + "w";
         }
         if(this.i == 1372)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1376)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1378)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1382)
         {
            this.myStr = this.myStr + "d";
         }
         if(this.i == 1396)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.i == 1418)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 1433)
         {
            this.myStr = this.myStr + "I";
         }
         if(this.i == 1440)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1445)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1446)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1452)
         {
            this.myStr = this.myStr + "p";
         }
         if(this.i == 1455)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1458)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1461)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1464)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1466)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1470)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1473)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1476)
         {
            this.myStr = this.myStr + "b";
         }
         if(this.i == 1477)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1481)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 1485)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1488)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1491)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1494)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1497)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1500)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1503)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1507)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1510)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 1514)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1518)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1520)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1524)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1528)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1530)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1533)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1538)
         {
            this.myStr = this.myStr + "t";
         }
         if(this.i == 1540)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1547)
         {
            this.myStr = this.myStr + ",";
         }
         if(this.i == 1568)
         {
            this.myStr = this.myStr + "\n";
         }
         if(this.i == 1584)
         {
            this.myStr = this.myStr + "y";
         }
         if(this.i == 1586)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1589)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 1592)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1598)
         {
            this.myStr = this.myStr + "w";
         }
         if(this.i == 1601)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1606)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1609)
         {
            this.myStr = this.myStr + "l";
         }
         if(this.i == 1612)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1617)
         {
            this.myStr = this.myStr + "b";
         }
         if(this.i == 1619)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1621)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1627)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1630)
         {
            this.myStr = this.myStr + "k";
         }
         if(this.i == 1634)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1636)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 1641)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1643)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1648)
         {
            this.myStr = this.myStr + "e";
         }
         if(this.i == 1652)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1655)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1659)
         {
            this.myStr = this.myStr + "f";
         }
         if(this.i == 1662)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1669)
         {
            this.myStr = this.myStr + "y";
         }
         if(this.i == 1672)
         {
            this.myStr = this.myStr + "o";
         }
         if(this.i == 1674)
         {
            this.myStr = this.myStr + "u";
         }
         if(this.i == 1680)
         {
            this.myStr = this.myStr + "r";
         }
         if(this.i == 1683)
         {
            this.myStr = this.myStr + " ";
         }
         if(this.i == 1686)
         {
            this.myStr = this.myStr + "c";
         }
         if(this.i == 1689)
         {
            this.myStr = this.myStr + "h";
         }
         if(this.i == 1692)
         {
            this.myStr = this.myStr + "a";
         }
         if(this.i == 1695)
         {
            this.myStr = this.myStr + "i";
         }
         if(this.i == 1696)
         {
            this.myStr = this.myStr + "n";
         }
         if(this.i == 1700)
         {
            this.myStr = this.myStr + "s";
         }
         if(this.i == 1704)
         {
            this.myStr = this.myStr + ".";
         }
         if(this.die == false || this.die == true && this.myStr.length > 0)
         {
            this.myTxt.text = this.myStr;
         }
         if(this.i >= 1794 && this.die == false)
         {
            this.timer = this.timer + 1;
            if(this.timer > 40)
            {
               this.timer = 0;
               this.draw = !this.draw;
            }
            if(this.draw)
            {
               this.myTxt.text = this.myStr + "\n\n\nCONNECTION LOST.\nPRESS [SPACE] TO CONTINUE.";
            }
            if(Input.pressed(Key.SPACE))
            {
               this.die = true;
            }
         }
         if(this.die == true && this.myStr.length > 1)
         {
            this.myStr = this.myStr.substr(0,this.myStr.length - 2);
         }
         if(this.die == true && this.myStr.length <= 1)
         {
            this.myStr = "";
            this.wait = this.wait - 1;
            if(this.wait <= 0)
            {
               this.a = this.a + 1;
               if(this.titleStr.charAt(this.a) == "-" || this.titleStr.charAt(this.a) == "\n" || this.titleStr.charAt(this.a) == "," || this.titleStr.charAt(this.a) == ".")
               {
                  this.wait = 30;
               }
               if(this.a > this.titleStr.length)
               {
                  this.a = this.titleStr.length;
                  this.b = this.b + 1;
                  if(this.resultStr.charAt(this.b - 1) == "-" || this.resultStr.charAt(this.b - 1) == "\n" || this.resultStr.charAt(this.b - 1) == "." || this.resultStr.charAt(this.b - 1) == ",")
                  {
                     this.wait = 30;
                  }
                  if(this.b > this.resultStr.length)
                  {
                     this.b = this.resultStr.length;
                     this.fTimer = this.fTimer + 1;
                     if(this.fTimer > 100)
                     {
                        if(FP.world.classCount(obj_staticfade) == 0)
                        {
                           FP.world.add(new obj_staticfade());
                        }
                     }
                  }
               }
            }
         }
      }
      
      override public function render() : void
      {
         if(this.die == true && this.myStr == "")
         {
            y = 40;
            this.myTitle.text = this.titleStr.substr(0,this.a);
            this.myTitle.size = 60;
            this.myTitle.align = "left";
            this.myTitle.color = 65280;
            graphic = this.myTitle;
            x = 145;
            super.render();
            this.myTxt.text = this.resultStr.substr(0,this.b);
            x = 34;
            y = 120;
            graphic = this.myTxt;
            super.render();
         }
         else
         {
            x = 34;
            y = 40;
            graphic = this.myTxt;
            super.render();
         }
      }
   }
}
