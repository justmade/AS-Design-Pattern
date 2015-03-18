package FactoryModel.Shapes
{
	import flash.errors.IllegalOperationError;

	public class FilledShapeCreator extends ShapeCreator
	{
		public static const CIRCLE:int = 0;
		
		public static const SQUARE:int = 1 ;
		public function FilledShapeCreator()
		{
			super();
		}
		
		override protected function createShape(cType:uint):ShapeWidget
		{
			if(cType == CIRCLE){
				return new FilledCircleWidget();
			}else if(cType == SQUARE){
				return new FilledSquareWidget();
			}else{
				throw new IllegalOperationError("Error");
				return null
			}
			
		}
		
	}
}