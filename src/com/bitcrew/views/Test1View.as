package com.bitcrew.views
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.utils.formatString;
	
	import utils.ProgressBar;
	
	public class Test1View extends Sprite
	{
		private var progressBar:ProgressBar;
		
		[Inject]
		public var viewManager:ViewManager;
		
		[Dispatcher]
		public var dispatcher:EventDispatcher;
			
		[PostConstruct]
		public function postConstruct():void
		{					
			// clear flash stage
			Starling.current.nativeStage.removeChildren();
			
			progressBar = new ProgressBar(150,25);
			progressBar.x = (Constants.stageWidth * 0.5) - 75;
			progressBar.y = (Constants.stageHeight * 0.5) - 12.5;
			addChild(progressBar);
			
			// load in assets
			Game.assetManager.enqueue(
				Constants.appDir.resolvePath(formatString("assets/textures/{0}x", Constants.contentScaleFactor)),
				Constants.appDir.resolvePath(formatString("assets/fonts/{0}x", Constants.contentScaleFactor)),
				Constants.appDir.resolvePath("assets/audio")
			);
			
			Game.assetManager.loadQueue(function onProgress(ratio:Number):void
			{
				progressBar.ratio = ratio;
				
				// a progress bar should always show the 100% for a while,
				// so we show the main menu only after a short delay. 
				
				if (ratio == 1)
					Starling.juggler.delayCall(function():void
					{
						progressBar.removeFromParent(true);
						viewManager.setView(Test2View, true);
					}, 0.15);
			});
		}
		
		[PreDestroy]
		public function preDestroy():void
		{
			// clean up	
		}
	}
}
