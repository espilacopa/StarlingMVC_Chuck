package com.chuckTheFrog.gameElements.powers
{
	import com.chuckTheFrog.gameElements.bugs.ICloudFlies;

	public interface IPower 
	{
		function get type():int;
		function get impactPower():int;
		function usePower($Cloud:ICloudFlies,$dist:Number,$ang:Number):void;
	}
}