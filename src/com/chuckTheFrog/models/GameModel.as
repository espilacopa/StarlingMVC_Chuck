package com.chuckTheFrog.models
{

	import com.chuckTheFrog.gameElements.powers.Power;
	import com.chuckTheFrog.gameElements.powers.PowerTongue;
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
		public var mainPower:Power 
		public var nextView:Class;
		public var currentLevel:LevelModel
	}
}
