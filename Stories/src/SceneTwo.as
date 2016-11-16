package
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class SceneTwo extends Sprite
	{
		public function SceneTwo()
		{
			super();
			init();
		}
		
		private function init():void {
			
			drawScene();
			
		}
		
		private function drawScene():void {
			
			var bg:Image = new Image(Roots.assets.getTexture("bg_scene_2"));
			this.addChild(bg);
			this.setChildIndex(bg, this.numChildren - 1);
			
		}
		
	}
}