package orichalcum.starling.extension.touchprocessor 
{
	import flash.geom.Point;
	import orichalcum.starling.support.DisplayObjects;
	import starling.display.DisplayObject;
	import starling.events.NativeTouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class NativeTouchProcessor implements ITouchProcessor
	{
		private var _beginningTargetByTouchId:Array = [];
		private var _previousTargetByTouchId:Array = [];
		private var _touchPoint:Point = new Point;
		
		public function NativeTouchProcessor() 
		{
			
		}
		
		public function dispose():void 
		{
			_beginningTargetByTouchId = null;
			_previousTargetByTouchId = null;
			_touchPoint = null;
		}
		
		public function process(context:IPluggableTouchProcessor, touches:Vector.<Touch>, shift:Boolean, control:Boolean):void 
		{
			for each(var touch:Touch in touches)
			{
				processNativeTouch(context, touch, shift, control);
			}
		}
		
		protected function processNativeTouch(context:IPluggableTouchProcessor, touch:Touch, shiftDown:Boolean, ctrlDown:Boolean):void 
		{
			
			/*
				Calibrate point flyweight to equal the touch point coordinates
			 */
			_touchPoint.setTo(touch.globalX, touch.globalY);
			
			/*
				Determine current target of this touch
			 */
			const currentTarget:DisplayObject = context.getTargetable(_touchPoint);
			
			/*
				Remember the touch's state before changing it for our new custom events
			 */
			const unprocessedTouchTarget:DisplayObject = touch.target;
		
			switch (touch.phase)
			{
				case TouchPhase.BEGAN:
					
					/*
						Remember the touches target at the moment the touch begins
						This is so that we can dispatch tap events
					 */
					_beginningTargetByTouchId[touch.id] = currentTarget;
					
					/*
						Map touch in begin phase to touch-begin event
					 */
					dispatch(NativeTouchEvent.TOUCH_BEGIN, context.currentTouches, shiftDown, ctrlDown, touch, currentTarget);
					
					break;
					
				case TouchPhase.MOVED:
				case TouchPhase.STATIONARY:
					
					/*
						Determine previous target of this touch
					 */
					const previousTarget:DisplayObject = getPreviousTarget(touch);
					
					/*
						Update previous target for next processTouches call
					 */
					_previousTargetByTouchId[touch.id] = currentTarget;
					
					
					/*
						The definition of an over/out event is when the object below the mouse changes
						It is at this point that we need to inform the object that was exited and the object that was entered in this order
					 */
					if (currentTarget !== previousTarget)
					{
						if (previousTarget && previousTarget !== context.stage)
						{
							dispatch(NativeTouchEvent.TOUCH_OUT, context.currentTouches, shiftDown, ctrlDown, touch, previousTarget, currentTarget);
						}
						if (currentTarget && currentTarget !== context.stage)
						{
							dispatch(NativeTouchEvent.TOUCH_OVER, context.currentTouches, shiftDown, ctrlDown, touch, currentTarget, previousTarget);
						}
					}
					
					if (currentTarget)
					{
						dispatch(NativeTouchEvent.TOUCH_MOVE, context.currentTouches, shiftDown, ctrlDown, touch, currentTarget);
					}
					
					break;
					
				case TouchPhase.ENDED:
					
					/*
						Map touch in end phase to touch-end event
					 */
					dispatch(NativeTouchEvent.TOUCH_END, context.currentTouches, shiftDown, ctrlDown, touch, currentTarget);
					
					/*
						The definition of a tap event is when the target the touch ends on is the same that it started on
						A better implementation would make sure the multitouchDistance threshold is not exceeded before triggering
					 */
					if (_beginningTargetByTouchId[touch.id] === currentTarget)
					{
						_beginningTargetByTouchId[touch.id] = null;
						dispatch(NativeTouchEvent.TOUCH_TAP, context.currentTouches, shiftDown, ctrlDown, touch, currentTarget);
					}
					
					break;
			}
			
			/*
				Restore the touch's state for proper framework processing
			 */
			touch.target = unprocessedTouchTarget;
			
		}

		private function getPreviousTarget(touch:Touch):DisplayObject 
		{
			const previousTarget:DisplayObject = _previousTargetByTouchId[touch.id];
			return DisplayObjects.isTouchable(previousTarget) ? previousTarget : null;
		}
		
		private function dispatch(type:String, touches:Vector.<Touch>, shiftDown:Boolean, ctrlDown:Boolean, touch:Touch, target:DisplayObject, relatedObject:DisplayObject = null):void
		{
			touch.target = target;
			getNativeTouchEvent(type, touches, shiftDown, ctrlDown, touch, relatedObject).dispatchInternal();
		}
		
		protected function getNativeTouchEvent(type:String, touches:Vector.<Touch>, shiftDown:Boolean, ctrlDown:Boolean, touch:Touch, relatedObject:DisplayObject = null):NativeTouchEvent
		{
			return new NativeTouchEvent(type, touches, shiftDown, ctrlDown, true, touch, relatedObject);
		}
		
	}

}