package Command
{
	public class ConcreteCommand implements ICommand
	{
		private var receiver:Receiver;
		
		public function ConcreteCommand(receiver:Receiver)
		{
			this.receiver = receiver ;
		}
		
		public function execute():void
		{
			receiver.action() ;
		}
	}
}