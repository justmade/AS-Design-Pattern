package FactoryModel.Shapes
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.errors.IllegalOperationError;

	public class ShapeCreator
	{
		public function ShapeCreator()
		{
		}
		
		public function draw(cType:uint,target:DisplayObjectContainer,xLoc:int,yLoc:int):void
		{
			var shape:ShapeWidget = this.createShape(cType);
			shape.drawWidget();
			shape.setLocal(xLoc,yLoc);
			target.addChild(shape);
		}
		
		protected function createShape(cType:uint):ShapeWidget
		{
			throw new IllegalOperationError("虚拟方法不能被调用");
			
			return null;
		}
	}
}