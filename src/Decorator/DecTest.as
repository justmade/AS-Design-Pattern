package Decorator
{
	public class DecTest
	{
		public function DecTest()
		{
			var testComponent:Component = new ConcreteComponent();
			testComponent = new DecConA(testComponent);
			testComponent = new DecConB(testComponent);
			trace(testComponent.getInformation())
			/*打印结果
			//***Decorator***///
			//Concrete Component is decorator with ➔Decorator ADecorator B*/
		}
	}
}