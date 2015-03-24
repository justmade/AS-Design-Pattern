package Component
{
	public class Head extends Composite
	{
		public function Head(sNodeName:String,color:uint)
		{
			super(sNodeName);
			this.graphics.lineStyle(20,color);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(20,0);
		}
	}
}