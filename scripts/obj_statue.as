package
{
   import net.flashpunk.Entity;
   import net.flashpunk.graphics.Spritemap;
   
   public class obj_statue extends Entity
   {
       
      
      private const PLAYER:Class = obj_statue_PLAYER;
      
      public var spr_flame:Spritemap;
      
      private const PLAYER2:Class = obj_statue_PLAYER2;
      
      public var spr_statue:Spritemap;
      
      private const PLAYER3:Class = obj_statue_PLAYER3;
      
      public var spr_energychain1:Spritemap;
      
      private const PLAYER4:Class = obj_statue_PLAYER4;
      
      public var spr_energychain2:Spritemap;
      
      public var statue_index:int = 0;
      
      public var part:int = 0;
      
      public var animation_index:Number = 0;
      
      public var animation_max:Number = 6;
      
      public var animation_float:Number = 0;
      
      public var animation_speed:Number = 0.3;
      
      public var animation_index2:int = 0;
      
      public var animation_max2:Number = 4;
      
      public var animation_float2:Number = 0;
      
      public var animation_speed2:Number = 0.4;
      
      public var base_x:Number = 0;
      
      public var lit:Boolean = false;
      
      public var randalph:Number = 0;
      
      public var alpha:Number = 0;
      
      public var timer:int = 0;
      
      public function obj_statue(nx:int, index:int)
      {
         this.spr_flame = new Spritemap(this.PLAYER,16,22);
         this.spr_statue = new Spritemap(this.PLAYER2,24,45);
         this.spr_energychain1 = new Spritemap(this.PLAYER3,75,83);
         this.spr_energychain2 = new Spritemap(this.PLAYER4,17,75);
         super();
         x = nx;
         this.base_x = x;
         y = 450;
         this.statue_index = index;
         this.spr_flame.add("main",[0,1,2,3,4,5,6]);
         this.spr_statue.add("main",[0,1,2,3,4,5]);
         this.spr_energychain1.add("main",[0,1,2,3,4]);
         this.spr_energychain2.add("main",[0,1,2,3,4]);
         this.spr_energychain1.scale = 2;
         this.spr_energychain2.scale = 2;
         if(index == 2)
         {
            this.spr_energychain1.flipped = true;
         }
         this.spr_flame.scale = 2;
         this.spr_statue.scale = 2;
         this.spr_flame.originX = -4;
         this.spr_flame.originY = -14;
         graphic = this.spr_statue;
         this.spr_statue.play("main",true,this.statue_index);
         setHitbox(24 + 14 + 14,45,-12 + 7 + 7,0);
         layer = 106;
         type = "obj_statue";
      }
      
      override public function update() : void
      {
         super.update();
         if(global.pause == false && global.esc_pause == false)
         {
            this.animation_float2 = this.animation_float2 + this.animation_speed2;
            if(this.animation_float2 >= 1)
            {
               this.animation_index2 = this.animation_index2 + 1;
               this.animation_float2 = 0;
            }
            if(this.animation_index2 > this.animation_max2)
            {
               this.animation_index2 = 0;
            }
            if(this.part == 0)
            {
               y = y - 1;
               x = this.base_x + Math.round(Math.random() * 10);
               if(y < 448 - 90)
               {
                  y = 448 - 90;
                  x = this.base_x;
                  this.part = 1;
               }
            }
            if(this.part == 1)
            {
               if(this.alpha < 1)
               {
                  this.alpha = this.alpha + 0.02;
               }
               if(collide("obj_eruption",x,y))
               {
                  this.lit = true;
                  this.timer = 120;
               }
               if(this.lit == true && global.boss.hurt == false)
               {
                  this.timer = this.timer - 1;
               }
               if(global.boss.hurt == true)
               {
                  this.lit = true;
                  this.timer = 120;
               }
               if(this.timer < 0)
               {
               }
            }
            if(this.lit == true)
            {
               this.randalph = Math.random() * 0.7;
               this.animation_float = this.animation_float + this.animation_speed;
               if(this.animation_float >= 1)
               {
                  this.animation_index = this.animation_index + 1;
                  this.animation_float = 0;
               }
               if(this.animation_index > this.animation_max)
               {
                  this.animation_index = 0;
               }
            }
         }
      }
      
      override public function render() : void
      {
         var tx:Number = x;
         var ty:Number = y;
         this.spr_energychain1.play("main",true,this.animation_index2);
         this.spr_energychain2.play("main",true,this.animation_index2);
         this.spr_energychain1.alpha = this.alpha;
         this.spr_energychain2.alpha = this.alpha;
         if(this.lit == true)
         {
            this.spr_energychain1.color = 16711680;
            this.spr_energychain2.color = 16711680;
         }
         else
         {
            this.spr_energychain1.color = 16777215;
            this.spr_energychain2.color = 16777215;
         }
         if(this.statue_index == 0)
         {
            x = 188;
            y = 262;
            graphic = this.spr_energychain1;
            super.render();
         }
         if(this.statue_index == 1)
         {
            x = 306;
            y = 264;
            graphic = this.spr_energychain2;
            super.render();
         }
         if(this.statue_index == 2)
         {
            x = 336;
            y = 262;
            graphic = this.spr_energychain1;
            super.render();
         }
         x = tx;
         y = ty;
         graphic = this.spr_statue;
         this.spr_statue.play("main",true,this.statue_index);
         this.spr_statue.alpha = 1;
         super.render();
         if(this.lit == true)
         {
            this.spr_statue.play("main",true,this.statue_index + 3);
            this.spr_statue.alpha = this.randalph + 0.3;
            super.render();
            this.spr_flame.play("main",true,this.animation_index);
            graphic = this.spr_flame;
            super.render();
         }
      }
   }
}
