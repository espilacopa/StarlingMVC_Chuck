package com.chuckTheFrog.views
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	
	public class TemplateView extends Sprite
	{	
		[Inject]
		public var viewManager:ViewManager;
		
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		[PostConstruct]
		public function postConstruct():void
		{
			// add content here
		}
		
		[PreDestroy]
		public function preDestroy():void
		{
			// clean up
		}
	}
}