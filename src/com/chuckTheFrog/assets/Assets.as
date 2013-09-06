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
	
		
		
		
		
		
		public static function factoryText($with:int, $heitgh:int, $text:String, $font:String, $size:int, $color:uint, $Halign:String,$VAlign:String):TextField
		{
			
			trace($with+"  "+$heitgh+"  "+$text+"  "+$font+"  "+$size+"  "+$color+"  "+$Halign+"  "+$VAlign)
			var textField:TextField = new TextField($with, $heitgh, $text, $font, $size, $color);
			
			textField.hAlign = HAlign.RIGHT;  // horizontal alignment
			//textField.border = true;
			var offset:int = 10;
			var ttFont:String = "Ubuntu";
			var ttFontSize:int = 19; 
			
			var colorTF:TextField = new TextField(300, 80, 
				"TextFields can have a border and a color. They can be aligned in different ways, ...", 
				ttFont, ttFontSize);
			colorTF.x = colorTF.y = offset;
			colorTF.border = true;
			colorTF.color = 0x333399;
			
			return textField
		}
	}
}
