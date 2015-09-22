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
starling.touchProcessor = new PluggableTouchProcessor(
	starling.stage,
	new <ITouchProcessor>[
		...add your custom touch processors here...
	]
);
```
### NativeTouchProcessor
<p>
Plugin for the PluggableTouchProcessor which maps starling TouchEvents to NativeTouchEvents in an attempt to make the starling Touch API more accessible to regular AIR developers
</p>
Usage:
```actionscript
starling.touchProcessor = new PluggableTouchProcessor(
	starling.stage,
	new <ITouchProcessor>[
		new NativeTouchProcessor()
	]
);
```
### Support package - Contains various Starling utility methods
- DisplayObjects: Contains utility methods for handling starling.display.DisplayObject instances
