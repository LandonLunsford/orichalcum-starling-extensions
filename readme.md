Orichalcum Starling Extensions
==================

<p>
This library contains various extensions for Starling Framework.
</p>

## Extensions
### PluggableTouchProcessor
<p>
The PluggableTouchProcessor is an extensible version of starling.events.TouchProcessor and allows the user to add one or more custom touch processors on top of the starling base TouchProcessor implementation.
</p>
Usage:
```actionscript
starling.touchProcessor = new PluggableTouchProcessor(starling.stage, new <ITouchProcessor>[
	/* Add your custom touch processors here */
]);
```
### NativeTouchProcessor
<p>
This plugin attempts to bridge the starling.events.TouchEvent API to the flash.events.TouchEvent API. Developers can listen for:
</p>
-flash.events.TouchEvent.TOUCH_BEGIN
-flash.events.TouchEvent.TOUCH_END
-flash.events.TouchEvent.TOUCH_TAP
-flash.events.TouchEvent.TOUCH_MOVE
-flash.events.TouchEvent.TOUCH_OVER
-flash.events.TouchEvent.TOUCH_OUT

The only catch is that due to Starling Framework limitations a new touch event class must be used in order to plug into the Starling Framework event dispatcher API - this is starling.events.NativeTouchEvent

Usage:
```actionscript
starling.touchProcessor = new PluggableTouchProcessor(starling.stage, new <ITouchProcessor>[
	new NativeTouchProcessor()
]);
```
### Support Package
<p>
This package contains Starling utility methods to support the enclosed extensions
</p>
- DisplayObjects: Contains utility methods for handling starling.display.DisplayObject instances
