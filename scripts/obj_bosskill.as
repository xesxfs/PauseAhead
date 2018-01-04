package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.FP;
   
   public class obj_bosskill extends Entity
   {
       
      
      private const s_sbs3:Class = obj_bosskill_s_sbs3;
      
      public var sound_bossdeath:Sfx;
      
      public var timer:int = 0;
      
      public function obj_bosskill()
      {
         this.sound_bossdeath = new Sfx(this.s_sbs3);
         super();
      }
      
      override public function update() : void
      {
         var myList:Array = null;
         var bb:obj_statue = null;
         var myList2:Array = null;
         var cb:obj_bossbutton = null;
         super.update();
         this.timer = this.timer + 1;
         this.sound_bossdeath.volume = global.volume * 1;
         if(this.timer == 1)
         {
            if(global.mute == false)
            {
               this.sound_bossdeath.play(global.volume * 1);
            }
            FP.world.add(new obj_whiteflash());
            FP.world.add(new obj_shake());
            FP.world.remove(global.boss);
            myList = new Array();
            FP.world.getClass(obj_statue,myList);
            for each(bb in myList)
            {
               FP.world.remove(bb);
            }
            myList2 = new Array();
            FP.world.getClass(obj_bossbutton,myList2);
            for each(cb in myList2)
            {
               FP.world.remove(cb);
            }
         }
         if(this.timer == 30)
         {
            FP.world.add(new obj_shake2());
            FP.world.add(new obj_whiteflash2());
         }
         if(this.timer == 43)
         {
            FP.world.add(new obj_shake2());
            FP.world.add(new obj_whiteflash2());
         }
         if(this.timer == 70)
         {
            FP.world.add(new obj_whiteflash3());
            FP.world.add(new obj_endingcrack(320 - 64 - 16,320 + 32));
            FP.world.remove(this);
         }
      }
   }
}
