package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Adapter.AdapterTest;
	
	import Carmark.T_FioCarmack;
	
	import Command.CommandTest;
	
	import Component.ComponentTest;
	
	import Decorator.DecTest;
	
	import Delegate.TestMedia;
	
	import FactoryModel.PrintCenter.PrintCenterTest;
	import FactoryModel.Shapes.ShapesTest;
	
	import Observer.ObserverTest;
	
	public class Main extends Sprite
	{
		public function Main()
		{
//			new TestMedia();
//			new PrintCenterTest();
//			this.addChild(new ShapesTest())
//			this.addEventListener(Event.ADDED_TO_STAGE , onStage);
//			new AdapterTest();
//			this.addChild(new ComponentTest());
//			new CommandTest();
//			new ObserverTest();
			
		
			test();
		}
		private function test():void{
			for(var i:int = 0 ; i < 10 ; i++){
				if(i == 5){
					continue;
				}
				trace("i:",i)
			}
			trace("test")
		}
		
		protected function onStage(event:Event):void
		{
			this.addChild(new T_FioCarmack());
		}
	}
}