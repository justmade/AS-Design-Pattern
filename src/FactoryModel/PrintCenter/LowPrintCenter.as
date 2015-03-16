package FactoryModel.PrintCenter
{
	public class LowPrintCenter extends PrintCenter
	{
		public function LowPrintCenter()
		{
			super();
		}
		
		override protected function createPrintjob():IPrintjob
		{
			trace("CreateLowPrint");
			return new InkPrintJob();
		}
		
	}
}