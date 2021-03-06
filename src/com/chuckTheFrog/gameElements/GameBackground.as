/**
 *
 * Frog Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2013 Espilacopa (www.espilacopa.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.chuckTheFrog.gameElements
{
	
	import com.chuckTheFrog.views.Game;
	
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * This class defines the whole InGame background.
	 *  
	 * @author ludo
	 * 
	 */
	public class GameBackground extends Sprite
	{
		/**
		 * Different layers of the background. 
		 */
		
		private var _bkg:Image;
		private var _bkg2:Image;
		private var _bkg3:Image;
		
		
		public function GameBackground()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			_bkg = new Image(Game.assetManager.getTexture("gameBKG"));
			var ratio:Number = _bkg.width/_bkg.height
			_bkg.width = stage.stageWidth
			_bkg.height = stage.stageHeight
			
			_bkg.blendMode = BlendMode.NONE;
			this.addChild(_bkg);
			
			_bkg2 = new Image(Game.assetManager.getTexture("gameBKG_Front"));
			ratio = _bkg2.width/_bkg2.height
			_bkg2.width = _bkg.width*0.70
			_bkg2.height= _bkg2.width/ratio	
			_bkg2.blendMode = BlendMode.AUTO;
			_bkg2.y = Constants.stageHeight - _bkg2.height
			_bkg2.x = Constants.stageWidth-_bkg2.width
			this.addChild(_bkg2);
			
			_bkg3 = new Image(Game.assetManager.getTexture("gameBKG_layerTop"));
			ratio = _bkg3.width/_bkg3.height
			_bkg3.width = _bkg.width*0.80
			_bkg3.height= _bkg3.width/ratio
			_bkg3.blendMode = BlendMode.AUTO;
			_bkg3.x = stage.stageWidth - _bkg3.width
			this.addChild(_bkg3);
		
		
		}
	
	}
}
	
	