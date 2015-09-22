package 
{
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class AbstractStarlingDemo extends MovieClip
	{
		
		protected var _starling:Starling;
		
		public function AbstractStarlingDemo() 
		{
			_starling = new Starling(Sprite, stage);
			_starling.simulateMultitouch = true;
			_starling.addEventListener(Event.ROOT_CREATED, starling_rootCreated);
			_starling.start();
		}
		
		private function starling_rootCreated(event:Event):void 
		{
			start();
		}
		
		protected function start():void
		{
			throw new IllegalOperationError();
		}
		
		protected function sprite(name:String, size:Number, color:uint):Sprite
		{
			const quad:Quad = new Quad(size, size, color);
			quad.alpha = 0.2;
			
			const nameTextField:TextField = new TextField(size, size, name);
			nameTextField.touchable = false;
			nameTextField.hAlign = HAlign.LEFT;
			nameTextField.vAlign = VAlign.TOP;
			nameTextField.redraw();
			
			const sprite:Sprite = new Sprite();
			sprite.name = name;
			sprite.addChild(quad);
			sprite.addChild(nameTextField);
			sprite.touchGroup = true;
			
			return sprite;
		}
		
	}

}

