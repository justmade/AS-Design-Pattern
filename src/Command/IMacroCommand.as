package Command
{
	public interface IMacroCommand extends ICommand
	{
		function add(c:ICommand):void;
		function remove(c:ICommand):void;
	}
}