package
{
	import orichalcum.starling.extension.touchprocessor.ITouchProcessor;
	import orichalcum.starling.extension.touchprocessor.NativeTouchProcessor;
	import starling.display.Sprite;
	import starling.events.NativeTouchEvent;
	import starling.events.PluggableTouchProcessor;
	
	/*
	 * Later split into single object, nested children, touchable, touchableGroup demos
	 */
	public class DelegatingNativeTouchListenerDemo extends AbstractPluggableTouchProcessorDemo
	{
		
		override protected function start():void 
		{
			
			_starling.touchProcessor = new PluggableTouchProcessor(
				_starling.stage, new <ITouchProcessor>[new NativeTouchProcessor]);
			
			const root:Sprite = sprite('root', 300, 0xabcdef);
			root.x = 200;
			root.y = 200;
			
			const parent:Sprite = sprite('parent', 200, 0xabcd00);
			parent.x = root.width - parent.width;
			parent.y = root.height - parent.height;
			
			const child:Sprite = sprite('child', 100, 0xab0000);
			child.x = parent.width - child.width;
			child.y = parent.height - child.height;
			
			_starling.stage.addChild(root);
			root.addChild(parent);
			parent.addChild(child);
			
			/**
			 * Starling listener
			 */
			//_starling.stage.addEventListener(TouchEvent.TOUCH, logStarlingTouchEvent);
			
			/*
			 * Native listeners
			 */
			_starling.stage.addEventListener(NativeTouchEvent.TOUCH_BEGIN, logNativeTouchEvent);
			_starling.stage.addEventListener(NativeTouchEvent.TOUCH_END, logNativeTouchEvent);
			_starling.stage.addEventListener(NativeTouchEvent.TOUCH_TAP, logNativeTouchEvent);
			_starling.stage.addEventListener(NativeTouchEvent.TOUCH_MOVE, logNativeTouchEvent);
			_starling.stage.addEventListener(NativeTouchEvent.TOUCH_OVER, logNativeTouchEvent);
			_starling.stage.addEventListener(NativeTouchEvent.TOUCH_OUT, logNativeTouchEvent);
		}
		
	}

}
