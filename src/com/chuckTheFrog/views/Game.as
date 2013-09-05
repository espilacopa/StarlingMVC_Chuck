package com.chuckTheFrog.views
{	
	import com.chuckTheFrog.providers.GameObjectProvider;
	
	import com.creativebottle.starlingmvc.StarlingMVC;
	import com.creativebottle.starlingmvc.config.StarlingMVCConfig;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import flash.system.Capabilities;
	import utils.AssetManager;
	
	public class Game extends Sprite
	{		
		///////////////////////////////////////////////////////////////////////
		// Private Properties
		
		public static var sAssets:AssetManager;
		private var config:StarlingMVCConfig;
		private var beans:Array;
		private var starlingMVC:StarlingMVC;
		
		///////////////////////////////////////////////////////////////////////
		// GameMain Constructor
		
		public function Game()
		{		
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		///////////////////////////////////////////////////////////////////////
		// Init GameMain
		
		private function init( event : Event ) : void
		{		
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			///////////////////////////////////////////////////////////////////
			// create the game with a fixed stage size only the viewPort is variable.
			///////////////////////////////////////////////////////////////////
			
			stage.stageWidth  = Constants.stageWidth;
			stage.stageHeight = Constants.stageHeight;
			
			///////////////////////////////////////////////////////////////////
			// the contentScaleFactor is calculated from stage size and viewport size
			///////////////////////////////////////////////////////////////////
			
			Constants.contentScaleFactor = Starling.current.contentScaleFactor;
			Constants.normalizedContentScaleFactor = Starling.current.contentScaleFactor < 1.5 ? 1 : 2;
			
			trace("[Engine] Stage: " + stage.stageWidth + "x" + stage.stageHeight);
			trace("[Engine] Scale Factor: " + Starling.current.contentScaleFactor+"  "+Constants.normalizedContentScaleFactor);
			
			///////////////////////////////////////////////////////////////////
			// Init the asset manager
			///////////////////////////////////////////////////////////////////
			
			sAssets = new AssetManager(Constants.contentScaleFactor, false);
			sAssets.verbose = Capabilities.isDebugger;				
			
			///////////////////////////////////////////////////////////////////
			// Starling MVC StartUp
			///////////////////////////////////////////////////////////////////
			
			config = new StarlingMVCConfig();
			config.eventPackages = ["com.chuckTheFrog.events"];
			config.viewPackages = ["com.chuckTheFrog.views"];
			
			///////////////////////////////////////////////////////////////////
			// GameObjectProvider defines the initial beans that are used
			///////////////////////////////////////////////////////////////////
			
			beans = [new GameObjectProvider(), new ViewManager(this)];
			starlingMVC = new StarlingMVC(this, config, beans);
			
			trace("[Engine] MVC Started...");
		}
		
		public static function get assetManager():AssetManager
		{
			return sAssets;
		}
	}
}
