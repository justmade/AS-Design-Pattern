package Command
{
	public class CommandTest
	{
		public function CommandTest()
		{
			var rec:Receiver = new Receiver();
			var command:ICommand = new ConcreteCommand(rec);
			
			var invoker:Invoker = new Invoker();
			invoker.setCommand(command);
			command.execute();
		}
	}
}