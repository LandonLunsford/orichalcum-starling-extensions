package orichalcum.starling.extension.touchprocessor 
{
	import starling.events.Touch;
	
	public interface ITouchProcessor 
	{
		
		function process(context:IPluggableTouchProcessor, touches:Vector.<Touch>, shift:Boolean, control:Boolean):void;
		
		function dispose():void;
		
	}
	
}