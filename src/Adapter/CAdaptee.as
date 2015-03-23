package Adapter
{
	public class CAdaptee
	{
		public function CAdaptee()
		{
		}
		
		public function requestA():void{
			trace("CAdaptee requestA");
		}
		public function requestB():void{
			trace("CAdaptee requestB");
		}
		public function requestC():void{
			trace("CAdaptee requestC");
		}
		public function requestD():void{
			trace("CAdaptee requestD");
		}
	}
}