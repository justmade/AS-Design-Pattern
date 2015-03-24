package Command
{
	public class Invoker
	{
		
		private var currentCommand:ICommand;
		
		public function Invoker()
		{
		}
		
		public function setCommand(c:ICommand):void{
			this.currentCommand = c ;
		}
		
		public function executeCommand():void{
			currentCommand.execute();
		}
		
	}
}