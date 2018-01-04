package net.flashpunk
{
   import net.flashpunk.masks.Masklist;
   import flash.display.Graphics;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class Mask
   {
       
      
      public var parent:net.flashpunk.Entity;
      
      public var list:Masklist;
      
      private var _class:Class;
      
      protected var _check:Dictionary;
      
      public function Mask()
      {
         this._check = new Dictionary();
         super();
         this._class = Class(getDefinitionByName(getQualifiedClassName(this)));
         this._check[Mask] = this.collideMask;
         this._check[Masklist] = this.collideMasklist;
      }
      
      public function collide(mask:Mask) : Boolean
      {
         if(this._check[mask._class] != null)
         {
            return this._check[mask._class](mask);
         }
         if(mask._check[this._class] != null)
         {
            return mask._check[this._class](this);
         }
         return false;
      }
      
      private function collideMask(other:Mask) : Boolean
      {
         return this.parent.x - this.parent.originX + this.parent.width > other.parent.x - other.parent.originX && this.parent.y - this.parent.originY + this.parent.height > other.parent.y - other.parent.originY && this.parent.x - this.parent.originX < other.parent.x - other.parent.originX + other.parent.width && this.parent.y - this.parent.originY < other.parent.y - other.parent.originY + other.parent.height;
      }
      
      protected function collideMasklist(other:Masklist) : Boolean
      {
         return other.collide(this);
      }
      
      public function assignTo(parent:net.flashpunk.Entity) : void
      {
         this.parent = parent;
         if(!this.list && parent)
         {
            this.update();
         }
      }
      
      protected function update() : void
      {
      }
      
      public function renderDebug(g:Graphics) : void
      {
      }
   }
}
