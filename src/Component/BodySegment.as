package Component
{
	import flash.geom.Point;

	public class BodySegment extends Composite
	{
		
		private var segLen:int = 20 ;
		
		public function BodySegment(sNodeName:String,color:uint=0x62DA9A)
		{
			super(sNodeName);
			this.graphics.lineStyle(10,color);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(segLen,0);
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
			var myNewPos:Point = Point.interpolate(myPos,parentPos,segLen/currentDistance);
			this.x = myNewPos.x ; 
			this.y = myNewPos.y ;
			super.update();
			
		}
		
		
		
		
	}
}