package com.chuckTheFrog.views
{
	import com.chuckTheFrog.assets.Assets;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	
	import utils.CurvedText;

	
	public class FinishOverlay extends Sprite
	{
		private var birdSheet:Image;
		public var restartBtn:Button;
		public var nextBtn:Button;
		public var menuBtn:Button;
					
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			birdSheet = new Image( Game.assetManager.getTexture("finishBkg0000") );
			addChild(birdSheet);
			restartBtn = new Button(Game.assetManager.getTexture("restartBt0000") )
			addChild(restartBtn)
			menuBtn = new Button(Game.assetManager.getTexture("menuBt0000") )
			addChild(menuBtn)
			nextBtn = new Button(Game.assetManager.getTexture("nextBt0000") )
			addChild(nextBtn)
			
			var text:CurvedText = Assets.curvedText("finish","CarterOne",16,Color.WHITE,10,-40,40)
				addChild(text)
			
		}
		
		[PreDestroy]
		public function preDestroy():void
		{						
			// clean up
			birdSheet.dispose();
			nextBtn.dispose();
			menuBtn.dispose();
			restartBtn.dispose();
		}
		
		public function FinishOverlay(){
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			restartBtn.y = nextBtn.y = menuBtn.y = birdSheet.height - restartBtn.height*.8
			var indent:Number = (birdSheet.width-restartBtn.width/2)/4
			restartBtn.x = indent
			menuBtn.x = indent*2
			nextBtn.x = indent*3
			this.x = (Constants.stageWidth * 0.5) - this.width * 0.5 ;
			this.y = (Constants.stageHeight * 0.5) - this.height * 0.5;
		
		}
	}
}
