package Component
{
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;

	public class Component extends Sprite
	{
		
		protected var parentNode:Composite;
		
		
		public function Component()
		{
		}
		
		public function add(c:Component):void{
			throw new IllegalOperationError("Not supported");
		}
		
		public function remove(c:Component):void{
			throw new IllegalOperationError("Not supported");
		}
		
		public function getChild(n:int):Component{
			throw new IllegalOperationError("Not supported");
			return null ;
		}
		
		internal function setParent(com:Composite):void{
			this.parentNode = com ;
		}
		
		public function getParent():Composite{
			return this.parentNode;
		}
		
		public function operation():void{
			
		}
		
		public function getComposite():Component{
			return null;
		}
		
		public function update():void{
			
		}
		
		internal function removeParentRef():void{
			this.parentNode = null;
		}
	}
}