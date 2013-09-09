package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.gameElements.powers.PowerTongue;
	import com.chuckTheFrog.views.Game;

	public class GameMediator
	{
		private var view:Game;
		
		[ViewAdded]
		public function viewAdded(view:Game):void
		{
			this.view = view;
			trace("GameMediator::GameView Added");
		}
		
		[ViewRemoved]
		public function viewRemoved(view:Game):void
		{
			this.view = null;
			trace("GameMediator::GameView Removed");
		}
	}
}