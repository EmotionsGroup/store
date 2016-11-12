package
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menus extends Sprite
	{
		
		public static const START_STORE:String = "Start Read";
		private var _activeScene:Sprite;
		
		public function Menus()
		{
			init();
		}
		
		private function init():void {
			
			Roots.assets.playSound("music2");
			
			var button:Button = new Button(Roots.assets.getTexture("button_normal"), "Father Son Scenes");
			button.textFormat.font = "Ubuntu";
			button.textFormat.size = 16;
			button.x = int((Constant.STAGE_WIDTH - button.width) / 2);
			button.y = Constant.STAGE_HEIGHT * 0.75;
			button.addEventListener(Event.TRIGGERED, onButtonTriggered);
			addChild(button);
		}
		
		private function onButtonTriggered():void
		{
			Roots.assets.playSound("click");
			dispatchEventWith(START_STORE, true, "classic");
			
		}

	}
}