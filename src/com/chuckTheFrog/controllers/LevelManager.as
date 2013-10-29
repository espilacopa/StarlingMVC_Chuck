package com.chuckTheFrog.controllers
{
	import com.chuckTheFrog.models.GameModel;
	import com.chuckTheFrog.models.LevelModel;
	import com.chuckTheFrog.views.Game;
	
	import flash.utils.Dictionary;

	public class LevelManager
	{
		
		private var _tabLevel:Dictionary=new Dictionary()
		public function LevelManager()
		{
			var level:LevelModel
			var id:int = 0
			for each(var levelXML:XML in Game.assetManager.getXML("levels").level){
				level = new LevelModel()
				level.setLevelFromXml(levelXML,id)	
				id++
				_tabLevel[level.levelId]=level
			}
		}
		public function getLevel($id:int):LevelModel{
			return _tabLevel[$id]
		}
	}
}