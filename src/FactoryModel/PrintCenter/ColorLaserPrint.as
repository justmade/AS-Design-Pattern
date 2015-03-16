package FactoryModel.PrintCenter
{
	public class ColorLaserPrint implements IPrintjob
	{
		public function ColorLaserPrint()
		{
		}
		
		public function start(msg:String):void
		{
			trace("Color Laser print"+ msg);
		}
	}
}