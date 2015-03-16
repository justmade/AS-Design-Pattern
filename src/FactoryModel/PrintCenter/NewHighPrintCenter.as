package FactoryModel.PrintCenter
{
	public class NewHighPrintCenter extends NewPrintCenter
	{
		public static const BW:uint = 0 ;
		
		public static const COLOR:uint = 1 ;
		public function NewHighPrintCenter()
		{
			super();
		}
		
		override protected function createPrintjob(ckind:uint):IPrintjob
		{
			if(ckind == BW){
				return new WorkPrintJob();
			}else if(ckind == COLOR){
				return new ColorLaserPrint();
			}else{
				throw new Error("Error type");
				return null;
			}
		}
		
	}
}