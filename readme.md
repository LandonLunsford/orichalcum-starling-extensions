Orichalcum Starling Extensions
==================

<p>
This library contains various extensions for Starling Framework.
</p>

## Extensions
### PluggableTouchProcessor
<p>
An extensible version of starling.events.TouchProcessor
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
### NativeTouchProcessor - Plugin for PluggableTouchProcessor which maps starling TouchEvents to NativeTouchEvents in an attempt to make the starling Touch API more accessible to regular AIR developers
### Support package - Contains various Starling utility methods
