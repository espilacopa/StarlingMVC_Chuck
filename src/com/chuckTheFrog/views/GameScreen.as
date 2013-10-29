package com.chuckTheFrog.views
{	
	
	
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.GameBackground;
	import com.chuckTheFrog.gameElements.Hero;
	import com.chuckTheFrog.gameElements.TimerFrog;
	import com.chuckTheFrog.gameElements.bugs.CloudFlies;
	import com.chuckTheFrog.gameElements.powers.PowerTongue;
	import com.chuckTheFrog.models.GameModel;
	
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	
	public class GameScreen extends Sprite
	{
		[Inject]
		public var gameModel:GameModel;
		
		private var backgroundSprite:Sprite;
		private var background:Quad;
		public var birdButton:Button;
		private var _fliesCloud:CloudFlies;
		private var _bg:GameBackground;
		private var _currentPower:PowerTongue;
		private var _hero:Hero;
		private var _timer:TimerFrog;
		//private var _source:Quad;
		//private var _touch:Quad;
			
		public function get timerFrog():TimerFrog
		{
			return _timer;
		}

		public function get hero():Hero
		{
			return _hero;
		}

		public function get fliesCloud():CloudFlies
		{
			return _fliesCloud;
		}

		[PostConstruct]
		public function postConstruct():void
		{

			_bg = new GameBackground();
			this.addChild(_bg);
			
			
			_hero = new Hero();	
			this.addChild(_hero);
				
			_hero.y = stage.stageHeight -_hero.height
			_fliesCloud = new CloudFlies(stage.stageWidth-200,stage.stageHeight,gameModel.currentLevel.nbFlies,true)
			_fliesCloud.x = 200;
			_fliesCloud.y =  stage.stageHeight/2 - _fliesCloud.height/2;
			
			addChild(_fliesCloud)
			//_fliesCloud.addEventListener(GameEvent.HitFlie,tapFlie)
			//_fliesCloud.addEventListener(GameEvent.AllFliesHit,endGame)
			
			_timer = new TimerFrog()	
			addChild(_timer)
			
			/*_source = new Quad(3,3,0xff)
			_touch= new Quad(3,3,0xffff)
			addChild(_source)
			addChild(_touch)
			*/
			
			
		//	
			;
		}
		
		[PreDestroy]
		public function preDestroy():void
		{						
			// clean up
			_bg.dispose();
			_hero.dispose();
			_fliesCloud.dispose();
		//	_source.dispose();
		//	_touch.dispose();
		}
	}
}
