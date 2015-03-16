package Delegate
{
	public class Mp3Media extends Media
	{
		public function Mp3Media()
		{
			super();
			playMedia = new PlayMP3();
			recordMedia = new RecordMp3();
		}
	}
}