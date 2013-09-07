package com.chuckTheFrog.gameElements.powers
{
	import com.chuckTheFrog.events.GameEvent;
	import com.chuckTheFrog.gameElements.bugs.ICloudFlies;
	import com.chuckTheFrog.views.Game;
	
	import flash.geom.Rectangle;
	
	import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	

	public class PowerTongue extends Power implements IPower
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		private var _tongue:Scale9Image;
		private var _distT:Number;
		
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
		}
		override public function usePower($Cloud:ICloudFlies,$dist:Number,$ang:Number):void{
			trace("[tongePower] shoot")
			_tongue.visible = true
			_distT = $dist+_tongue.pivotX+_tongue.x
			_tongue.width = _distT
			_tongue.rotation = $ang		
			dispatcher.addEventListener(Event.ENTER_FRAME,moveTongue)
			var cloudA:Array = $Cloud.getHitFlies(_impactPower)
			$Cloud.destroyFlies(cloudA.splice(0,1))
		}
		override public function get impactPower():int
		{
			return _impactPower;
		}
		
		private function moveTongue($e:Event):void
		{
			trace("tonge move")
			_tongue.width -= _speedTongue
			_tongue.alpha =	_tongue.width/_distT+.1	
			if(_tongue.width<20){
				_tongue.visible = false
				removeEventListener(Event.ENTER_FRAME,moveTongue)	
				dispatcher.dispatchEventWith(GameEvent.MAINSHOOTEND, true)
			}
		}
	}
}