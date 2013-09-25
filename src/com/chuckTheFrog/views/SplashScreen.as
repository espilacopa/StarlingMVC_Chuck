package com.chuckTheFrog.views
{
	import com.chuckTheFrog.events.GameEvent;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import flash.filesystem.File;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.utils.formatString;
	
	import utils.ProgressBar;
	
	public class SplashScreen extends Sprite
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
			var imageDirectory:File = File.applicationStorageDirectory.resolvePath("atlas");
			trace(Constants.contentScaleFactor)
			if(imageDirectory.exists){
				Game.assetManager.enqueue(
					File.applicationStorageDirectory.resolvePath(formatString("atlas/{0}x", Constants.normalizedContentScaleFactor)),
				//	File.applicationStorageDirectory.resolvePath(formatString("atlas/fonts/{0}x", Constants.normalizedContentScaleFactor)),
					//Constants.appDir.resolvePath("assets/fonts"),
					File.applicationStorageDirectory.resolvePath("atlas/xml"),
					File.applicationStorageDirectory.resolvePath("atlas/audio")
				);
			}else{
				Game.assetManager.enqueue(
					"http://www.espilacopa.com/atlas/"+Constants.normalizedContentScaleFactor+"x",
					//	File.applicationStorageDirectory.resolvePath(formatString("atlas/fonts/{0}x", Constants.normalizedContentScaleFactor)),
					//Constants.appDir.resolvePath("assets/fonts"),
					("http://www.espilacopa.com/atlas/xml"),
					("http://www.espilacopa.com/atlas/audio")
				);
			}
			
			
			Game.assetManager.loadQueue(function onProgress(ratio:Number):void
			{
				progressBar.ratio = ratio;
				
				// a progress bar should always show the 100% for a while,
				// so we show the main menu only after a short delay. 
				
				if (ratio == 1)
					Starling.juggler.delayCall(function():void
					{
						progressBar.removeFromParent(true);
						//viewManager.setView(Welcome, true);
						dispatcher.dispatchEventWith(GameEvent.ASSETSINIT,true)
					}, 0.15);
			});
		}
		
		[PreDestroy]
		public function preDestroy():void
		{
			
			// clean up	
			progressBar.dispose()
		}
	}
}
