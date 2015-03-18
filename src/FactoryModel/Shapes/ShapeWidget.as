package FactoryModel.Shapes
{
	import flash.display.Sprite;
	
	public class ShapeWidget extends Sprite
	{
		public function ShapeWidget()
		{
			super();
		}
		
		internal function drawWidget():void{
			
		}
		
		internal function setLocal(_x:int , _y:int):void{
			this.x = _x ;
			this.y = _y ;
		}
	}
}