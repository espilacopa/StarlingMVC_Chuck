package com.chuckTheFrog.views
{	
	import com.chuckTheFrog.gameElements.bugs.CloudFlies;
	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	
	
	public class Welcome extends Sprite
	{
		private var backgroundSprite:Image;
		public var birdButton:Button;
			
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			backgroundSprite =  new Image( Game.assetManager.getTexture("bgWelcome"))
				backgroundSprite.width = Constants.stageWidth
				backgroundSprite.height = Constants.stageHeight
				backgroundSprite.blendMode = BlendMode.NONE;
			addChild(backgroundSprite);
			
			
			birdButton = new Button( Game.assetManager.getTexture("FrogStart0000") );
			birdButton.x = (Constants.stageWidth * 0.5) - birdButton.width * 0.5;
			birdButton.y = (Constants.stageHeight * 0.5) - birdButton.height * 0.5;
			addChild(birdButton);
			
			
			var fliesCloud:CloudFlies = new CloudFlies(100,100,3)
			
			fliesCloud.x = stage.stageWidth/2 - fliesCloud.width/2;
			fliesCloud.y =  stage.stageHeight/2 - fliesCloud.height/2;
			fliesCloud.active()
			addChild(fliesCloud)
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
