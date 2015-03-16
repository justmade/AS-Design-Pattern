package Delegate
{
	public class PlayMP3 implements IPlayMedia
	{
		public function playNow():void
		{
			trace("Playing Mp3");
		}
	}
}