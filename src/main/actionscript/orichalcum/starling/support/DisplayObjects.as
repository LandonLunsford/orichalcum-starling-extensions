package orichalcum.starling.support 
{
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class DisplayObjects 
	{
		
		/**
		 * <p>
		 * This method traverses up the ancestor chain of the candidate searching
		 * for the first instance of a displayObject with touchGroup set true.
		 * If there is no touch group in the chain it returns the closest display
		 * object with touchable set true.
		 * </p>
		 * @param	candidate
		 * @return	the closest targetable display object
		 */
		public static function getClosestTargetableObject(value:DisplayObject):DisplayObject 
		{
			var touchable:DisplayObject;
			while (value != null)
			{
				var touchGroupCandidate:DisplayObjectContainer = value as DisplayObjectContainer;
				if (touchGroupCandidate && touchGroupCandidate.touchGroup)
					return value;
				
				if (touchable == null && value.touchable)
					touchable = value;
				
				value = value.parent;
			}
			return touchable;
		}
		
		/**
		 * <p>
		 * This method traverses up the ancestor chain of the candidate searching
		 * for the first instance of a displayObject with touchGroup set true.
		 * If there is no touch group in the chain it returns the closest display
		 * object with touchable set true.
		 * </p>
		 * @param	value
		 * @return	true if the supplied value is not null and is touchable or a touch group
		 */
		public static function isTouchable(value:DisplayObject):Boolean
		{
			return value != null
				&& value.visible
				&& (
					value.touchable
					|| (
						value is DisplayObjectContainer
						&& (value as DisplayObjectContainer).touchGroup
					)
				);
		}
		
	}

}