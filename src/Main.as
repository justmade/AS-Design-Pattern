package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Adapter.AdapterTest;
	
	import Carmark.T_FioCarmack;
	
	import Decorator.DecTest;
	
	import Delegate.TestMedia;
	
	import FactoryModel.PrintCenter.PrintCenterTest;
	import FactoryModel.Shapes.ShapesTest;
	
	public class Main extends Sprite
	{
		public function Main()
		{
//			new TestMedia();
//			new PrintCenterTest();
//			this.addChild(new ShapesTest())
//			this.addEventListener(Event.ADDED_TO_STAGE , onStage);
			new AdapterTest();
	
		}
		
		protected function onStage(event:Event):void
		{
			this.addChild(new T_FioCarmack());
		}
	}
}