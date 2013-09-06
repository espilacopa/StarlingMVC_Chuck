package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.views.GameScreen;
	import com.chuckTheFrog.views.TestAddView;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import events.NavigationEvent;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class GameScreenMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:GameScreen;
		private var _testAddView:TestAddView;
		private var _currentPower:Object;
		private var _nextView:Class;
		
		[ViewAdded]
		public function viewAdded(view:GameScreen):void
		{
			this.view = view;
			trace("[GameScreenMediator] Test3View Added");
			
			_testAddView = new TestAddView();
			eventMap.addMap(view.fliesCloud, GameEvent.HitFlie, tapFlie);
			
			eventMap.addMap(view.fliesCloud, GameEvent.AllFliesHit, endGame);
			//_fliesCloud.addEventListener(GameEvent.HitFlie,tapFlie)
			//_fliesCloud.addEventListener(GameEvent.AllFliesHit,endGame)
		}
		
		[ViewRemoved]
		public function viewRemoved(view:GameScreen):void
		{
			_testAddView.dispose();
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[GameScreenMediator] Test3View Removed");
		}
		
		private function endGame($e:Event):void
		{
			trace("endGame")
			dispatchEventWith(GameEvent.CHANGEVIEW, false, nextView)
		}
		
		private function tapFlie($event:Event):void
		{
			trace("[GameScreenMediator] tabFlies")
			var px:Number = $event.data.globalX-(view.hero.x+view.hero.tongue.x ) ;
			var py:Number = $event.data.globalY-(view.hero.tongue.y) ;
			var rad:Number = Math.atan2(py, px);
			var deg:Number = rad * (180 / Math.PI);
			var dist:Number = Math.sqrt(px*px + py*py);
			view.hero.shoot(dist,rad)
			_currentPower.usePower(view.fliesCloud)
			//dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, testAddView);
		}
	}
}
