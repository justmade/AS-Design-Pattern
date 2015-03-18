package
{
	import flash.display.Sprite;
	
	import Delegate.TestMedia;
	
	import FactoryModel.PrintCenter.PrintCenterTest;
	import FactoryModel.Shapes.ShapesTest;
	
	public class Main extends Sprite
	{
		public function Main()
		{
//			new TestMedia();
//			new PrintCenterTest();
			this.addChild(new ShapesTest())
		}
	}
}