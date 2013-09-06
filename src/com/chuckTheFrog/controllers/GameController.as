package com.chuckTheFrog.controllers
{
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.views.*;
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
			// set up code here
			
			//load the default view
			viewManager.setView(SplashScreen);
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
				
		[PreDestroy]
		public function preDestroy():void
		{
			// tear down code here
		}
	}
}