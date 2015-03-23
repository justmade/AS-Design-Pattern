package Component
{
	import flash.errors.IllegalOperationError;

	public class Component
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
		
		internal function removeParentRef():void{
			this.parentNode = null;
		}
	}
}