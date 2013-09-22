package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.views.FinishOverlay;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class FinishOverlayMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:FinishOverlay;
		
		[ViewAdded]
		public function viewAdded(view:FinishOverlay):void
		{
			this.view = view;
			trace("[TestAddMediator] TestAddView Added");
			
			eventMap.addMap(view.restartBtn, Event.TRIGGERED, restart);
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
			trace("restart")
			dispatcher.dispatchEventWith(GameEvent.RESTART, true);
			
		}
	}
}
