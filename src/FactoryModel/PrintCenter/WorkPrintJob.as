package FactoryModel.PrintCenter
{
	public class WorkPrintJob implements IPrintjob
	{
		public function start(msg:String):void
		{
			trace("Work print" + msg );
		}
	}
}