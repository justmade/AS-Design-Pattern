package FactoryModel.PrintCenter
{
	public class HighPrintCenter extends PrintCenter
	{
		public function HighPrintCenter()
		{
			super();
		}
		
		override protected function createPrintjob():IPrintjob
		{
			trace("HighPrintCenter");
			return new WorkPrintJob();
		}
		
		
	}
}