package Component
{
	import flash.geom.Point;

	public class Tail extends Component
	{
		private var seglen:int = 20;
		public function Tail(sNodeName:String,color:uint=0x00b454)
		{
			super();
			this.graphics.lineStyle(10,color);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(seglen,0);
			this.graphics.lineStyle(3,0x000000);
			for(var i:int = 1 ; i < 4 ; i++){
				this.graphics.moveTo(i*5,-5);
				this.graphics.lineTo(i*5,5);
			}
		}
		override public function update():void
		{
			// TODO Auto Generated method stub
			var myParent:Composite = getParent();
			var parentPos:Point = new Point(myParent.x , myParent.y);
			var myPos:Point = new Point(this.x , this.y);
			
			var temp:Point = parentPos.subtract(myPos);
			var angle:Number = Math.atan2(temp.y ,temp.x);
			this.rotation = angle * 180 / Math.PI;
			
			var currentDistance:Number = Point.distance(parentPos,myPos);
			var myNewPos:Point = Point.interpolate(myPos,parentPos,seglen/currentDistance);
			this.x = myNewPos.x ; 
			this.y = myNewPos.y ;
			
			
		}
	}
}