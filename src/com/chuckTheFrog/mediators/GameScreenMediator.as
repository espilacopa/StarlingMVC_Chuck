package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.views.GameScreen;
	import com.chuckTheFrog.views.TestAddView;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class GameScreenMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:GameScreen;
		private var testAddView:TestAddView;
		private var _currentPower:Object;
		
		[ViewAdded]
		public function viewAdded(view:GameScreen):void
		{
			this.view = view;
			trace("[GameScreenMediator] Test3View Added");
			
			testAddView = new TestAddView();
			eventMap.addMap(view.fliesCloud, Event.TRIGGERED, tapFlie);
			//_fliesCloud.addEventListener(GameEvent.HitFlie,tapFlie)
			//_fliesCloud.addEventListener(GameEvent.AllFliesHit,endGame)
		}
		
		[ViewRemoved]
		public function viewRemoved(view:GameScreen):void
		{
			testAddView.dispose();
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[GameScreenMediator] Test3View Removed");
		}
		
		private function tapFlie($event:Event):void
		{
			trace("[GameScreenMediator] tabFlies")
			var px:Number = $event.data.globalX-(view.hero.x+view.hero.tongue.x ) ;
			var py:Number = $event.data.globalY-(view.hero.tongue.y) ;
			/*	_touch.x = $event.data.globalX
			_touch.y = $event.data.globalY	
			
			_source.x = 	_hero.x+_hero.tongue.x
			_source.y = 	_hero.y+_hero.tongue.y*/
			// rotation du trait vers la position de la souris
			var rad:Number = Math.atan2(py, px);// calcul de l'angle entre 2 points en radian
			var deg:Number = rad * (180 / Math.PI);// conversion en degrée
			// étirement du trait sur la position de la souris
			var dist:Number = Math.sqrt(px*px + py*py);// calcul de la distance entre 2 points
			view.hero.shoot(dist,rad)
			_currentPower.usePower(view.fliesCloud)
			dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, testAddView);
		}
	}
}
