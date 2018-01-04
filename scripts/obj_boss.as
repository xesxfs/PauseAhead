package
{
   import net.flashpunk.Entity;
   import net.flashpunk.Sfx;
   import net.flashpunk.graphics.Image;
   import net.flashpunk.FP;
   import net.flashpunk.utils.Draw;
   
   public class obj_boss extends Entity
   {
       
      
      private const s_sbs3:Class = obj_boss_s_sbs3;
      
      public var sound_bosshurt:Sfx;
      
      private const arm1:Class = obj_boss_arm1;
      
      private const arm2:Class = obj_boss_arm2;
      
      private const arm3:Class = obj_boss_arm3;
      
      private const arm4:Class = obj_boss_arm4;
      
      private const arm5:Class = obj_boss_arm5;
      
      private const arm6:Class = obj_boss_arm6;
      
      private const arm7:Class = obj_boss_arm7;
      
      private const arm8:Class = obj_boss_arm8;
      
      private const arm9:Class = obj_boss_arm9;
      
      private const arm10:Class = obj_boss_arm10;
      
      private const arm11:Class = obj_boss_arm11;
      
      private const arm12:Class = obj_boss_arm12;
      
      private const arm13:Class = obj_boss_arm13;
      
      private const arm14:Class = obj_boss_arm14;
      
      private const arm15:Class = obj_boss_arm15;
      
      public var spr_arm1:Image;
      
      public var spr_arm2:Image;
      
      public var spr_base:Image;
      
      public var spr_bulge1:Image;
      
      public var spr_bulge2:Image;
      
      public var spr_bulge3:Image;
      
      public var spr_chest:Image;
      
      public var spr_neck:Image;
      
      public var spr_otherstuff:Image;
      
      public var spr_shoulder:Image;
      
      public var spr_weakpoint:Image;
      
      public var spr_weakpointglow:Image;
      
      public var spr_head1:Image;
      
      public var spr_head2:Image;
      
      public var spr_head3:Image;
      
      public var attack:int = 0;
      
      public var trapped:Boolean = false;
      
      public var rep:int = 1;
      
      public var otherstuff_scale:Number;
      
      public var otherstuff_x:Number;
      
      public var otherstuff_y:Number;
      
      public var otherstuff_var:Number;
      
      public var bulge1_scale:Number;
      
      public var bulge1_x:Number;
      
      public var bulge1_y:Number;
      
      public var bulge1_var:Number;
      
      public var bulge2_scale:Number;
      
      public var bulge2_x:Number;
      
      public var bulge2_y:Number;
      
      public var bulge2_var:Number;
      
      public var bulge3_scale:Number;
      
      public var bulge3_x:Number;
      
      public var bulge3_y:Number;
      
      public var bulge3_var:Number;
      
      public var chest_scale:Number;
      
      public var chest_x:Number;
      
      public var chest_y:Number;
      
      public var chest_var:Number;
      
      public var weakpoint_scale:Number;
      
      public var weakpoint_x:Number;
      
      public var weakpoint_y:Number;
      
      public var weakpoint_var:Number;
      
      public var weakpoint_glow_alpha:Number = 0;
      
      public var weakpoint_glow_up:Boolean = false;
      
      public var shoulder_angle:Number;
      
      public var shoulder_x:Number;
      
      public var shoulder_y:Number;
      
      public var shoulder_var:Number;
      
      public var neck_angle:Number;
      
      public var neck_x:Number;
      
      public var neck_y:Number;
      
      public var neck_var:Number;
      
      public var arm1_angle:Number;
      
      public var arm1_x:Number;
      
      public var arm1_y:Number;
      
      public var arm1_var:Number;
      
      public var arm2_angle:Number;
      
      public var arm2_x:Number;
      
      public var arm2_y:Number;
      
      public var arm2_var:Number;
      
      public var head_index:int;
      
      public var head_x:Number;
      
      public var head_y:Number;
      
      public var head_offset:Number = 0;
      
      public var head_scale:Number = 2;
      
      public var head_destx:Number;
      
      public var head_desty:Number;
      
      public var timer:int = 0;
      
      public var hurt:Boolean = false;
      
      public var hp:int = 1;
      
      public var blackalpha:Number = 0;
      
      public var i:int = 0;
      
      public var playerList:Array;
      
      public var ttimer:int = 0;
      
      public var lasers:Boolean = false;
      
      public var ftimer:int = 100;
      
      public var die:Boolean = false;
      
      public var statueTimer:int = 0;
      
      public function obj_boss()
      {
         this.sound_bosshurt = new Sfx(this.s_sbs3);
         this.playerList = new Array();
         super();
         global.tendrilblock[0] = false;
         global.tendrilblock[1] = false;
         global.tendrilblock[2] = false;
         global.tendrilblock[3] = false;
         global.tendrilblock[4] = false;
         global.tendrilblock[5] = false;
         global.tendrilblock[6] = false;
         global.tendrilblock[7] = false;
         global.tendrilblock[8] = false;
         this.spr_arm1 = new Image(this.arm1);
         this.spr_arm2 = new Image(this.arm2);
         this.spr_base = new Image(this.arm3);
         this.spr_bulge1 = new Image(this.arm4);
         this.spr_bulge2 = new Image(this.arm5);
         this.spr_bulge3 = new Image(this.arm6);
         this.spr_chest = new Image(this.arm7);
         this.spr_neck = new Image(this.arm8);
         this.spr_otherstuff = new Image(this.arm9);
         this.spr_shoulder = new Image(this.arm10);
         this.spr_weakpoint = new Image(this.arm11);
         this.spr_weakpointglow = new Image(this.arm15);
         this.spr_head1 = new Image(this.arm12);
         this.spr_head2 = new Image(this.arm13);
         this.spr_head3 = new Image(this.arm14);
         x = 0;
         y = -6;
         this.otherstuff_scale = 2.04;
         this.otherstuff_x = x + (95 + 292 / 2) * 2;
         this.otherstuff_y = y + (42 + 185 / 2) * 2;
         this.otherstuff_var = 0;
         this.bulge1_scale = 2.07;
         this.bulge1_x = x + (190 + 130 / 2) * 2;
         this.bulge1_y = y + (177 + 50 / 2) * 2;
         this.bulge1_var = 0;
         this.bulge2_scale = 1.92;
         this.bulge2_x = x + (39 + 128 / 2) * 2;
         this.bulge2_y = y + (188 + 39 / 2) * 2;
         this.bulge2_var = 0;
         this.bulge3_scale = 1.93;
         this.bulge3_x = x + (254 + 48 / 2) * 2;
         this.bulge3_y = y + (155 + 28 / 2) * 2;
         this.bulge3_var = 0;
         this.chest_scale = 2.04;
         this.chest_x = x + (143 + 99 / 2) * 2;
         this.chest_y = y + (80 + 101 / 2) * 2;
         this.chest_var = 0;
         this.weakpoint_scale = 1.95;
         this.weakpoint_x = x + (147 + 48 / 2) * 2;
         this.weakpoint_y = y + (101 + 53 / 2) * 2;
         this.weakpoint_var = 0;
         this.shoulder_angle = 5;
         this.shoulder_x = x + (45 + 100) * 2;
         this.shoulder_y = y + (20 + 65) * 2;
         this.shoulder_var = 0;
         this.neck_angle = -3;
         this.neck_x = x + 235 * 2;
         this.neck_y = y + (82 + 35 / 2) * 2;
         this.neck_var = 0;
         this.arm1_angle = -3;
         this.arm1_x = x + (57 + 66) * 2;
         this.arm1_y = y + (105 + 10) * 2;
         this.arm1_var = 0;
         this.arm2_angle = -3.6;
         this.arm2_x = x + 78 * 2;
         this.arm2_y = y + (146 + 16) * 2;
         this.arm2_var = 0;
         this.head_index = 0;
         this.head_x = x + (141 + 54 / 2) * 2;
         this.head_y = y + (46 + 55 / 2) * 2;
         this.head_scale = 2;
         this.head_destx = this.head_x;
         this.head_desty = this.head_y;
         graphic = this.spr_base;
         this.spr_bulge1.centerOO();
         this.spr_bulge2.centerOO();
         this.spr_bulge3.centerOO();
         this.spr_chest.centerOO();
         this.spr_otherstuff.centerOO();
         this.spr_weakpoint.centerOO();
         this.spr_weakpointglow.centerOO();
         this.spr_head1.centerOO();
         this.spr_head2.centerOO();
         this.spr_head3.centerOO();
         this.spr_neck.originX = 0;
         this.spr_neck.originY = 17;
         this.spr_arm1.originX = 66;
         this.spr_arm1.originY = 10;
         this.spr_arm2.originX = 78 + 5 + 10;
         this.spr_arm2.originY = 16;
         this.spr_shoulder.originX = 100;
         this.spr_shoulder.originY = 65;
         this.spr_base.scale = 2;
         this.spr_neck.scale = 2;
         this.spr_arm1.scale = 2;
         this.spr_arm2.scale = 2;
         this.spr_shoulder.scale = 2;
         this.spr_head1.scale = 2;
         this.spr_head2.scale = 2;
         this.spr_head3.scale = 2;
         layer = 112;
         type = "obj_boss";
      }
      
      override public function update() : void
      {
         var z:int = 0;
         var buttonon:Boolean = false;
         var myList:Array = null;
         var cc:obj_bossbutton = null;
         var statuelit:int = 0;
         var myList2:Array = null;
         var aa:obj_statue = null;
         var myList3:Array = null;
         var aas:obj_fireball = null;
         if(this.die == true)
         {
            FP.world.add(new obj_bosskill());
            this.die = false;
         }
         super.update();
         if(global.pause == false && global.esc_pause == false && global.master.player_freeze == false && FP.world.classCount(obj_blacktext) == 0)
         {
            if(this.hurt == false && this.ttimer <= 0 && FP.world.classCount(obj_blackfade) == 0 && this.trapped == false)
            {
               FP.world.add(new obj_shake());
               FP.world.add(new obj_tendril());
               this.ttimer = Math.round(Math.random() * 60) + 100;
            }
            if(this.hurt == false)
            {
               this.ttimer = this.ttimer - 1;
            }
            if(global.replay.frame == 100 && FP.world.classCount(obj_shadowplayer) == 0)
            {
               FP.world.add(new obj_shadowplayer());
            }
            if(this.trapped == true)
            {
               this.ftimer = this.ftimer - 1;
            }
            if(this.trapped == true && this.ftimer <= 0 && this.hurt == false)
            {
               if(this.attack == 0)
               {
                  this.attack = 1;
                  this.ftimer = 250;
               }
            }
            if(this.hurt == true && this.blackalpha >= 1 && this.lasers == false)
            {
               FP.world.add(new obj_laser(0));
               FP.world.add(new obj_laser(90));
               FP.world.add(new obj_laser(180));
               FP.world.add(new obj_laser(270));
               this.lasers = true;
            }
            if(this.trapped == false)
            {
               buttonon = true;
               myList = new Array();
               FP.world.getClass(obj_bossbutton,myList);
               for each(cc in myList)
               {
                  if(cc.on == false)
                  {
                     buttonon = false;
                  }
               }
               if(buttonon == true)
               {
                  if(global.mute == false)
                  {
                     this.sound_bosshurt.play(global.volume);
                  }
                  if(this.hp == 3)
                  {
                     world.add(new obj_statue(294,1));
                  }
                  if(this.hp == 2)
                  {
                     world.add(new obj_statue(162,0));
                     world.add(new obj_statue(434,2));
                  }
                  if(this.hp == 1)
                  {
                     world.add(new obj_statue(162,0));
                     world.add(new obj_statue(442,2));
                     world.add(new obj_statue(298,1));
                  }
                  this.trapped = true;
               }
            }
            if(this.trapped == true && this.hurt == false && FP.world.classCount(obj_statue) != 0)
            {
               statuelit = 0;
               myList2 = new Array();
               FP.world.getClass(obj_statue,myList2);
               for each(aa in myList2)
               {
                  if(aa.lit == true)
                  {
                     statuelit++;
                  }
               }
               if(statuelit == FP.world.classCount(obj_statue))
               {
                  if(global.mute == false)
                  {
                     this.sound_bosshurt.play(global.volume);
                  }
                  this.hurt = true;
                  if(this.statueTimer < 120)
                  {
                     global.achievementQueue.push(3);
                  }
               }
               if(statuelit > 0)
               {
                  this.statueTimer = this.statueTimer + 1;
               }
            }
            if(this.hurt == true)
            {
               this.blackalpha = this.blackalpha + 0.02;
            }
            if(this.blackalpha > 1)
            {
               this.blackalpha = 1;
            }
            if(this.blackalpha < 0)
            {
               this.blackalpha = 0;
            }
            if(this.trapped == true)
            {
               this.rep = 4;
               if(this.weakpoint_glow_up == true)
               {
                  this.weakpoint_glow_alpha = this.weakpoint_glow_alpha + 0.03;
                  if(this.weakpoint_glow_alpha > 1.2)
                  {
                     this.weakpoint_glow_up = false;
                  }
               }
               else
               {
                  this.weakpoint_glow_alpha = this.weakpoint_glow_alpha - 0.03;
                  if(this.weakpoint_glow_alpha < 0.3)
                  {
                     this.weakpoint_glow_up = true;
                  }
               }
            }
            else
            {
               this.weakpoint_glow_alpha = this.weakpoint_glow_alpha - 0.05;
               if(this.weakpoint_glow_alpha < 0)
               {
                  this.weakpoint_glow_alpha = 0;
               }
               this.weakpoint_glow_up = true;
            }
            if(this.attack == 1)
            {
               this.timer++;
               if(this.timer == 20)
               {
                  if(this.i < 3)
                  {
                     FP.world.add(new obj_fireball(this.head_x,this.head_y,global.player));
                     this.i++;
                  }
                  else
                  {
                     this.i = 0;
                     myList3 = new Array();
                     FP.world.getClass(obj_fireball,myList3);
                     for each(aas in myList3)
                     {
                        aas.fall = true;
                        aas.timer = this.i;
                        this.i = this.i - 30;
                     }
                     this.attack = 0;
                  }
                  this.timer = 0;
               }
               this.rep = 2;
               this.head_index = 1;
               this.head_destx = x + (141 + 54 / 2) * 2 + 20;
               this.head_desty = y + (46 + 55 / 2) * 2 - 20;
            }
            if(this.attack == 0)
            {
               if(this.trapped == false)
               {
                  this.head_index = 0;
               }
               else
               {
                  this.head_index = 2;
               }
               this.timer = -20;
               this.rep = 1;
               this.i = 0;
               this.head_destx = x + (141 + 54 / 2) * 2;
               this.head_desty = y + (46 + 55 / 2) * 2;
            }
            if(this.trapped == true)
            {
               this.rep = 5;
            }
         }
         if(global.pause == false && global.esc_pause == false)
         {
            z = 0;
            while(z < this.rep)
            {
               if(this.otherstuff_scale > 2)
               {
                  this.otherstuff_var = this.otherstuff_var - 0.00001;
               }
               if(this.otherstuff_scale < 2)
               {
                  this.otherstuff_var = this.otherstuff_var + 0.00001;
               }
               this.otherstuff_scale = this.otherstuff_scale + this.otherstuff_var;
               this.spr_otherstuff.scale = this.otherstuff_scale;
               if(this.bulge1_scale > 2)
               {
                  this.bulge1_var = this.bulge1_var - 0.0001;
               }
               if(this.bulge1_scale < 2)
               {
                  this.bulge1_var = this.bulge1_var + 0.0001;
               }
               this.bulge1_scale = this.bulge1_scale + this.bulge1_var;
               this.spr_bulge1.scale = this.bulge1_scale;
               if(this.bulge2_scale > 2)
               {
                  this.bulge2_var = this.bulge2_var - 0.0001;
               }
               if(this.bulge2_scale < 2)
               {
                  this.bulge2_var = this.bulge2_var + 0.0001;
               }
               this.bulge2_scale = this.bulge2_scale + this.bulge2_var;
               this.spr_bulge2.scale = this.bulge2_scale;
               if(this.bulge3_scale > 2)
               {
                  this.bulge3_var = this.bulge3_var - 0.00001;
               }
               if(this.bulge3_scale < 2)
               {
                  this.bulge3_var = this.bulge3_var + 0.00001;
               }
               this.bulge3_scale = this.bulge3_scale + this.bulge3_var;
               this.spr_bulge3.scale = this.bulge3_scale;
               if(this.chest_scale > 2)
               {
                  this.chest_var = this.chest_var - 0.00001;
               }
               if(this.chest_scale < 2)
               {
                  this.chest_var = this.chest_var + 0.00001;
               }
               this.chest_scale = this.chest_scale + this.chest_var;
               this.spr_chest.scale = this.chest_scale;
               if(this.weakpoint_scale > 2)
               {
                  this.weakpoint_var = this.weakpoint_var - 0.00002;
               }
               if(this.weakpoint_scale < 2)
               {
                  this.weakpoint_var = this.weakpoint_var + 0.00002;
               }
               this.weakpoint_scale = this.weakpoint_scale + this.weakpoint_var;
               this.spr_weakpoint.scale = this.weakpoint_scale;
               this.spr_weakpointglow.scale = this.spr_weakpoint.scale;
               if(this.shoulder_angle > 0)
               {
                  this.shoulder_var = this.shoulder_var - 0.001;
               }
               if(this.shoulder_angle < 0)
               {
                  this.shoulder_var = this.shoulder_var + 0.001;
               }
               this.shoulder_angle = this.shoulder_angle + this.shoulder_var;
               this.spr_shoulder.angle = this.shoulder_angle;
               if(this.neck_angle > 0)
               {
                  this.neck_var = this.neck_var - 0.001;
               }
               if(this.neck_angle < 0)
               {
                  this.neck_var = this.neck_var + 0.001;
               }
               this.neck_angle = this.neck_angle + this.neck_var;
               this.spr_neck.angle = this.neck_angle;
               if(this.arm1_angle > 0)
               {
                  this.arm1_var = this.arm1_var - 0.001;
               }
               if(this.arm1_angle < 0)
               {
                  this.arm1_var = this.arm1_var + 0.001;
               }
               this.arm1_angle = this.arm1_angle + this.arm1_var;
               this.spr_arm1.angle = this.arm1_angle;
               this.arm2_x = this.arm1_x + 126 * Math.cos((this.arm1_angle + 227) * FP.RAD);
               this.arm2_y = this.arm1_y + 126 * Math.sin((this.arm1_angle + 227) * FP.RAD);
               if(this.arm2_angle > 0)
               {
                  this.arm2_var = this.arm2_var - 0.002;
               }
               if(this.arm2_angle < 0)
               {
                  this.arm2_var = this.arm2_var + 0.002;
               }
               this.arm2_angle = this.arm2_angle + this.arm2_var;
               this.spr_arm2.angle = this.arm2_angle;
               this.spr_head1.scale = this.spr_bulge3.scale;
               this.head_offset = this.arm2_angle;
               if(this.attack == 1 || this.trapped == true)
               {
                  this.head_offset = Math.round(Math.random() * 6);
               }
               z++;
            }
         }
      }
      
      override public function render() : void
      {
         if(this.blackalpha != 1)
         {
            x = 0;
            y = -6;
            graphic = this.spr_base;
            super.render();
            x = this.otherstuff_x;
            y = this.otherstuff_y;
            graphic = this.spr_otherstuff;
            super.render();
            x = this.bulge1_x;
            y = this.bulge1_y;
            graphic = this.spr_bulge1;
            super.render();
            x = this.bulge2_x;
            y = this.bulge2_y;
            graphic = this.spr_bulge2;
            super.render();
            x = this.bulge3_x;
            y = this.bulge3_y;
            graphic = this.spr_bulge3;
            super.render();
            x = this.chest_x;
            y = this.chest_y;
            graphic = this.spr_chest;
            super.render();
            x = this.weakpoint_x;
            y = this.weakpoint_y;
            graphic = this.spr_weakpoint;
            super.render();
            if(this.weakpoint_glow_alpha > 0)
            {
               graphic = this.spr_weakpointglow;
               this.spr_weakpointglow.alpha = this.weakpoint_glow_alpha;
               super.render();
            }
            x = this.shoulder_x;
            y = this.shoulder_y;
            graphic = this.spr_shoulder;
            super.render();
            x = this.neck_x;
            y = this.neck_y;
            graphic = this.spr_neck;
            super.render();
            x = this.arm1_x;
            y = this.arm1_y;
            graphic = this.spr_arm1;
            super.render();
            x = this.arm2_x;
            y = this.arm2_y;
            graphic = this.spr_arm2;
            super.render();
            x = this.head_x;
            y = this.head_y + this.head_offset;
            if(this.head_index == 0)
            {
               graphic = this.spr_head1;
            }
            if(this.head_index == 1)
            {
               graphic = this.spr_head2;
            }
            if(this.head_index == 2)
            {
               graphic = this.spr_head3;
            }
            super.render();
         }
         if(this.blackalpha > 0)
         {
            Draw.rect(0,0,640,480,0,this.blackalpha);
         }
         if(this.trapped == true)
         {
            x = this.weakpoint_x;
            y = this.weakpoint_y;
            if(this.weakpoint_glow_alpha > 0)
            {
               graphic = this.spr_weakpointglow;
               this.spr_weakpointglow.alpha = this.weakpoint_glow_alpha;
               super.render();
            }
         }
      }
   }
}
