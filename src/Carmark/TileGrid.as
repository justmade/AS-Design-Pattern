package  Carmark
{
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	
	/**
	 * 
	 * @author Fio QQ:15656664
	 * @Time:2013-11-7 下午10:56:24
	 **/
	public class TileGrid extends Sprite
	{
		private var txt :TextField;
		
		public function TileGrid(px:uint, py:uint, tilew:uint, tileh:uint)
		{
			mouseChildren = false;
			mouseEnabled = false;
			txt = new TextField;
			txt.height = 20;
			txt.wordWrap = false;
			txt.multiline = false;
			txt.selectable = false;
			txt.mouseEnabled = false;
			txt.textColor = 0;
			addChild(txt);
			txt.width = tilew;
			txt.x = (tilew - txt.width) >> 1;
			txt.y = (tileh - 20) >> 1;
			
			graphics.lineStyle(0, 0);
			graphics.drawRect(0, 0, tilew, tileh);
			graphics.beginFill(0x333333, .2);
			graphics.drawRect(.5, .5, tilew - 1, tileh - 1);
			graphics.endFill();
			
			x = px * tilew;
			y = py * tileh;
			
			showTxt(py + ' _ ' + px);
			name = py + '_' + px;
		}
		
		public final function setColor(color:uint):void
		{
			var cor :ColorTransform = transform.colorTransform;
			cor.color = color;
			transform.colorTransform = cor;
		}
		
		public final function setIndex(index:int):void
		{
			showTxt('' + index);
		}
		
		public final function showTxt(str:String):void
		{
			txt.htmlText = '<p align="center">' + str + '</p>';
		}
	}
}