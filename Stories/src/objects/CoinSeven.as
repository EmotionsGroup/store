package objects
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class CoinSeven extends Sprite
	{
		
		private static var coinBtn:Button;
		
		private static var coinBlick:CoinBlick;
		private static var coinAnim:CoinAnimation;
		
		public function CoinSeven()
		{
			coinBtn = new Button(Assets.getTexture("CoinBtn"));
			coinBtn.scale = 0.5;
			coinBtn.x = int((Constant.STAGE_WIDTH_COIN_7 - coinBtn.width) / 2);
			coinBtn.y = Constant.STAGE_HEIGHT_COIN_7 * 0.75;
			this.addChild(coinBtn);
			
			coinBtn.addEventListener(TouchEvent.TOUCH, onClick);
		}
		
		private function onClick(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinAnim = new CoinAnimation();
				this.removeChild(coinBtn);
				coinAnim.x = coinBtn.x + 20;
				coinAnim.y = coinBtn.y + 35;
				this.addChild(coinAnim);
				Roots.assets.playSound("coin");
				
				coinBlick = new CoinBlick();
				coinBlick.x = int((Constant.STAGE_WIDTH_COIN_BLICK_SEVEN - coinBlick.width) / 2);
				coinBlick.y = Constant.STAGE_HEIGHT_COIN_BLICK_SEVEN * 0.75;
				this.addChild(coinBlick);
				
				trace("Coin seven is pressed");
			}
		}
	}
}