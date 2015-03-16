package FactoryModel.PrintCenter
{
	public class PrintCenterTest
	{
		public function PrintCenterTest()
		{
			var l:NewLowPrintCenter =new NewLowPrintCenter();;
			l.print("这是一篇文章",NewLowPrintCenter.BW);
			l.print("这是一篇文章",NewLowPrintCenter.COLOR);
			var h:NewHighPrintCenter = new NewHighPrintCenter();
			h.print("这是一本书",NewHighPrintCenter.BW)
			h.print("这是一本书",NewHighPrintCenter.COLOR)
		}
	}
}