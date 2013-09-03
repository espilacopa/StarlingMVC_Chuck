package com.bitcrew.providers
{
	import com.bitcrew.controllers.GameController;
	import com.bitcrew.mediators.*;
	import com.bitcrew.models.GameModel;
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