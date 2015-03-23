package Adapter
{
	public class AdapterTest
	{
		public function AdapterTest()
		{
//			var target:ITarget = new Adapter(new Adaptee());
//			target.request();
			var target:CITarget = new CAdapter();
			target.renameRequestA();
			target.requestB();
			target.requestC();
			target.requestD();
		}
	}
}