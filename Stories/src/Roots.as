package
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class Roots extends Sprite
	{
		
		private static var sAssets:AssetManager;
		
		private var _activeScene:Sprite;
		
		public function Roots()
		{
			addEventListener(Menus.START_STORE, onStartGame);
			//addEventListener(Games.GAME_OVER,  onGameOver);
			addEventListener(Menus.START_SCENE_TWO, onStartTwoScene);
		}
		
		public function start(assets:AssetManager):void
		{
			
			sAssets = assets;
			//addChild(new Image(assets.getTexture("background")));
			showScene(Menus);
			
		}
		
//		private function onGameOver(event:Event, score:int):void
//		{
//			trace("Game Over! Score: " + score);
//			showScene(Menus);
//		}
		
		
		private function onStartGame(event:Event, gameMode:String):void
		{
			trace("Game starts! Mode: " + gameMode);
			showScene(Games);
		}
		
		private function onStartTwoScene(event:Event, gameMode:String):void {
			
			trace("Scene two! Mode: " + gameMode);
			showScene(SceneTwo);
		}
		
		private function showScene(screen:Class):void
		{
			if (_activeScene) _activeScene.removeFromParent(true);
			_activeScene = new screen();
			addChild(_activeScene);
		}
	
		
		public static function get assets():AssetManager { return sAssets; }
		
	}
}