package
{
	
	import objects.CoinEight;
	import objects.CoinFive;
	import objects.CoinFour;
	import objects.CoinNine;
	import objects.CoinOne;
	import objects.CoinSeven;
	import objects.CoinSix;
	import objects.CoinTen;
	import objects.CoinThree;
	import objects.CoinTwo;
	import objects.Ded;
	import objects.Father;
	import objects.Son;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Games extends Sprite
	{
		
		public static const GAME_OVER:String = "gameOver";
		
		private var skyOneTween:Tween;
		private var skyTwoTween:Tween;
		private var derezhblTween:Tween;
		
		private static var father:Father;
		private static var son:Son;
		private static var ded:Ded;
		
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
		
		private static var speakVoice:Boolean;
		
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
			initCoinsBtn();
			
		}
		
		private function initBack():void {
			
			var bg:Image = new Image(Roots.assets.getTexture("fs_back"));
			this.addChild(bg);
			this.setChildIndex(bg, this.numChildren - 1);
			
			var door:Image = new Image(Roots.assets.getTexture("door"));
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
			//father.state();
			father.speak();
			
		}
		
		private function initSon():void {
			
			son = new Son();
			this.addChild(son);
			son.takeMoney();
			son.listen();
			
		}
		
		private function initDed():void {
			
			ded = new Ded();
			this.addChild(ded);
			//ded.state();
			ded.speak();
			
		}
		
		private function initCoinsBtn():void {
			
			coinOne = new CoinOne();
			this.addChild(coinOne);
			
			coinTwo = new CoinTwo();
			this.addChild(coinTwo);
			
			coinThree = new CoinThree();
			this.addChild(coinThree);
			
			coinFour = new CoinFour();
			this.addChild(coinFour);
			
			coinFive = new CoinFive();
			this.addChild(coinFive);
			
			coinSix = new CoinSix();
			this.addChild(coinSix);
			
			coinSeven = new CoinSeven();
			this.addChild(coinSeven);
			
			coinEight = new CoinEight();
			this.addChild(coinEight);
			
			coinNine = new CoinNine();
			this.addChild(coinNine);
			
			coinTen = new CoinTen();
			this.addChild(coinTen);
			
		}
		
	}
}