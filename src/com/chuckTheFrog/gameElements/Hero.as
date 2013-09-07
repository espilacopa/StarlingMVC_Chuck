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
	import com.chuckTheFrog.gameElements.powers.IPower;
	import com.chuckTheFrog.gameElements.powers.Power;
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.views.Game;
	
	import flash.geom.Rectangle;
	
	import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	/**
	 * This class is the hero character.
	 *  
	 * @author ludo
	 * 
	 */
	public class Hero extends Sprite
	{
		/** Hero character animation. */
		private var heroArt:MovieClip;
		
		[Inject]
		public var gameModel:GameModel;
		
		/** State of the hero. */
		private var _state:int;
		private var _bkg:Image;
		private var _distT:Number;
		
		public function Hero()
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
			
			
			// Initialize hero art and hit area.
			createHeroArt();
		}
		
		/**
		 * Create hero art/visuals. 
		 * 
		 */
		private function createHeroArt():void
		{
			_bkg = new Image(Game.assetManager.getTexture("nenuphare0000"))
			
			heroArt = new MovieClip(Game.assetManager.getTextures("FrogGame"), 2);
			starling.core.Starling.juggler.add(heroArt);
			heroArt.stop()
			_bkg.y=heroArt.height-_bkg.height*.8
			this.addChild(_bkg);
			this.addChild(gameModel.mainPower);
			this.addChild(heroArt);
			gameModel.mainPower.x = heroArt.width*.75;
			gameModel.mainPower.y = heroArt.height*.35;
		}
		
		/**
		 * State of the hero. 
		 * @return 
		 * 
		 */
		public function get state():int { return _state; }
		
		public function shoot():void{
			heroArt.currentFrame = 1		
		}
		public function endShoot():void
		{		
			heroArt.currentFrame = 0
		}
		
		/**
		 * Set hero animation speed. 
		 * @param speed
		 * 
		 */
		public function setHeroAnimationSpeed(speed:int):void {
			if (speed == 0) heroArt.fps = 20;
			else heroArt.fps = 60;
		}

		override public function get width():Number
		{
			if (heroArt) return heroArt.texture.width;
			else return NaN;
		}

		override public function get height():Number
		{
			if (heroArt) return heroArt.texture.height;
			else return NaN;
		}
	}
}