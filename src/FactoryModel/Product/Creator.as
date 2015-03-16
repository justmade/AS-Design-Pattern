package FactoryModel.Product
{
	import flash.errors.IllegalOperationError;

	/**
	 *这是一个抽象类，不可以实例化 
	 * @author dell
	 * 
	 */
	public class Creator
	{
		public function doStaff():void{
			var product:IProduct = this.factoryMethod(); 
			product.manipulate();
		}
		
		protected function factoryMethod():IProduct{
			throw new IllegalOperationError("这是一个抽象方法，必须由子类覆盖")
			return null ;
		}
	}
}