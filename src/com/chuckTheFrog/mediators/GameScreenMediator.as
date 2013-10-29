package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.powers.IPower;
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.views.FinishOverlay;
	import com.chuckTheFrog.views.GameScreen;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.events.Touch;

	public class GameScreenMediator 
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:GameScreen;
		private var _finishOverLay:FinishOverlay;
		private var _currentPower:IPower;
		private var _nextView:Class;
		
		private static var last:uint;
		private static var ticks:uint = 0;

		
		[Inject]
		public var gameModel:GameModel;
		private var _timer:Number;

		
		[ViewAdded]
		public function viewAdded(view:GameScreen):void
		{
			this.view = view;
			trace("[GameScreenMediator] Test3View Added");
			
			eventMap.addMap(view.fliesCloud, GameEvent.HitFlie, tapFlie);
			eventMap.addMap(gameModel.mainPower, GameEvent.MAINSHOOTEND, endMainShoot);
			eventMap.addMap(view.fliesCloud, GameEvent.AllFliesHit, endGame);
			start()
		}
		
		private function updateTimer($event:Event):void
		{
				ticks++;
				var now:uint = getTimer();
				var delta:uint = now - last;
				var fps:Number = 0
				//if (delta >= 1000) {
					fps=  ticks / delta * 1000;
					ticks = 0;
					last = now;
				//}
			
			_timer -= 1/fps;
		
			view.timerFrog.setTimer(_timer)
			if(_timer < 1)endGame()
		}
		private function stop():void{
			view.fliesCloud.unactive()
			eventMap.removeAllMappedEvents();
		}
		private function start():void
		{
			_timer = int(gameModel.currentLevel.timer)
			view.fliesCloud.active()
			last = getTimer()
			eventMap.addMap(view, Event.ENTER_FRAME, updateTimer);
		}
		private function endMainShoot($e:Event):void
		{
			// TODO Auto Generated method stub
			view.hero.endShoot()
		}
		
		[ViewRemoved]
		public function viewRemoved(view:GameScreen):void
		{
			_finishOverLay.dispose();
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[GameScreenMediator] Test3View Removed");
		}
		
		private function endGame($e:Event=null):void
		{
			gameModel.currentLevel.hitFlies = gameModel.currentLevel.nbFlies-view.fliesCloud.tabFlies.length;
			gameModel.currentLevel.valided = (view.fliesCloud.tabFlies.length==0);
			gameModel.currentLevel.timeLeft = view.timerFrog.getTimer();
			gameModel.currentLevel.stars =int( (gameModel.currentLevel.hitFlies*100/gameModel.currentLevel.nbFlies)/30);
			
			_finishOverLay = new FinishOverlay();
			stop()
			
			dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, _finishOverLay)
			
			eventMap.addMap(dispatcher,GameEvent.RESTART, restart);
			//eventMap.addMap(dispatcher,GameEvent.NEXT, next);
		}
		
		private function tapFlie($event:Event):void
		{
			
			var touch:Touch = $event.data as Touch;
			if (touch)
			{
				var localPos:Point = touch.getLocation(view);
				var px:Number = $event.data.globalX-(view.hero.x+gameModel.mainPower.x ) ;
				var py:Number = $event.data.globalY-(view.hero.y+gameModel.mainPower.y) ;
				var rad:Number = Math.atan2(py, px);
				var deg:Number = rad * (180 / Math.PI);
				var dist:Number = Math.sqrt(px*px + py*py);
				view.hero.shoot()
				gameModel.mainPower.usePower(view.fliesCloud,dist,rad)
				/*
				var source:Quad = new Quad(3,3,0xff)
				var touchM:Quad = new Quad(3,3,0xffff)
				view.addChild(source)
				view.addChild(touchM)
				touchM.x = $event.data.globalX
				touchM.y = $event.data.globalY				
				source.x = 	view.hero.x+gameModel.mainPower.x
				source.y = 	view.hero.y+gameModel.mainPower.y*/
			}
			//dispatcher.dispatchEventWith(GameEvent.ADDVIEW, true, testAddView);
		}
		public function restart($event:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.REMOVEVIEW, true, _finishOverLay)
			view.fliesCloud.restart(gameModel.currentLevel.nbFlies)
			eventMap.addMap(view.fliesCloud, GameEvent.HitFlie, tapFlie);
			eventMap.addMap(gameModel.mainPower, GameEvent.MAINSHOOTEND, endMainShoot);
			eventMap.addMap(view.fliesCloud, GameEvent.AllFliesHit, endGame);
			view.fliesCloud.active()
				start()
		}
	}
}
