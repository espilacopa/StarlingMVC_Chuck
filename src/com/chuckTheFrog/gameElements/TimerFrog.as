package com.chuckTheFrog.gameElements
{
	import com.chuckTheFrog.views.Game;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class TimerFrog extends Sprite
	{
		private var _bkg:Image;
		public function TimerFrog()
		{
			super();
			_bkg = new Image(Game.assetManager.getTexture("bkgTimer0000"))
			this.addChild(_bkg);
		}
	}
}