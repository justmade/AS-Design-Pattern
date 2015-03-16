package Delegate
{
	public class Media
	{
		
		protected var playMedia:IPlayMedia;
		
		protected var recordMedia:IRecordMedia ;
		
		public function Media()
		{
		}
		
		public function doPlayMedia():void
		{
			playMedia.playNow() ;
		}
		
		public function doRecordMedia():void
		{
			recordMedia.recordNow() ;
		}
	}
}