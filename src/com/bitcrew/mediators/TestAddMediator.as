package com.bitcrew.mediators
{
	import com.bitcrew.events.GameEvent;
	import com.bitcrew.views.Test2View;
	import com.bitcrew.views.TestAddView;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class TestAddMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:TestAddView;
		private var nextView:Class;
		
		[ViewAdded]
		public function viewAdded(view:TestAddView):void
		{
			this.view = view;
			trace("[TestAddMediator] TestAddView Added");
			
			nextView = Test2View;
			eventMap.addMap(view.returnBtn, Event.TRIGGERED, birdClicked);
		}
		
		[ViewRemoved]
		public function viewRemoved(view:TestAddView):void
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
