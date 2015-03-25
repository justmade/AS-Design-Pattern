package Observer
{

	public class ConcreteSubject implements Subject
	{
		private var lights:String ;
		
		private var observers:Array;
		
		private var news:String;
		
		private var sports:String ;
		
		private var stocks:String;
		
		private var entertainment:String;
		
		private var hasSame:Boolean ;
		
		
		public function ConcreteSubject()
		{
			trace("ConcreteSubject");
			observers = new Array();
		}
		
		public function subscribeObserver(o:Observer):void
		{
			hasSame = false ;
			if(observers.indexOf(o)>0){
				trace("Already contact");
			}else{
				observers.push(o);
			}
		}
		
		public function unsubscribeObserver(o:Observer):void
		{
			for(var i:int = 0 ; i < observers.length ; i ++){
				if(observers[i] == o){
					observers.splice(i,1);
					break;
				}
			}
			
		}
		
		public function notifyObserver():void
		{
			for(var i:int = 0 ; i < observers.length ; i++){
				observers[i].update(news,sports,stocks,entertainment);
			}
		}
		
		public function setType(news:String , sports:String ,stocks:String , entertainment:String):void
		{
			this.news = news;
			this.sports = sports;
			this.stocks = stocks;
			this.entertainment = entertainment ;
			notifyObserver();
			
		}
		
		public function setLight(light:String):void{
			this.lights = light;
			notifyObserver();
		}
	}
}