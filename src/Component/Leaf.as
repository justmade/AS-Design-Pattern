package Component
{
	public class Leaf extends Component
	{
		
		private var sName:String;
		
		public function Leaf(s:String)
		{
			super();
			sName = s ;
		}
		
		override public function operation():void
		{
			trace(sName);
		}
		
		
		
	}
}