package FactoryModel.Shapes
{
	import flash.display.Sprite;

	public class ShapesTest extends Sprite
	{
		public function ShapesTest()
		{
			var unfilledShape:ShapeCreator = new UnfilledShapeCreator();
			var filledShape:ShapeCreator = new FilledShapeCreator();
			
			unfilledShape.draw(UnfilledShapeCreator.CIRCLE,this,50,75);
			unfilledShape.draw(UnfilledShapeCreator.SQUARE,this,150,75);
			
			filledShape.draw(FilledShapeCreator.CIRCLE,this,50,200);
			filledShape.draw(FilledShapeCreator.SQUARE,this,150,200);
		}
	}
}