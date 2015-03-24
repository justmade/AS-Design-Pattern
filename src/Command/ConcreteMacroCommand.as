package Command
{
	public class ConcreteMacroCommand implements IMacroCommand
	{
		
		private var commandLists:Array ;
		public function ConcreteMacroCommand()
		{
			commandLists = new Array();
		}
		
		public function add(c:ICommand):void
		{
			commandLists.push(c);
		}
		
		public function remove(c:ICommand):void
		{
			for(var i:int = 0 ; i < commandLists.length ; i++){
				if(commandLists[i] == c){
					commandLists.splice(i,1);
					break;
				}
			}
		}
		
		public function execute():void
		{
			for(var i:int = 0 ; i < commandLists.length ; i ++){
				commandLists[i].execute();
			}
		}
	}
}