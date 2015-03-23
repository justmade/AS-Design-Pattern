package Adapter
{
	public class CAdapter extends CAdaptee implements CITarget
	{
		public function CAdapter()
		{
			super();
		}
		
		public function renameRequestA():void
		{
			this.requestA();	
		}
		
		override public function requestB():void
		{
			trace("CAdapter RequestB")
		}
		
		
		override public function requestD():void
		{
			trace("CAdapter RequestD")
		}
		
	}
}