package com.chuckTheFrog.controllers
{
	import com.creativebottle.starlingmvc.views.ViewManager;

	import com.chuckTheFrog.models.*;
	import com.chuckTheFrog.views.*;

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
