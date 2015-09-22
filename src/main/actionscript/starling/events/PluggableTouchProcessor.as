package starling.events 
{
	import flash.geom.Point;
	import orichalcum.starling.extension.touchprocessor.IPluggableTouchProcessor;
	import orichalcum.starling.extension.touchprocessor.ITouchProcessor;
	import orichalcum.starling.support.DisplayObjects;
	import starling.display.DisplayObject;
	import starling.display.Stage;
	
	public class PluggableTouchProcessor extends TouchProcessor implements IPluggableTouchProcessor
	{
		protected var _processors:Vector.<ITouchProcessor>;
		
		public function PluggableTouchProcessor(stage:Stage, postProcessors:Vector.<ITouchProcessor>) 
		{
			super(stage);
			this.processors = postProcessors;
		}
		
		public function get processors():Vector.<ITouchProcessor> 
		{
			return _processors;
		}
		
		public function set processors(value:Vector.<ITouchProcessor>):void 
		{
			_processors = value ? value : new Vector.<ITouchProcessor>;
		}
		
		public function get currentTouches():Vector.<Touch> 
		{
			return super.mCurrentTouches;
		}
		
		public function get queue():Vector.<Array>
		{
			return super.mQueue;
		}
		
		public function getTargetable(point:Point):DisplayObject
		{
			return DisplayObjects.getClosestTargetableObject(stage.hitTest(point, false));
		}
		
		override public function advanceTime(passedTime:Number):void 
		{
			super.advanceTime(passedTime);
		}
		
		override protected function processTouches(touches:Vector.<Touch>, shift:Boolean, control:Boolean):void 
		{
			super.processTouches(touches, shift, control);
			
			/*
				Run post-processors
			 */
			for each(var processor:ITouchProcessor in processors)
			{
				processor.process(this, touches, shift, control);
			}
		}
		
		override public function dispose():void 
		{
			super.dispose();
			
			/*
				Dispose of all processors
			 */
			for each(var processor:ITouchProcessor in processors)
			{
				processor.dispose();
			}
		}
		
	}

}