package com.chuckTheFrog.controllers
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.models.LevelModel;
	import com.chuckTheFrog.views.Game;
	import com.chuckTheFrog.views.GameScreen;
	import com.chuckTheFrog.views.SplashScreen;
	import com.chuckTheFrog.views.Welcome;
	import com.creativebottle.starlingmvc.events.EventMap;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class GameController
	{			
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var viewManager:ViewManager;
		
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var _eventMap:EventMap = new EventMap();
		private var _levelManager:LevelManager
			
		[PostConstruct]
		public function postConstruct():void
		{			
			viewManager.setView(SplashScreen);
		}
		[EventHandler(event="GameEvent.ASSETSINIT", properties="data")]
		public function setGame($data:Object):void
		{
			
			viewManager.setView(Welcome);
			_eventMap.addMap(dispatcher,GameEvent.MENU, callMenu);
			_eventMap.addMap(dispatcher,GameEvent.NEXT, nextLevel);
			_levelManager = new LevelManager();
			
			gameModel.currentLevel = _levelManager.getLevel(0)
		}
		
		private function nextLevel($event:Event):void
		{
			if(_levelManager.getLevel(gameModel.currentLevel.id+1)){
				gameModel.currentLevel = _levelManager.getLevel(gameModel.currentLevel.id+1);
				viewManager.setView(GameScreen)
			}else viewManager.setView(Welcome);
			
		}
		
		private function callMenu($event:Event):void
		{
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