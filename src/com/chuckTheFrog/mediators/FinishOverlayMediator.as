package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.views.FinishOverlay;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class FinishOverlayMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		[Inject]
		public var gameModel:GameModel;
		
		private var eventMap:EventMap = new EventMap();
		private var view:FinishOverlay;
		
		[ViewAdded]
		public function viewAdded(view:FinishOverlay):void
		{
			this.view = view;
			trace("[TestAddMediator] TestAddView Added");
			
			eventMap.addMap(view.restartBtn, Event.TRIGGERED, restart);
			eventMap.addMap(view.menuBtn, Event.TRIGGERED, menu);
			eventMap.addMap(view.nextBtn, Event.TRIGGERED, next);
			view.stars.currentFrame=(gameModel.currentLevel.stars)
		}
		
		[ViewRemoved]
		public function viewRemoved(view:FinishOverlay):void
		{	
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[TestAddMediator] TestAddView Removed");
		}
		
		private function restart(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.RESTART, true);
			
		}
		private function menu(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.MENU, true);
			
		}
		private function next(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.NEXT, true);
			
		}
	}
}
