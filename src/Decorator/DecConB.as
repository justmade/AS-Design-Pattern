package Decorator
{
	public class DecConB extends Decorator
	{
		private var components:Component;
		public function DecConB(components:Component)
		{
			super();
			this.components = components
		}
		override public function getInformation():String
		{
			return components.getInformation()+"Decorator B";
		}
	}
}