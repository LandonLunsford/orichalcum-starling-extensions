package orichalcum.starling.extension.touchprocessor 
{
	import flash.geom.Point;
	import starling.display.DisplayObject;
	import starling.display.Stage;
	import starling.events.Touch;
	
	public interface IPluggableTouchProcessor 
	{
		function get processors():Vector.<ITouchProcessor>;
		
		function set processors(value:Vector.<ITouchProcessor>):void;
		
		function get stage():Stage;
		
		function get currentTouches():Vector.<Touch>;
		
		function get queue():Vector.<Array>;
		
		function getTargetable(point:Point):DisplayObject;
		
	}
	
}