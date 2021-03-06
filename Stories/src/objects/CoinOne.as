package objects
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class CoinOne extends Sprite
	{
		
		private static var coinBtn:Button;
		
		private static var coinBlick:CoinBlick;
		private static var coinAnim:CoinAnimation;
		
		private var fingerBablikCoins:FingerAnim;
		
		public var touch:Touch;
		public var isPressed:Boolean;
		
		public function CoinOne()
		{
			coinBtn = new Button(Assets.getTexture("CoinBtn"));
			coinBtn.scale = 0.5;
			coinBtn.x = int((Constant.STAGE_WIDTH_COIN_1 - coinBtn.width) / 2);
			coinBtn.y = Constant.STAGE_HEIGHT_COIN_1 * 0.75;
			this.addChild(coinBtn);
			
			coinBtn.addEventListener(TouchEvent.TOUCH, onClick);
			
			fingerBablikCoins = new FingerAnim();
			fingerBablikCoins.x = int((Constant.STAGE_WIDHT_FINGER_B2 - fingerBablikCoins.width) / 2);
			fingerBablikCoins.y = Constant.STAGE_HEIGHT_FINGER_B2 * 0.75;
			this.addChild(fingerBablikCoins);
			fingerBablikCoins.rotation = 160;
			fingerBablikCoins.anim();
			
		}
		
		private function onClick(event:TouchEvent):void {
			
			
			touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinAnim = new CoinAnimation();
				this.removeChild(coinBtn);
				coinAnim.x = coinBtn.x + 20;
				coinAnim.y = coinBtn.y + 35;
				this.addChild(coinAnim);
				Roots.assets.playSound("coin");
				
				coinBlick = new CoinBlick();
				coinBlick.x = int((Constant.STAGE_WIDTH_COIN_BLICK_ONE - coinBlick.width) / 2);
				coinBlick.y = Constant.STAGE_HEIGHT_COIN_BLICK_ONE * 0.75;
				this.addChild(coinBlick);
				
				this.removeChild(fingerBablikCoins);
				
				trace("Coin one is pressed");
			}
		}
		
	}
}