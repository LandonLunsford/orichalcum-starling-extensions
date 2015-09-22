package 
{
	import flash.utils.getQualifiedClassName;
	import starling.events.NativeTouchEvent;
	import starling.events.Touch;
	import starling.utils.formatString;
	
	public class AbstractPluggableTouchProcessorDemo extends AbstractStarlingDemo
	{
		
		public function AbstractPluggableTouchProcessorDemo() 
		{
			
		}
		
		protected function logStarlingTouchEvent(event:TouchEvent):void 
		{
			for each(var touch:Touch in event.touches)
			{
				trace(getQualifiedClassName(event), formatString('{touchId:{0}, phase:{1}, target:{2}}', 
					touch.id, touch.phase, touch.target.name ? touch.target.name : touch.target));
			}
		}
		
		
		protected function logNativeTouchEvent(event:NativeTouchEvent):void 
		{
			trace(getQualifiedClassName(event), formatString('{touchId:{0}, type:{1}, target:{2}}', 
				event.touch.id, event.type, event.touch.target.name ? event.touch.target.name : event.touch.target));
		}
		
		
	}

}