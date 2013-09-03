package com.bitcrew.views
{	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	
	
	public class Test2View extends Sprite
	{
		private var backgroundSprite:Image;
		public var birdButton:Button;
			
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			backgroundSprite =  new Image( Game.assetManager.getTexture("bgWelcome"))
			backgroundSprite.blendMode = BlendMode.NONE;
			addChild(backgroundSprite);
			
			
			birdButton = new Button( Game.assetManager.getTexture("FrogStart0000") );
			birdButton.x = (Constants.stageWidth * 0.5) - birdButton.width * 0.5;
			birdButton.y = (Constants.stageHeight * 0.5) - birdButton.height * 0.5;
			addChild(birdButton);
		}
				
		[PreDestroy]
		public function preDestroy():void
		{
			// clean up
			backgroundSprite.dispose();
			birdButton.dispose();
		}
	}
}
