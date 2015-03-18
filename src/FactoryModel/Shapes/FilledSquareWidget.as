package FactoryModel.Shapes
{
	public class FilledSquareWidget extends ShapeWidget
	{
		public function FilledSquareWidget()
		{
			super();
		}
		
		override internal function drawWidget():void
		{
			graphics.beginFill(0xFFFF00);
			graphics.drawRect(-10,-10,20,20);
			graphics.endFill();
		}
		
	}
}