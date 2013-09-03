package com.bitcrew.controllers
{
	import com.creativebottle.starlingmvc.views.ViewManager;

	import com.bitcrew.models.*;
	import com.bitcrew.views.*;

	public class TemplateController
	{
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var viewManager:ViewManager;
		
		[PostConstruct]
		public function postConstruct():void
		{
			// set up code here
		}
		
		[PreDestroy]
		public function preDestroy():void
		{
			// tear down code here
		}
	}
}
