package
{	
	import com.chuckTheFrog.views.Game;
	
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	[SWF(frameRate="30", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{
		private var mStarling:Starling;
		private var screenWidth:int;
		private var screenHeight:int;
		private var viewPort:Rectangle;
		private var startupImage:Sprite;
		
		public function Main()
		{
			super();
			
			///////////////////////////////////////////////////////////////////////!
			// set general properties
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true;  // useful on mobile devices
			Starling.handleLostContext = false;  // required on Android
			
			///////////////////////////////////////////////////////////////////////
			// create a suitable viewport for the screen size
			
			screenWidth  = stage.fullScreenWidth;
			screenHeight = stage.fullScreenHeight;
			
			///////////////////////////////////////////////////////////////////////
			// calculate aspect ratio
			
			Constants.stageWidth = stage.stageWidth;
			Constants.stageHeight = stage.stageHeight;
			Constants.isIPhone5Retina = false;
			//Constants.xOffsetLeft = -44;
			Constants.xOffsetRight = 0;
			
			if(screenWidth == 1136) // iPhone 5 Retina
			{
				Constants.stageWidth = stage.stageWidth;
				Constants.stageHeight = stage.stageHeight;
				Constants.isIPhone5Retina = true;
				Constants.xOffsetLeft = 0;
				//Constants.xOffsetRight = 88;
			}
			
			Constants.aspectRatio = Constants.stageHeight / Constants.stageWidth;
			
			viewPort = new Rectangle();
			
			if (stage.fullScreenHeight / stage.fullScreenWidth < Constants.aspectRatio)
			{
				viewPort.height = screenHeight;
				viewPort.width  = screenWidth//int(viewPort.height / Constants.aspectRatio);
				viewPort.x = int((screenWidth - viewPort.width) / 2);
			}
			else
			{
				viewPort.width = screenWidth; 
				viewPort.height = int(viewPort.width * Constants.aspectRatio);
				viewPort.y = int((screenHeight - viewPort.height) / 2);
			}
			
			Constants.screenWidth = screenWidth;
			Constants.screenHeight = screenHeight;
			Constants.viewPortWidth = viewPort.width;
			Constants.viewPortHeight = viewPort.height;
			
			trace("[Engine] Screen: " + screenWidth + "x" + screenHeight);
			trace("[Engine] Viewport: " + viewPort.width + "x" + viewPort.height);
			
			var isHD:Boolean = screenWidth > 320
				
			//add a startup image
			//startupImage = createStartupImage(viewPort, isHD);
				
			///////////////////////////////////////////////////////////////////////
			// While Stage3D is initializing, the screen will be blank. To avoid any flickering, 
			// we display a startup image for now, but will remove it when Starling is ready to go.
			//
			// (Note that we *cannot* embed the "Default*.png" images, because then they won't
			//  be copied into the package any longer once they are embedded.)
			
			
			///////////////////////////////////////////////////////////////////////
			// Set up Starling and start
			
			mStarling = new Starling(Game, stage, viewPort);
			
			mStarling.stage3D.addEventListener(Event.CONTEXT3D_CREATE, function(e:Event):void 
			{
				// Starling is ready! We remove the startup image and start the game.
				//removeChild(startupImage);
				
				mStarling.simulateMultitouch = true;
				mStarling.showStats = false;
				mStarling.start();
			});
			
			///////////////////////////////////////////////////////////////////////
			// Set up Starling and start
			
			///////////////////////////////////////////////////////////////////////
			// When the game becomes inactive, we pause Starling; otherwise, 
			// the enter frame event would report a very long 'passedTime' 
			// when the app is reactivated. 
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, 
				function (e:Event):void { mStarling.start(); });
			
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, 
				function (e:Event):void { mStarling.stop(); });
		}
		
		private function createStartupImage(viewPort:Rectangle, isHD:Boolean):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			/*var background:Bitmap = isHD ?
				new AssetEmbeds_2x.txStudio() : new AssetEmbeds_1x.txStudio();
			
			background.smoothing = true;
			sprite.addChild(background);
			
			sprite.x = viewPort.x;
			sprite.y = viewPort.y;
			sprite.width  = viewPort.width;
			sprite.height = viewPort.height;*/
			
			return sprite;
		}
	}
}