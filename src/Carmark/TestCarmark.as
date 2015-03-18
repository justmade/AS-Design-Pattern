package  Carmark 
{
	import flash.utils.getTimer;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.StageScaleMode;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.Sprite;

	/**
	 * @author Administrator
	 */
	public class TestCarmark extends Sprite
	{

		public function TestCarmark(): void
		{ 
			stage.scaleMode = StageScaleMode.NO_SCALE;
			var loader: Loader = new Loader();
			loader.load(new URLRequest("touhou.jpg" ) );
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded );
		}

		private function onLoaded(e: Event): void
		{
			var bmd: BitmapData = BitmapData(e.target.content.bitmapData );
			trace("bitmapdata loaded : " + bmd .width + "," + bmd .height );
		 
			var cm: CarmackBMP = new CarmackBMP(bmd, 500, 500, 20, 20 ); 
			cm.setPositon(60, 60 );
			cm.scrollTo(- 400, - 450 );
			addChild(cm );
			 
			var osdSign: Bitmap = new Bitmap(new BitmapData(500, 500, false, 0x00ff00 ) );
			osdSign.x = 60;
			osdSign.y = 60;
			osdSign.alpha = 0.25;
			addChild(osdSign);
			
		 
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove );
			var v: Point = new Point();
			function onMove(e: Event): void
			{
				v.x = (stage.mouseX - stage.stageWidth / 2) / 50;
				v.y = (stage.mouseY - stage.stageHeight / 2) / 50 ;
			}
			cm.scroll(0, 11 );
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame );
			function onEnterFrame(e: Event): void
			{
				cm.scroll(v.x, v.y ); 
			}
		}
	}
}
