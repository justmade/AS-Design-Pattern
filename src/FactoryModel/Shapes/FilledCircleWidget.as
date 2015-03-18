package FactoryModel.Shapes
{
	public class FilledCircleWidget extends ShapeWidget
	{
		public function FilledCircleWidget()
		{
			super();
		}
		
		override internal function drawWidget():void
		{
			graphics.beginFill(0xffff00);
			graphics.drawCircle(0,0,10);
			graphics.endFill();
		}
		
		
	}
}