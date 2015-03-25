package Observer
{
	public class ConcreteObserver implements Observer
	{
		private var light:String;
		
		private var news:String;
		
		private var sports:String;
		
		private var stocks:String;
		
		private var entertainment:String;
		
		private var observerName:String;
		
		public function ConcreteObserver(_observerName:String)
		{
			this.observerName = _observerName;
		}
		
		public function update(news:String , sports:String ,stocks:String , entertainment:String):void
		{
//			this.light = light;
			this.news = news ;
			this.sports = sports ;
			this.stocks = stocks ;
			this.entertainment = entertainment ;
			trace("ConcreteObserver light state:",light)
		}
	}
}