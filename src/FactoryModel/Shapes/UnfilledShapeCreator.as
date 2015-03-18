package FactoryModel.Shapes
{
	import flash.errors.IllegalOperationError;

	public class UnfilledShapeCreator extends ShapeCreator
	{
		
		public static const CIRCLE:int = 0;
		
		public static const SQUARE:int = 1 ;
		
		public function UnfilledShapeCreator()
		{
			super();
		}
		
		override protected function createShape(cType:uint):ShapeWidget
		{
			if(cType == CIRCLE){
				return new CircleWidget();
			}else if(cType == SQUARE){
				return new SquareWidget();
			}else{
				throw new IllegalOperationError("Error");
				return null
			}
			
		}
		
	}
}