package FactoryModel.PrintCenter
{
	import flash.errors.IllegalOperationError;

	public class NewPrintCenter 
	{
		public function NewPrintCenter()
		{
			super();
		}
		
		public function print(msg:String,ckind:uint):void
		{
			var pJob:IPrintjob = this.createPrintjob(ckind);
			pJob.start(msg);
		}
		
		protected function createPrintjob(ckind:uint):IPrintjob{
			throw new IllegalOperationError("这是一个虚拟方法");
			
			return null;
		}
		
		
	}
}