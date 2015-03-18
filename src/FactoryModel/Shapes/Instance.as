package FactoryModel.Shapes
{
	public class Instance
	{
		private static var _instance:Instance;
		
		public function Instance(lock:Lock)
		{
			
		}
		
		public static function getInstance():Instance
		{
			if(_instance == null){
				_instance = new Instance(new Lock());
			}
			return _instance;
		}
	}
}class Lock{}