package Delegate
{
	public class RecordVideo implements IRecordMedia
	{
		
		public function recordNow():void
		{
			trace("Recording Video!");
		}
	}
}