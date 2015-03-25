package Observer
{
	public interface Subject
	{
		function subscribeObserver(o:Observer):void;
		function unsubscribeObserver(o:Observer):void;
		function notifyObserver():void;
	}
}