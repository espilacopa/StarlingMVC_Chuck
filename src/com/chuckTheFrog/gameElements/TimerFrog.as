package com.chuckTheFrog.gameElements
{
	import com.chuckTheFrog.assets.Assets;
	import com.chuckTheFrog.views.Game;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class TimerFrog extends Sprite
	{
		private var _bkg:Image;
		public function TimerFrog()
		{
			super();
			_bkg = new Image(Game.assetManager.getTexture("bkgTimer0000"))
			this.addChild(_bkg);
			addChild(Assets.factoryText(100, 100, "120", "Ubuntu", 80, Color.RED,HAlign.RIGHT,VAlign.BOTTOM))
		}
	}
}