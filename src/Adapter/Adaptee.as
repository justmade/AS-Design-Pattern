package Adapter
{
	public class Adaptee
	{
		public function Adaptee()
		{
		}
		
		public function specificRequest():void{
			trace("Called Adaptee:specificRequest()");
		}
	}
}