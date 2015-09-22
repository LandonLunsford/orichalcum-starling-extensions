package starling.events 
{
	import flash.geom.Point;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	
	/**
	 * This class is a minimal mirror of flash.events.TouchEvent
	 * This is a best attempt to map starling.events.TouchEvent API to flash.events.TouchEvent
	 */
	public class NativeTouchEvent extends TouchEvent
	{
		[Event(name="touchBegin", type="flash.events.TouchEvent")] 
		[Event(name="touchEnd", type="flash.events.TouchEvent")] 
		[Event(name="touchMove", type="flash.events.TouchEvent")] 
		[Event(name="touchOut", type="flash.events.TouchEvent")] 
		[Event(name="touchOver", type="flash.events.TouchEvent")] 
		[Event(name="touchTap", type="flash.events.TouchEvent")] 
		
		public static const TOUCH_BEGIN:String = "touchBegin";
		public static const TOUCH_END:String = "touchEnd";
		public static const TOUCH_MOVE:String = "touchMove";
		public static const TOUCH_OUT:String = "touchOut";
		public static const TOUCH_OVER:String = "touchOver";
		public static const TOUCH_TAP:String = "touchTap";
		
		protected var _type:String;
		protected var _touch:Touch;
		protected var _relatedObject:DisplayObject;
		protected var _local:Point;
		
		public function NativeTouchEvent(
			type:String,
			touches:Vector.<Touch>,
			shiftKey:Boolean,
			controlKey:Boolean,
			bubbles:Boolean,
			touch:Touch,
			relatedObject:DisplayObject)
		{
			super(type, touches, shiftKey, controlKey, bubbles);
			this._type = type;
			this._touch = touch;
			this._relatedObject = relatedObject;
		}
		
		private function get local():Point
		{
			if (_local == null)
			{
				_local = _touch.getLocation(_touch.target);
			}
			return _local;
		}
		
		public function get touch():Touch
		{
			return _touch;
		}
		
		public function get commandKey():Boolean
		{
			return controlKey;
		}
		
		public function get controlKey():Boolean
		{
			return ctrlKey;
		}
	
		public function get isPrimaryTouchPoint():Boolean
		{
			return _touch.id == 0;
		}
		
		public function get isTouchPointCanceled():Boolean
		{
			return _touch.cancelled;
		}
		
		public function get localX():Number
		{
			return local.x;
		}
		
		public function get localY():Number
		{
			return local.y;
		}

		public function get pressure():Number
		{
			return _touch.pressure;
		}
		
		public function get relatedObject():DisplayObject
		{
			return _relatedObject;
		}
		
		public function get sizeX():Number
		{
			return _touch.width;
		}
		
		public function get sizeY():Number
		{
			return _touch.height;
		}

		public function get stageX():Number
		{
			return _touch.globalX;
		}
		
		public function get stageY():Number
		{
			return _touch.globalY;
		}
		
		public function get touchPointID():int
		{
			return _touch.id;
		}
		
		public function dispatchInternal():void
		{
			dispatch(touch.bubbleChain);
		}
		
	}

}