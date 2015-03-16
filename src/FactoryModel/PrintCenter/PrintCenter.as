package FactoryModel.PrintCenter
{
	import flash.errors.IllegalOperationError;

	public class PrintCenter
	{
		public function PrintCenter()
		{
			
		}
		
		public function print(msg:String):void
		{
			var pJob:IPrintjob = this.createPrintjob();
			pJob.start(msg);
		}
		
		protected function createPrintjob():IPrintjob{
		 	throw new IllegalOperationError("这是一个虚拟方法");
			
			return null;
		}
	}
}