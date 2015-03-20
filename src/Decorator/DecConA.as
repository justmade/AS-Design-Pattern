package Decorator
{
	public class DecConA extends Decorator
	{
		private var components:Component;
		public function DecConA(components:Component)
		{
			super();
			this.components = components ;
		}
		
		override public function getInformation():String
		{
			return components.getInformation()+"Decorator A";
		}
		
		
	}
}