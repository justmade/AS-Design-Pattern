package Component
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	public class ComponentTest extends Sprite
	{
		private var snake:Composite; 
		
		private var upOffset:Point ;
		
		private var backOffset:Point;
		
		public function ComponentTest()
		{
			snake = new Head("head",0x007536);
			snake.x = snake.y = 100 ;
			this.addChild(snake);
			
			var parentNode:Composite = snake ;
			for(var i:int = 0 ; i < 10 ; i++){
				var segment:Composite = new BodySegment("Body");
				parentNode.add(segment);
				segment.x = segment.y = -50 ;
				this.addChild(segment);
				parentNode = segment;
			}
			
			var tail:Component = new Tail("tail");
			this.addChild(tail);
			parentNode.add(tail);
			snake.update();
			
			
			this.addEventListener(Event.ADDED_TO_STAGE , onStage);
		}
		
		protected function onStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onStage);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN , onKeyPress);
		}
		
		protected function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					snake.rotation -= 10;
					break;
				case Keyboard.RIGHT:
					snake.rotation += 10;
					break;
				case Keyboard.UP:
					upOffset = Point.polar(5,snake.rotation * Math.PI/180);
					moveSnake(upOffset);
					break;
				case Keyboard.DOWN:
					backOffset = Point.polar(-5,snake.rotation * Math.PI / 180);
					moveSnake(backOffset);
					break;
					
				default:
				{
					break;
				}
					
			}
			snake.update()
		}
		
		private function moveSnake(_p:Point):void{
			snake.x += _p.x ;
			snake.y += _p.y ;
		}
	}
}