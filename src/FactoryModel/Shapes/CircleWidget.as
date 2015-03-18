package FactoryModel.Shapes
{
	public class CircleWidget extends ShapeWidget
	{
		public function CircleWidget()
		{
			super();
		}
		
		override internal function drawWidget():void
		{
			graphics.lineStyle(3,0xFFFF00);
			graphics.drawCircle(0,0,10);
		}
		
	}
}