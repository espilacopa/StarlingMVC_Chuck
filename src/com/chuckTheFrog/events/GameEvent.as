package com.chuckTheFrog.events
{
	import starling.events.Event;

	public class GameEvent extends starling.events.Event
	{
		public static const ADDVIEW:String = "add_view";
		public static const CHANGEVIEW:String = "change_view";
		public static const HitFlie:String = "game.hitflie";
		public static const AllFliesHit:String= "game.allflieshit";
		public static const ENDGAME:String= "game.endgame";
		public static var MAINSHOOTEND:String="game.mainshootend";
		
		private var mResult:Boolean;
		
		public function GameEvent(type:String, result:Boolean, bubbles:Boolean=false)
		{
			super(type, bubbles);
			mResult = result;
		}
		
		public function get result():Boolean { return mResult; }
	}
}
