package FactoryModel.Product
{
	public class CreatorB extends Creator
	{
		public function CreatorB()
		{
			super();
		}
		
		override protected function factoryMethod():IProduct
		{
			return new ProductB();
		}
		
	}
}