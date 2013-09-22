package com.chuckTheFrog.models
{
	import com.creativebottle.starlingmvc.binding.Bindings;

	public class LevelModel
	{
		[Bindings]
		public var bindings:Bindings;
		
		public var nbFlies:Number
		public var valided:Boolean
		public var levelId:int
		public var tabEnemies:Array
		public var timer:int
		
		
		public function setLevelFromXml($xml:XMLList):void
		{
			tabEnemies = new Array()
			// TODO Auto Generated method stub
			trace($xml.toXMLString())
			nbFlies = $xml.@nbFlies
			levelId = $xml.@id
			timer = $xml.@timer
			
			for each(var enemie:XML in $xml.tabEnemies){
				tabEnemies.push({id:enemie.@id, nb:enemie.@nb})
			}
			

		}
	}
}