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
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	
	import starling.display.DisplayObject;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	import utils.CurvedText;
	
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
		/*public static function curvedText($text:String, $font:String, $size:int, $color:uint,$radius,$startAngle,$endAngle,$direction:String=CurvedText.DIRECTION_UP):CurvedText{
			var tf:TextFormat = new TextFormat();
			tf.font = $font;
			tf.size = $size;
			tf.color = $color;
			var text:CurvedText = new CurvedText($text, $radius, $startAngle, $endAngle, $direction, tf);
			text.showCurve = true;
			text.showLetterBorder = true;
			text.draw();
			return text ;
		}*/
		
	}
}
