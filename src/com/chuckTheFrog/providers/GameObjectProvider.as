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
			trace(">>>la")
			beans = [new GameModel(),
					new GameMediator(),
					new SplashMediator(),
					new WelcomeMediator(),
					new GameScreenMediator(),
					new FinishOverlayMediator(),
					new GameController()];
		}
	}
}