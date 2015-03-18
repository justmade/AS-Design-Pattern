package Carmark
{
	import com.fio.logic.FioCarmackUtil;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import utils.TileGrid;
	
	[SWF(width="600", height="440", backgroundColor="0xffffff", frameRate="60")]
	/**
	 * <font color="#006699">卡马克测试</font>
	 * 
	 * @author <font color="#ff00ff"><b>Fio</b></font> QQ:<u>15656664</u>
	 * @Time:2013-11-27 上午11:51:12
	 **/
	public class T_FioCarmack extends Sprite
	{
		private const mapw :int = 600;
		private const maph :int = 440;
		private const tilew :int = 40;
		private const tileh :int = 40;
		
		private var fiocmk :FioCarmackUtil = null;
		
		public function T_FioCarmack()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE , onStage);
		}
		
		protected function onStage(event:Event):void
		{
			init();
		}
		
		private function init():void{
			//初始化，必须传入切片的尺寸
			fiocmk = new FioCarmackUtil(tilew, tileh);
			//预加载的大小。这个值将会使得区域周围扩大对应的格子范围
			fiocmk.preLoad_size = 0;
			//初始化地图尺寸，否则获得的数据将会错误。在每次更换地图的时候去重新调用这个方法
			fiocmk.initMapSize(mapw, maph);
			
			drawTiles();
			restore();
			this.stage.addEventListener(MouseEvent.CLICK, click);
			click();
		}
		
		private final function drawTiles():void
		{
			var col :int = Math.ceil(mapw / tilew);
			var row :int = Math.ceil(maph / tileh);
			var py :int, px :int;
			for(py = 0; py < row; py ++)
			{
				for(px = 0; px < col; px ++) addChild(new TileGrid(px, py, tilew, tileh));
			}
		}
		
		private final function click(e:MouseEvent = null):void
		{
			var sw :int = mapw >> 1;
			var sh :int = maph >> 1;
			var p :Point = new Point(sw, sh);
			if(null != e)
			{
				p.setTo(mouseX >> 0, mouseY >> 0);
			}
			//确定一个显示区域。这里通过计算获得指定点为中心的一个区域。这里以要显示一个3*3格子大小的区域来测试
			showFioRect(new Rectangle(p.x - tilew, p.y - tileh, tilew * 2, tileh * 2));
		}
		
		private final function showFioRect(rect:Rectangle):void
		{
			//如果要显示的区域是一个新区域，则将获取对应的一些数据
			if(fiocmk.isNewRect(rect))
			{
				//将网格重置
				restore();
				//标记要移除的区域，红色部分。
				setColor(fiocmk.getOutTiles(), 0xff0000);
				//标记要新加入的区域，点集已经进行排序。绿色部分
				setColor(fiocmk.getInTiles(), 0x00cc00);
				//标记公共区域，即不需要重绘的区域。点集已经排血。黄色部分
				setColor(fiocmk.getInterTiles(), 0xffcc00);
			}
		}
		
		private final function restore():void
		{
			var len :int = numChildren;
			var grid :TileGrid = null;
			while(--len > -1)
			{
				grid = getChildAt(len) as TileGrid;
				grid.setColor(0x006699);
				grid.showTxt(grid.name);
			}
		}
		
		/**
		 * 标记网格 
		 * @param points 从cmk中获得的点集。对于公共区域和新入区域，已经进行过排序。
		 * 每个点都是切片网格的逻辑坐标，转换为本地坐标的事情就自己做咯
		 * @param color 颜色色值
		 */		
		private final function setColor(points:Vector.<Point>, color:uint):void
		{
			var p :Point;
			var grid :TileGrid = null;
			var index :int = 0;
			for each(p in points)
			{
				grid = getChildByName(p.y + '_' + p.x) as TileGrid;
				if(null != grid)
				{
					grid.setColor(color);
					grid.setIndex(index);
					index ++;
				}
			}
		}
	}
}