package Decorator
{
	public class Decorator extends Component
	{
		public function Decorator()
		{
			super();
		}
		trace("///***Decorator***///");
		override public function getInformation():String
		{
			return information;
		}
		
		
	}
}