package Observer
{
	public class ObserverTest
	{
		public function ObserverTest()
		{
			var sub:ConcreteSubject = new ConcreteSubject();
			var o1:ConcreteObserver = new ConcreteObserver();
			var o2:ConcreteObserver = new ConcreteObserver();
			var o3:ConcreteObserver = new ConcreteObserver();
			sub.subscribeObserver(o1);
			sub.subscribeObserver(o2);
			sub.subscribeObserver(o3);
			sub.setLight("on");
			sub.unsubscribeObserver(o1);
			sub.setLight("off");
			
		}
	}
}