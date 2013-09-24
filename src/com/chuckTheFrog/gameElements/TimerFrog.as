package com.chuckTheFrog.gameElements
{
	import com.chuckTheFrog.assets.Assets;
	import com.chuckTheFrog.views.Game;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class TimerFrog extends Sprite
	{
		private var _bkg:Image;
		private var _timer:TextField;
		public function TimerFrog()
		{
			super();
			_bkg = new Image(Game.assetManager.getTexture("bkgTimer0000"))
			this.addChild(_bkg);
			_timer = Assets.factoryText(100, 100, "132", "CarterOne", 60, Color.WHITE,HAlign.CENTER,VAlign.CENTER)
			
			addChild(_timer)
		}
		public function setTimer($time:int):void
		{
			_timer.text = $time.toString()
		}
		
		public function getTimer():int
		{
			// TODO Auto Generated method stub
			return _timer.text as int;
		}
	}
}