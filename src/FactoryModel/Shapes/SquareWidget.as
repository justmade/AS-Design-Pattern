package FactoryModel.Shapes
{
	public class SquareWidget extends ShapeWidget
	{
		public function SquareWidget()
		{
			super();
		}
		
		override internal function drawWidget():void
		{
			graphics.lineStyle(3,0xff00ff);
			graphics.drawRect(-10,-10,20,20);
		}
		
	}
}