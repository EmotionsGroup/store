package objects
{
	
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Coins extends Sprite
	{
		
		private static var coinOne:CoinOne;
		private static var coinTwo:CoinTwo;
		private static var coinThree:CoinThree;
		private static var coinFour:CoinFour;
		private static var coinFive:CoinFive;
		private static var coinSix:CoinSix;
		private static var coinSeven:CoinSeven;
		private static var coinEight:CoinEight;
		private static var coinNine:CoinNine;
		private static var coinTen:CoinTen;
	
		
		public function Coins()
			
		{
			
			coinOne = new CoinOne();
			this.addChild(coinOne);
			
			coinTwo = new CoinTwo();
			this.addChild(coinTwo);
			coinTwo.alpha = 0.8;
			coinTwo.touchable = false;
			
			coinThree = new CoinThree();
			this.addChild(coinThree);
			coinThree.alpha = 0.8;
			coinThree.touchable = false;
			
			coinFour = new CoinFour();
			this.addChild(coinFour);
			coinFour.alpha = 0.8;
			coinFour.touchable = false;
			
			coinFive = new CoinFive();
			this.addChild(coinFive);
			coinFive.alpha = 0.8;
			coinFive.touchable = false;
			
			coinSix = new CoinSix();
			this.addChild(coinSix);
			coinSix.alpha = 0.8;
			coinSix.touchable = false;
			
			coinSeven = new CoinSeven();
			this.addChild(coinSeven);
			coinSeven.alpha = 0.8;
			coinSeven.touchable = false;
			
			coinEight = new CoinEight();
			this.addChild(coinEight);
			coinEight.alpha = 0.8;
			coinEight.touchable = false;
			
			coinNine = new CoinNine();
			this.addChild(coinNine);
			coinNine.alpha = 0.8;
			coinNine.touchable = false;
			
			coinTen = new CoinTen();
			this.addChild(coinTen);
			coinTen.alpha = 0.8;
			coinTen.touchable = false;
			
			coinOne.addEventListener(TouchEvent.TOUCH, onClickOne);
			coinTwo.addEventListener(TouchEvent.TOUCH, onClickTwo);
			coinThree.addEventListener(TouchEvent.TOUCH, onClickThree);
			coinFour.addEventListener(TouchEvent.TOUCH, onClickFour);
			coinFive.addEventListener(TouchEvent.TOUCH, onClickFive);
			coinSix.addEventListener(TouchEvent.TOUCH, onClickSix);
			coinSeven.addEventListener(TouchEvent.TOUCH, onClickSeven);
			coinEight.addEventListener(TouchEvent.TOUCH, onClickEight);
			coinNine.addEventListener(TouchEvent.TOUCH, onClickNine);
			
		}
		
		private function onClickOne(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinTwo.alpha = 1;
				coinTwo.touchable = true;

			}
		}
		
		private function onClickTwo(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinThree.alpha = 1;
				coinThree.touchable = true;
			}
		}
		
		private function onClickThree(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinFour.alpha = 1;
				coinFour.touchable = true;
			}
		}
		
		private function onClickFour(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinFive.alpha = 1;
				coinFive.touchable = true;
			}
		}
		
		private function onClickFive(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinSix.alpha = 1;
				coinSix.touchable = true;
			}
		}
		
		private function onClickSix(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinSeven.alpha = 1;
				coinSeven.touchable = true;
			}
		}
		
		private function onClickSeven(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinEight.alpha = 1;
				coinEight.touchable = true;
			}
		}
		
		private function onClickEight(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinNine.alpha = 1;
				coinNine.touchable = true;
			}
		}
		
		private function onClickNine(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				coinTen.alpha = 1;
				coinTen.touchable = true;
			}
		}
	}
}