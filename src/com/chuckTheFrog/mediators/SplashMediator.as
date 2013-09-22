package com.chuckTheFrog.mediators
{
	import com.chuckTheFrog.views.SplashScreen;

	public class SplashMediator
	{
		private var view:SplashScreen;
		
		[ViewAdded]
		public function viewAdded(view:SplashScreen):void
		{
			this.view = view;
			trace("[Test1Mediator] Test1View Added");
		}
		
		[ViewRemoved]
		public function viewRemoved(view:SplashScreen):void
		{
			
			this.view = null;
			trace("[Test1Mediator] Test1View Removed");
		}
	}
}
