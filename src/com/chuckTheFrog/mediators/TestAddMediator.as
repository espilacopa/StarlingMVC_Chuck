package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.views.Welcome;
	import com.chuckTheFrog.views.FinishScreen;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class TestAddMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:FinishScreen;
		private var nextView:Class;
		
		[ViewAdded]
		public function viewAdded(view:FinishScreen):void
		{
			this.view = view;
			trace("[TestAddMediator] TestAddView Added");
			
			nextView = Welcome;
			eventMap.addMap(view.returnBtn, Event.TRIGGERED, birdClicked);
		}
		
		[ViewRemoved]
		public function viewRemoved(view:FinishScreen):void
		{	
			nextView = null;
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[TestAddMediator] TestAddView Removed");
		}
		
		private function birdClicked(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.CHANGEVIEW, false, nextView);
		}
	}
}
