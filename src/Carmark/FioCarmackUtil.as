package  Carmark
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * <font color="#006699">开马克区域算法封装</font>
	 * <br>排列的方式：x对应列，y对应行。<font color="#ff0000"><b>获得点集的坐标都是逻辑坐标</b></font>
	 * <br>每次地图更换的时候，需要调用initMapSize来重新计算逻辑中所需数据
	 * <br>使用步骤：
	 * <li>构造实例，传入切片的尺寸
	 * <li>在更换地图后，调用初始化地图尺寸的方法  initMapSize 设置必须参数
	 * <li>在当前屏幕区域发生变化的时候，调用 isNewRect方法，获得是否加载新的切片及移除旧的切片。
	 * <li>如果返回true，则调用 getOutTiles()获得需要移除的切片的点集；调用getInTiles()获得需要新加载的切片的点集
	 * @author <font color="#ff00ff"><b>Fio</b></font> QQ:<u>15656664</u>
	 * @Time:2013-11-26 下午10:19:46
	 **/	
	public class FioCarmackUtil
	{
		/** 预加载的尺寸，对应x和y上的增量 **/
		public var preLoad_size :int = 1;
		
		private var col :int;
		private var row :int;
		private var tilew :int;
		private var tileh :int;
		
		private var curRect :Rectangle = new Rectangle;
		private var lastRect :Rectangle = new Rectangle;
		private var interRect :Rectangle = new Rectangle;
		private var inCoords :Vector.<Point> = new Vector.<Point>;
		private var outCoords :Vector.<Point> = new Vector.<Point>;
		private var interCoords :Vector.<Point> = new Vector.<Point>;
		
		/****** 可以自行打开，用于计算和保存当前屏幕显示区域的信息
		private var centerRect :Rectangle = new Rectangle;
		private var centerCoords :Vector.<Point> = new Vector.<Point>;
		//*** ***/
		
		/**
		 * 构造函数 
		 * @param tileWidth 切片像素宽度。用于计算列数
		 * @param tileHeight 切片像素高度，用于计算行数
		 */		
		public function FioCarmackUtil(tileWidth:int, tileHeight:int)
		{
			tilew = tileWidth;
			tileh = tileHeight;
		}
		
		/** 销毁 **/
		public final function destory():void
		{
			resetCoords();
			curRect = null;
			lastRect = null;
			interRect = null;
			inCoords = null;
			outCoords = null;
			interCoords = null;
			
			/****** 可以自行打开，用于计算和保存当前屏幕显示区域的信息
			centerRect = null;
			centerCoords = null;
			//*** ***/
		}
		
		/**
		 * 初始化地图尺寸 
		 * @param mapWidth 地图的像素宽度
		 * @param mapHeight 地图的像素高度
		 */		
		public final function initMapSize(mapWidth:int, mapHeight:int):void
		{
			resetCoords();
			col = Math.ceil(mapWidth / tilew);
			row = Math.ceil(mapHeight / tileh);
			curRect.setEmpty();
			lastRect.setEmpty();
			interRect.setEmpty();
			
			/****** 可以自行打开，用于计算和保存当前屏幕显示区域的信息
			centerRect.setEmpty();
			//*** ***/
		}
		
		/****** 可以自行打开，用于计算和保存当前屏幕显示区域的信息
		/**
		 * 获得正显的区域的点集 
		 * @return 返回正在屏幕显示区域的点的集合
		 *	
		public final function getCenterTiles():Vector.<Point>
		{
			return centerCoords;
		}
		//*** ***/
		
		/**
		 * 获得缓冲区域的点集 
		 * @return 返回缓冲区域的点集
		 */	
		public final function getInterTiles():Vector.<Point>
		{
			return interCoords;
		}
		
		/**
		 * 获取新区域的切片坐标集 
		 * @return 返回新区域的切片坐标集
		 */		
		public final function getInTiles():Vector.<Point>
		{
			return inCoords;
		}
		
		/**
		 * 获取移除区域的切片坐标点集 
		 * @return 返回移除区域的切片坐标点集
		 */		
		public final function getOutTiles():Vector.<Point>
		{
			return outCoords;
		}
		
		/**
		 * 解析矩形区域 
		 * @param rect 当前显示的矩形区域。坐标值均为像素值
		 * @return 返回要显示的区域是否有新区域的加入。用这个返回值可以做逻辑中是否开始加载新切片的开关
		 */		
		public final function isNewRect(rect:Rectangle):Boolean
		{
			resetCoords();
			//首先判断是否走出当前图像格
			var left: int = int(rect.left / tilew);
			var top: int = int(rect.top / tileh);
			var right :int = Math.ceil(rect.right / tilew) - left;
			var bottom :int = Math.ceil(rect.bottom / tileh) - top;
			//由rect得到扩展后要加载的地图区域
			curRect.setTo(left, top, right, bottom);
			curRect.inflate(preLoad_size, preLoad_size);
			toRevise(curRect);
			//如果和旧区域相同，则返回
			if(curRect.equals(lastRect)) return false;
			
			/****** 可以自行打开，用于计算和保存当前屏幕显示区域的信息
			centerRect.setTo(left, top, right, bottom);
			toRevise(centerRect);
			//trace('centerRect:', centerRect);
			setCoords(centerCoords, centerRect);
			//*** ***/
			
			//获得交集区域，也就是公共区域
			interRect = lastRect.intersection(curRect);
			toRevise(interRect);
			setCoords(interCoords, interRect);
			sortOn(interCoords);
			//获取新区域点集
			setCoords(inCoords, curRect, interRect);
			//将新进区域点进行排序
			sortOn(inCoords);
			//获取旧区域点集
			setCoords(outCoords, lastRect, interRect);
			//更新旧区域
			lastRect.copyFrom(curRect);
			return true;
		}
		
		private final function resetCoords():void
		{
			interRect.setEmpty();
			inCoords.length = 0;
			outCoords.length = 0;
			interCoords.length = 0;
			
			/****** 可以自行打开，用于计算和保存当前屏幕显示区域的信息
			centerCoords.length = 0;
			//*** ***/
		}
		
		/**
		 * 校正矩形的取值 
		 * @param rect 需要校正的矩形
		 */		
		private final function toRevise(rect:Rectangle):void
		{
			if(rect.left < 0) rect.left = 0;
			if(rect.right > col) rect.right = col;
			if(rect.top < 0) rect.top = 0;
			if(rect.bottom > row) rect.bottom = row;
		}
		
		private final function setCoords(coords:Vector.<Point>, rect:Rectangle, publicRect:Rectangle = null):void
		{
			coords.length = 0;
			var p :Point;;
			var px :int, py :int;
			var index :int = 0;
			for(py = rect.top; py < rect.bottom; py ++)
			{
				for(px = rect.left; px < rect.right; px ++)
				{
					p = new Point(px, py);
					if(null != publicRect)
					{
						if(false == publicRect.isEmpty())
						{
							if(publicRect.containsPoint(p)) continue;
						}
					}
					coords[index] = p;
					index ++;
				}
			}
		}
		
		private final function sortOn(coords:Vector.<Point>):void
		{
			if(0 == coords.length) return;
			//计算排序参考点
			var p :Point = new Point;
			if(interRect.isEmpty())
			{
				p.setTo(curRect.left + curRect.width * .5, curRect.top + curRect.height * .5);
			}
			else
			{
				var dx :int = lastRect.left - curRect.left;
				if(0 == dx) dx = lastRect.right - curRect.right;
				var dy :int = lastRect.top - curRect.top;
				if(0 == dy) dy = lastRect.bottom - curRect.bottom;
				if(0 == dx)
				{
					if(dy < 0)
					{
						p.setTo(interRect.left + interRect.width * .5, interRect.bottom);//bottom 4
					}
					else
					{
						p.setTo(interRect.left + interRect.width * .5, interRect.top);//top 0
					}
				}
				else if(0 == dy)
				{
					if(dx < 0)
					{
						p.setTo(interRect.right, interRect.top + interRect.height * .5);//right 2
					}
					else
					{
						p.setTo(interRect.left, interRect.top + interRect.height * .5);//left 6
					}
				}
				else
				{
					if(dx < 0)
					{
						if(dy < 0)
						{
							p.copyFrom(interRect.bottomRight);//east and sourth 3
						}
						else
						{
							p.setTo(interRect.right, interRect.top);//north and east 1
						}
					}
					else
					{
						if(dy < 0)
						{
							p.setTo(interRect.left, interRect.bottom);//sourth and weast 5
						}
						else
						{
							p.copyFrom(interRect.topLeft)//weast en north 7
						}
					}
				}
			}
			//排序
			var t :Point;
			var tmp :Array = [];
			var i :int = 0;
			var len :int = coords.length;
			for(i = 0; i < len; i ++)
			{
				t = coords.shift();
				t.offset(.5, .5);
				tmp[i] = {p:t, dis:Point.distance(p, t)};
			}
			tmp.sortOn('dis', Array.NUMERIC);
			for(i = 0; i < len; i ++)
			{
				coords[i] = tmp.shift().p;
				coords[i].offset(-.5, -.5);
			}
		}
	}
}