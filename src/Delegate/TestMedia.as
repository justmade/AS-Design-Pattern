package Delegate
{
	public class TestMedia
	{
		public function TestMedia()
		{
			var video:VideoMedia = new VideoMedia();
			video.doPlayMedia();
			video.doRecordMedia();
			
			var mp3:Mp3Media = new Mp3Media();
			mp3.doPlayMedia();
			mp3.doRecordMedia();
		}
	}
}