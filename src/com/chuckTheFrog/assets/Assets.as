/**
 *
 * Chuck the Frog
 * http://www.espilacopa.com
 * 
 * Copyright (c) 2013 Ludovic Piquet. All rights reserved.
 * 
 *  
 */

package com.chuckTheFrog.assets
{
	import flash.net.URLLoader;
	import flash.utils.ByteArray;
	
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	/**
	 * This class holds all embedded textures, fonts and sounds and other embedded files.  
	 * By using static access methods, only one instance of the asset file is instantiated. This 
	 * means that all Image types that use the same bitmap will use the same Texture on the video card.
	 * 
	 * @author hsharma
	 * 
	 */
	public class Assets
	{
	
		[Embed(source="../../../assets/fonts/Ubuntu-R.ttf", embedAsCFF="false", fontFamily="Ubuntu")]        
		private static const UbuntuRegular:Class;
		
		[Embed(source="../../../assets/fonts/BrushScriptStd.otf", embedAsCFF="false", fontFamily="BrushScriptStd")]        
		private static const BrushScriptStd:Class;
		
		[Embed(source="../../../assets/fonts/CarterOne.ttf", embedAsCFF="false", fontFamily="CarterOne")]        
		private static const CarterOne:Class;
		public static function factoryText($with:int, $heitgh:int, $text:String, $font:String, $size:int, $color:uint, $Halign:String,$VAlign:String):TextField
		{
			
			var textField:TextField = new TextField($with, $heitgh, $text, $font, $size, $color);
			
			textField.hAlign = HAlign.RIGHT;  // horizontal alignment
			//textField.border = true;
			
			
			return textField
		}
	}
}
