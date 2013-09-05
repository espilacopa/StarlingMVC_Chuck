package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.views.Test3View;
	import com.chuckTheFrog.views.TestAddView;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class Test3Mediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:Test3View;
		private var testAddView:TestAddView;
		
		[ViewAdded]
		public function viewAdded(view:Test3View):void
		{
			this.view = view;
			trace("[Test3Mediator] Test3View Added");
			
			testAddView = new TestAddView();
			eventMap.addMap(view.fliesCloud, Event.TRIGGERED, birdClicked);
		}
		
		[ViewRemoved]
		public function viewRemoved(view:Test3View):void
		{
			testAddView.dispose();
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[Test3Mediator] Test3View Removed");
		}
		
		private function birdClicked(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, testAddView);
		}
	}
}
