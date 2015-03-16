package FactoryModel.PrintCenter
{
	public class ColorPrintJob implements IPrintjob
	{
		public function ColorPrintJob()
		{
		}
		
		public function start(msg:String):void
		{
			trace("Color print "+ msg);
		}
	}
}