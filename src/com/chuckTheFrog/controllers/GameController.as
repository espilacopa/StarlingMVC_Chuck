package com.chuckTheFrog.controllers
{
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.models.LevelModel;
	import com.chuckTheFrog.views.Game;
	import com.chuckTheFrog.views.SplashScreen;
	import com.chuckTheFrog.views.Welcome;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.display.Sprite;

	public class GameController
	{			
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var viewManager:ViewManager;
				
		[PostConstruct]
		public function postConstruct():void
		{			
			viewManager.setView(SplashScreen);
		}
		[EventHandler(event="GameEvent.ASSETSINIT", properties="data")]
		public function setGame($data:Object):void
		{
			var level:LevelModel = new LevelModel()
				level.setLevelFromXml(Game.assetManager.getXML("levels").level.(@id=="0"))
			gameModel.currentLevel = level
			viewManager.setView(Welcome);
		}
		[EventHandler(event="GameEvent.CHANGEVIEW", properties="data")]
		public function changeView(data:Class):void
		{
			viewManager.setView(data);
		}
		
		[EventHandler(event="GameEvent.ADDVIEW", properties="data, stopImmediatePropagation")]
		public function addView(data:Sprite, stopEventPropagation:Function):void
		{
			stopEventPropagation();
			viewManager.addView(data);
		}
		[EventHandler(event="GameEvent.REMOVEVIEW", properties="data, stopImmediatePropagation")]
		public function removeView(data:Sprite, stopEventPropagation:Function):void
		{
			stopEventPropagation();
			viewManager.removeView(data);
		}	
		[PreDestroy]
		public function preDestroy():void
		{
			// tear down code here
		}
	}
}