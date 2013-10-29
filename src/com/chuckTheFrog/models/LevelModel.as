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
		public var score:int
		public var hitFlies:int
		public var timeLeft:int
		
		public var stars:int=0;
		public var id:int;
		
		
		
		public function setLevelFromXml($xml:XML,$id:int):void
		{
			tabEnemies = new Array()
			nbFlies = $xml.@nbFlies
			levelId = $xml.@id
			timer = $xml.@timer
			id = $id
			for each(var enemie:XML in $xml.tabEnemies){
				tabEnemies.push({id:enemie.@id, nb:enemie.@nb})
			}
			

		}
	}
}