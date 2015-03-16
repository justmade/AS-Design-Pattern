package FactoryModel.PrintCenter
{
	public class InkPrintJob implements IPrintjob
	{
		
		public function start(msg:String):void
		{
			trace("Ink print"+msg);
		}
	}
}