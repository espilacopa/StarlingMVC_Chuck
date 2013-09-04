package com.chuckTheFrog.views
{	
	
	
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.GameBackground;
	import com.chuckTheFrog.gameElements.Hero;
	import com.chuckTheFrog.gameElements.TimerFrog;
	import com.chuckTheFrog.gameElements.bugs.CloudFlies;
	import com.chuckTheFrog.gameElements.powers.PowerTongue;
	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	public class Test3View extends Sprite
	{
		private var backgroundSprite:Sprite;
		private var background:Quad;
		public var birdButton:Button;
		private var _fliesCloud:CloudFlies;
		private var _bg:GameBackground;
		private var _currentPower:PowerTongue;
		private var _hero:Hero;
		private var _timer:TimerFrog;
		private var _source:Quad;
		private var _touch:Quad;
			
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			
			
			_currentPower = new PowerTongue()
			_bg = new GameBackground();
			this.addChild(_bg);
			
			
			_hero = new Hero();	
			this.addChild(_hero);
			/*
			var newHeight:Number =_hero.height
			if(_hero.height>(.4*stage.stageHeight)){
			newHeight = _hero.height = _hero.height/2
			_hero.width = _hero.width/2
			}
			_hero.y = stage.stageHeight -newHeight-10
			*/		
			_hero.y = stage.stageHeight -_hero.height
			_fliesCloud = new CloudFlies(stage.stageWidth-200,stage.stageHeight,Number(Game.assetManager.getXML("levels").@nbFlies))
			_fliesCloud.x = 200;
			_fliesCloud.y =  stage.stageHeight/2 - _fliesCloud.height/2;
			_fliesCloud.active()
			addChild(_fliesCloud)
			//_fliesCloud.addEventListener(GameEvent.HitFlie,tapFlie)
			//_fliesCloud.addEventListener(GameEvent.AllFliesHit,endGame)
			/*
			_timer = new TimerFrog()	
			addChild(_timer)*/
			
			_source = new Quad(3,3,0xff)
			_touch= new Quad(3,3,0xffff)
			addChild(_source)
			addChild(_touch)
			
			
			
		//	addChild(Assets.factoryText(100, 100, "120", "Ubuntu", 80, Color.RED,HAlign.RIGHT,VAlign.BOTTOM))
			;
		}
		
		[PreDestroy]
		public function preDestroy():void
		{						
			// clean up
			background.dispose();
			backgroundSprite.dispose();
		}
	}
}
