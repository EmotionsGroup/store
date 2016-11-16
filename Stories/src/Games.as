package
{
	
	import objects.Coins;
	import objects.Ded;
	import objects.Father;
	import objects.FingerAnim;
	import objects.Son;
	
	import starling.animation.DelayedCall;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Games extends Sprite
	{
		
		public static const GAME_OVER:String = "gameOver";
		
		private var skyOneTween:Tween;
		private var skyTwoTween:Tween;
		private var derezhblTween:Tween;
		private var bablikMain:Tween;
		private var coinsTween:Tween;
		
		private var voiceBablic:Image;
		private var fingerBablik:FingerAnim;
		private var fingerBablikCoins:FingerAnim;
		
		private static var father:Father;
		private static var son:Son;
		private static var ded:Ded;
		
		public var coins:Coins;
		
		public function Games()
		{
			init();
		}
		
		private function init():void
		{
			
			initBack();
			initFather();
			initSon();
			initDed();
			initVoiceBablic();
			
//			coins = new Coins();
//			this.addChild(coins);
			
		}
		
		private function initBack():void {
			
			var bg:Image = new Image(Roots.assets.getTexture("fs_back"));
			this.addChild(bg);
			this.setChildIndex(bg, this.numChildren - 1);
			
			var door:Image = new Image(Roots.assets.getTexture("door"));
			door.x = -1;
			this.addChild(door);
			this.setChildIndex(door, 0);
			
			var skyOne:Image = new Image(Roots.assets.getTexture("sky_1"));
			skyOne.x = int((Constant.STAGE_WIDTH_SKY_ONE - skyOne.width) / 2);
			skyOne.y = Constant.STAGE_HEIGHT_SKY_ONE * 0.75;
			this.addChild(skyOne);
			this.setChildIndex(skyOne, 1);
			
			var skyTwo:Image = new Image(Roots.assets.getTexture("sky_2"));
			skyTwo.x = int((Constant.STAGE_WIDTH_SKY_TWO - skyTwo.width) / 2);
			skyTwo.y = Constant.STAGE_HEIGHT_SKY_TWO * 0.75;
			this.addChild(skyTwo);
			this.setChildIndex(skyTwo, 1);
			
			skyOneTween = new Tween(skyOne, 120, Transitions.EASE_OUT);
			skyOneTween.animate("x", skyOne.x + 200);
			skyOneTween.repeatCount = 1000;
			Starling.juggler.add(skyOneTween);
			
			skyTwoTween = new Tween(skyTwo, 130, Transitions.EASE_OUT);
			skyTwoTween.animate("x", skyTwo.x + 200);
			skyTwoTween.repeatCount = 1000;
			Starling.juggler.add(skyTwoTween);
			
			var derezhabl:Image = new Image(Roots.assets.getTexture("derezhabl"));
			derezhabl.x = int((Constant.STAGE_WIDTH_DERE - derezhabl.width) / 2);
			derezhabl.y = Constant.STAGE_HEIGHT_DERE * 0.75;
			this.addChild(derezhabl);
			this.setChildIndex(derezhabl, 2);
			
			derezhblTween = new Tween(derezhabl, 120, Transitions.EASE_OUT);
			derezhblTween.animate("x", derezhabl.x - 200);
			derezhblTween.repeatCount = 1000;
			Starling.juggler.add(derezhblTween);
			
		}
		
		private function initFather():void {
			
			father = new Father();
			this.addChild(father);
			father.state();
			//father.speak();
			
		}
		
		private function initSon():void {
			
			son = new Son();
			this.addChild(son);
			//son.takeMoney();
			//son.listen();
			
		}
		
		private function initDed():void {
			
			ded = new Ded();
			this.addChild(ded);
			ded.state();
			
		}
		
		private function initVoiceBablic():void {
			
			voiceBablic = new Image(Roots.assets.getTexture("bablik_1"));
			voiceBablic.x = int((Constant.STAGE_WIDTH_BABLIK_ONE - voiceBablic.width) / 2);
			voiceBablic.y = Constant.STAGE_HEIHGT_BABLIK_ONE * 0.75;
			this.addChild(voiceBablic);
			this.setChildIndex(voiceBablic, this.numChildren - 1);
			
			bablikMain = new Tween(voiceBablic, 2, Transitions.EASE_OUT);
			bablikMain.delay = 3;
			bablikMain.animate("x", voiceBablic.x + 230);
			Starling.juggler.add(bablikMain);
			
			voiceBablic.addEventListener(TouchEvent.TOUCH, onClickBablik);
			
			var delayCallFinger:DelayedCall = new DelayedCall(finger, 9.0);
			Starling.juggler.add(delayCallFinger);
		}
		
		private function onClickBablik(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				Roots.assets.playSound("chpok");
				this.removeChild(voiceBablic);
				this.removeChild(fingerBablik);
				father.speak();
				son.listen();
				ded.tween();
				
				var delayCallDedSpeak:DelayedCall = new DelayedCall(dedSpeak, 11.0);
				Starling.juggler.add(delayCallDedSpeak);
			}
		}
		
		private function finger():void {
			
			fingerBablik = new FingerAnim();
			fingerBablik.x = int((Constant.STAGE_WIDHT_FINGER_B1 - fingerBablik.width) / 2);
			fingerBablik.y = Constant.STAGE_HEIGHT_FINGER_B1 * 0.75;
			this.addChild(fingerBablik);
			fingerBablik.anim();
		}
		
		private function dedSpeak():void {
			
			ded.speak();
			var delayCallDedState:DelayedCall = new DelayedCall(dedState, 4.0);
			Starling.juggler.add(delayCallDedState);
		}
		
		private function dedState():void {
			
			ded.state();
			var delayCallCoins:DelayedCall = new DelayedCall(coinAnim, 1.0);
			Starling.juggler.add(delayCallCoins);
			
		}
		
		private function coinAnim():void {
			
			coins = new Coins();
			this.addChild(coins);
			
			son.takeMoney();
			coinsTween = new Tween(coins, 2, Transitions.EASE_OUT);
			coinsTween.animate("y", coins.y - 50);
			Starling.juggler.add(coinsTween);
			
		}
	
	}
}