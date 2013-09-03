package com.chuckTheFrog.providers
{
	import com.chuckTheFrog.controllers.GameController;
	import com.chuckTheFrog.mediators.*;
	import com.chuckTheFrog.models.GameModel;
	import com.creativebottle.starlingmvc.beans.BeanProvider;
	
	public class GameObjectProvider extends BeanProvider
	{
		public function GameObjectProvider()
		{
			beans = [new GameModel(),
					new GameMediator(),
					new Test1Mediator(),
					new Test2Mediator(),
					new Test3Mediator(),
					new TestAddMediator(),
					new GameController()];
		}
	}
}