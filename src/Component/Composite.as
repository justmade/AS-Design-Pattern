package Component
{
	public class Composite extends Component
	{
		private var sName:String ;
		
		private var aChildren:Array;
		
	
		public function Composite(sNodeName:String)
		{
			super();
			sName = sNodeName;
			this.aChildren = new Array();
		}
		
		override public function add(c:Component):void
		{
			aChildren.push(c);
			c.setParent(this);
		}
		
		override public function getChild(n:int):Component
		{
			if(n>0 && n <= aChildren.length){
				return aChildren[n - 1];
			}
			else {
				return null;
			}
		}
		
		override public function getComposite():Component
		{
			return this;
		}
		
		
		override public function operation():void
		{
			trace(this.sName);
			for each(var c:Component in aChildren){
				c.operation();
			}
		}
		
		override public function remove(c:Component):void
		{
			if(c == this){
				for(var i:int = 0 ; i < aChildren.length ; i++){
					safeRemove(aChildren[i]);
				}
				this.aChildren = [];
				this.removeParentRef();
			}else{
				for(var j:int = 0 ; j < aChildren.length ; j++){
					if(aChildren[j] == c){
						safeRemove(aChildren[j]);
						aChildren.splice(j,1);
					}
				}
			}
		}
		
		private function safeRemove(c:Component):void{
			if(c.getComposite()){
				c.remove(c);
			}else{
				c.removeParentRef();
			}
		}
		
	}
}