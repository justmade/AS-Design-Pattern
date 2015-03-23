package Adapter
{
	
	public class Adapter implements ITarget
	{
		private var adaptee:Adaptee ;
		public function Adapter(adaptee:Adaptee)
		{
			this.adaptee = adaptee;
		}
		
		public function request():void
		{
			adaptee.specificRequest();
		}
	}
}