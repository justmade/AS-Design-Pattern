package FactoryModel.Product
{
	public class CreatorA extends Creator
	{
		public function CreatorA()
		{
			super();
		}
		
		override protected function factoryMethod():IProduct
		{
			return new ProductA();
		}
		
		
	}
}