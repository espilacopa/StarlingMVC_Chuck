package com.bitcrew.mediators
{
	import com.bitcrew.views.Test1View;

	public class Test1Mediator
	{
		private var view:Test1View;
		
		[ViewAdded]
		public function viewAdded(view:Test1View):void
		{
			this.view = view;
			trace("[Test1Mediator] Test1View Added");
		}
		
		[ViewRemoved]
		public function viewRemoved(view:Test1View):void
		{
			this.view = null;
			trace("[Test1Mediator] Test1View Removed");
		}
	}
}
