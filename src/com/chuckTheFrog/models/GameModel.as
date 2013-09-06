package com.chuckTheFrog.models
{
	import com.chuckTheFrog.gameElements.powers.IPower;
	import com.creativebottle.starlingmvc.binding.Bindings;
	
	public class GameModel
	{
		[Bindings]
		public var bindings:Bindings;
		
		///////////////////////////////////////////////////////////////////////
		// Public Properties
	
		public var score:int;
		public var accuracy:int;
		public var correctInARow:int;
		public var powerUpActive:Boolean;
		public var mainPower:IPower
		public var nextView:Class;
	}
}
