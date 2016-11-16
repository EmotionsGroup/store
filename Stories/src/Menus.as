package
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menus extends Sprite
	{
		
		public static const START_STORE:String = "Father and Son Scene one";
		public static const START_SCENE_TWO:String = "Father and Son Scene two";
		
		private var _activeScene:Sprite;
		
		public function Menus()
		{
			init();
		}
		
		private function init():void {
			
			//Roots.assets.playSound("music2");
			
			var button:Button = new Button(Roots.assets.getTexture("button_normal"), "Scene one");
			button.textFormat.font = "Ubuntu";
			button.textFormat.size = 16;
			button.x = int((Constant.STAGE_WIDTH - button.width) / 2);
			button.y = Constant.STAGE_HEIGHT * 0.75;
			button.addEventListener(Event.TRIGGERED, onButtonTriggered);
			addChild(button);
			
			var button_1:Button = new Button(Roots.assets.getTexture("button_normal"), "Scene two");
			button_1.textFormat.font = "Ubuntu";
			button_1.textFormat.size = 16;
			button_1.x = int((Constant.STAGE_WIDTH_BTN_SCENE_TWO - button_1.width) / 2);
			button_1.y = Constant.STAGE_HEIGHT_BTN_SCENE_TWO * 0.75;
			button_1.addEventListener(Event.TRIGGERED, onButtonTriggeredTwo);
			addChild(button_1);
		}
		
		private function onButtonTriggered():void {
			
			Roots.assets.playSound("click");
			dispatchEventWith(START_STORE, true, "classic");
			
		}
		
		private function onButtonTriggeredTwo():void {
			
			Roots.assets.playSound("click");
			dispatchEventWith(START_SCENE_TWO, true, "classic");
			
		}

	}
}