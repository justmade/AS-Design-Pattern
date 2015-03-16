package Delegate
{
	public class RecordMp3 implements IRecordMedia
	{
		
		public function recordNow():void
		{
			trace("Recording Mp3");
		}
	}
}