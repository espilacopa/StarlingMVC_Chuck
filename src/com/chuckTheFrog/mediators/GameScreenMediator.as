package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.powers.IPower;
	import com.chuckTheFrog.gameElements.powers.PowerTongue;
	import com.chuckTheFrog.models.GameModel;
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
		private var _testAddView:TestAddView;
		private var _currentPower:IPower;
		private var _nextView:Class;
		
		[Inject]
		public var gameModel:GameModel;

		
		[ViewAdded]
		public function viewAdded(view:GameScreen):void
		{
			this.view = view;
			trace("[GameScreenMediator] Test3View Added");
			
			_testAddView = new TestAddView();
			eventMap.addMap(view.fliesCloud, GameEvent.HitFlie, tapFlie);
			eventMap.addMap(view, GameEvent.MAINSHOOTEND, endMainShoot);
			eventMap.addMap(view.fliesCloud, GameEvent.AllFliesHit, endGame);
			gameModel.mainPower = new PowerTongue()
		}
		
		private function endMainShoot($e:Event):void
		{
			// TODO Auto Generated method stub
			view.hero.endShoot()
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
			dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, _testAddView)
		}
		
		private function tapFlie($event:Event):void
		{
			trace("[GameScreenMediator] tabFlies")
			var px:Number = $event.data.globalX-(view.hero.x+gameModel.mainPower.x ) ;
			var py:Number = $event.data.globalY-(gameModel.mainPower.y) ;
			var rad:Number = Math.atan2(py, px);
			var deg:Number = rad * (180 / Math.PI);
			var dist:Number = Math.sqrt(px*px + py*py);
			view.hero.shoot()
			gameModel.mainPower.usePower(view.fliesCloud,dist,rad)
			//dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, testAddView);
		}
	}
}
