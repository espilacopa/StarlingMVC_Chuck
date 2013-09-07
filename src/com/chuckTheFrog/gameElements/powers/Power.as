package com.chuckTheFrog.gameElements.powers
{
	import com.chuckTheFrog.gameElements.bugs.ICloudFlies;
	
	import starling.display.Sprite;
	

	public class Power extends Sprite implements IPower
	{
		protected var _impactPower:int
		protected var _type:int
		public function Power()
		{
		}
		
		public function get type():int
		{
			return _type;
		}

		public function get impactPower():int
		{
			return _impactPower;
		}

		public function usePower($Cloud:ICloudFlies,$dist:Number,$ang:Number):void
		{
		}
	}
}