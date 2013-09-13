package com.chuckTheFrog.gameElements.powers
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.bugs.ICloudFlies;
	import com.chuckTheFrog.views.Game;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import flash.geom.Rectangle;
	
	import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	

	public class PowerTongue extends Power implements IPower
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		
		private var _tongue:Scale9Image;
		private var _distT:Number;
		private var _average:int = 2
		private var _speedTongue:Number = 50
		public function PowerTongue()
		{
			super();
			_impactPower = 30
			_type = 1
			var textureTongu: Texture = Game.assetManager.getTexture("tongue0000")
			_tongue = new Scale9Image(new Scale9Textures(textureTongu,new Rectangle((textureTongu.width*.75),0,1,textureTongu.height)));
			_tongue.alpha =0
			_tongue.pivotX=(textureTongu.width*.42)
			addChild(_tongue)
		}
		override public function usePower($Cloud:ICloudFlies,$dist:Number,$ang:Number):void{
			_tongue.visible = true
			_distT = $dist+_tongue.pivotX+_tongue.x
			_tongue.width = _distT
			_tongue.rotation = $ang		
			_tongue.alpha = 1
			var tween:Tween = new Tween(_tongue, .3, Transitions.EASE_IN_OUT);
			tween.animate("width", 0)
			tween.fadeTo(0);    // equivalent to 'animate("alpha", 0)'
			tween.onComplete = moveTongue
			Starling.juggler.add(tween);
			
			
			var cloudA:Array = $Cloud.getHitFlies(_impactPower)
			$Cloud.destroyFlies(cloudA.splice(0,_average))
		}
		override public function get impactPower():int
		{
			return _impactPower;
		}
		
		private function moveTongue():void
		{
			trace("tonge move")
			_tongue.visible = false
			Starling.juggler.removeTweens(_tongue);;
			dispatchEventWith(GameEvent.MAINSHOOTEND)
			
		}
	}
}