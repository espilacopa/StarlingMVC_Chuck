package com.chuckTheFrog.views
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;

	
	public class FinishScreen extends Sprite
	{
		private var birdSheet:Image;
		public var returnBtn:Button;
					
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			birdSheet = new Image( Game.assetManager.getTexture("starling_sheet") );
			addChild(birdSheet);
			
			
			this.x = (Constants.stageWidth * 0.5) - this.width * 0.5 + 100;
			this.y = (Constants.stageHeight * 0.5) - this.height * 0.5;
		}
		
		[PreDestroy]
		public function preDestroy():void
		{						
			// clean up
			birdSheet.dispose();
			returnBtn.dispose();
		}
	}
}
