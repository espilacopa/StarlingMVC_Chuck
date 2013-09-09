package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.powers.PowerTongue;
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.views.GameScreen;
	import com.chuckTheFrog.views.Welcome;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class WelcomeMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		[Inject]
		public var gameModel:GameModel;
		
		private var eventMap:EventMap = new EventMap();
		private var view:Welcome;
		private var nextView:Class;
		
		[ViewAdded]
		public function viewAdded(view:Welcome):void
		{
			this.view = view;
			trace("[Test2Mediator] Test2View Added");
			
			nextView = GameScreen;
			eventMap.addMap(view.birdButton, Event.TRIGGERED, birdClicked);
			gameModel.mainPower = new PowerTongue()
		}
		
		[ViewRemoved]
		public function viewRemoved(view:Welcome):void
		{	
			nextView = null;
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[Test2Mediator] Test2View Removed");
		}
		
		private function birdClicked(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.CHANGEVIEW, false, nextView);
		}
	}
}
