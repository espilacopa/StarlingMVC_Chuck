package 
{
	import flash.filesystem.File;
	
	import starling.errors.AbstractClassError;
	
	public class Constants
	{
		public function Constants() { throw new AbstractClassError(); }
		
		private static var _appDir:File = File.applicationDirectory; 
		private static var _stageWidth:int;
		private static var _stageHeight:int;
		private static var _aspectRatio:Number;
		
		private static var _contentScaleFactor:Number = 1;
		private static var _normalizedContentScaleFactor:Number = 1;
		private static var _screenWidth:int = 0;
		private static var _screenHeight:int = 0;
		private static var _viewPortWidth:int = 0;
		private static var _viewPortHeight:int = 0;
		private static var _isIPhone5Retina:Boolean = false;
		private static var _xOffsetLeft:Number;
		private static var _xOffsetRight:Number;
		
		public static function get appDir():File
		{
			return _appDir;
		}
		
		public static function get contentScaleFactor():Number
		{
			return _contentScaleFactor;
		}

		public static function set contentScaleFactor(value:Number):void
		{
			_contentScaleFactor = value;
		}

		public static function get screenWidth():int
		{
			return _screenWidth;
		}

		public static function set screenWidth(value:int):void
		{
			_screenWidth = value;
		}

		public static function get screenHeight():int
		{
			return _screenHeight;
		}

		public static function set screenHeight(value:int):void
		{
			_screenHeight = value;
		}

		public static function get viewPortWidth():int
		{
			return _viewPortWidth;
		}

		public static function set viewPortWidth(value:int):void
		{
			_viewPortWidth = value;
		}

		public static function get viewPortHeight():int
		{
			return _viewPortHeight;
		}

		public static function set viewPortHeight(value:int):void
		{
			_viewPortHeight = value;
		}

		public static function get normalizedContentScaleFactor():Number
		{
			return _normalizedContentScaleFactor;
		}

		public static function set normalizedContentScaleFactor(value:Number):void
		{
			_normalizedContentScaleFactor = value;
		}

		public static function get stageWidth():int
		{
			return _stageWidth;
		}

		public static function set stageWidth(value:int):void
		{
			_stageWidth = value;
		}

		public static function get stageHeight():int
		{
			return _stageHeight;
		}

		public static function set stageHeight(value:int):void
		{
			_stageHeight = value;
		}

		public static function get aspectRatio():Number
		{
			return _aspectRatio;
		}

		public static function set aspectRatio(value:Number):void
		{
			_aspectRatio = value;
		}

		public static function get isIPhone5Retina():Boolean
		{
			return _isIPhone5Retina;
		}

		public static function set isIPhone5Retina(value:Boolean):void
		{
			_isIPhone5Retina = value;
		}

		public static function get xOffsetLeft():Number
		{
			return _xOffsetLeft;
		}

		public static function set xOffsetLeft(value:Number):void
		{
			_xOffsetLeft = value;
		}

		public static function get xOffsetRight():Number
		{
			return _xOffsetRight;
		}

		public static function set xOffsetRight(value:Number):void
		{
			_xOffsetRight = value;
		};
	}
}
