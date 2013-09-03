package com.bitcrew.mediators
{
	import com.bitcrew.events.GameEvent;
	import com.bitcrew.views.Test2View;
	import com.bitcrew.views.Test3View;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class Test2Mediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:Test2View;
		private var nextView:Class;
		
		[ViewAdded]
		public function viewAdded(view:Test2View):void
		{
			this.view = view;
			trace("[Test2Mediator] Test2View Added");
			
			nextView = Test3View;
			eventMap.addMap(view.birdButton, Event.TRIGGERED, birdClicked);
		}
		
		[ViewRemoved]
		public function viewRemoved(view:Test2View):void
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
