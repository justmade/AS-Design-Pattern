package FactoryModel.PrintCenter
{
	public class NewLowPrintCenter extends NewPrintCenter
	{
		public static const BW:uint = 0 ;
		
		public static const COLOR:uint = 1 ;
		
		public function NewLowPrintCenter()
		{
			super();
		}
		
		override protected function createPrintjob(ckind:uint):IPrintjob
		{
			if(ckind == BW){
				return new InkPrintJob();
			}else if(ckind == COLOR){
				return new ColorPrintJob();
			}else{
				throw new Error("Error type");
				return null;
			}
		}
		
		
	}
}