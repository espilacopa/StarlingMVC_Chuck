package com.bitcrew.views
{	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	
	public class Test3View extends Sprite
	{
		private var backgroundSprite:Sprite;
		private var background:Quad;
		public var birdButton:Button;
			
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			backgroundSprite = new Sprite();
			backgroundSprite.blendMode = BlendMode.NONE;
			
			background = new Quad(480, 320, 0x666666);
			backgroundSprite.addChild(background);
			
			addChild(backgroundSprite);
			
			
			birdButton = new Button( Game.assetManager.getTexture("starling_rocket") );
			birdButton.x = (Constants.stageWidth * 0.5) - birdButton.width * 0.5;
			birdButton.y = (Constants.stageHeight * 0.5) - birdButton.height * 0.5;
			addChild(birdButton);
		}
		
		[PreDestroy]
		public function preDestroy():void
		{						
			// clean up
			background.dispose();
			backgroundSprite.dispose();
		}
	}
}
