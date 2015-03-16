package Delegate
{
	public class VideoMedia extends Media
	{
		public function VideoMedia()
		{
			super();
			playMedia = new PlayVideo();
			recordMedia = new RecordVideo();
		}
	}
}