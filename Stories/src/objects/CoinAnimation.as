package objects 
{
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.animation.AnimationStateData;
	import spine.atlas.Atlas;
	import spine.attachments.AtlasAttachmentLoader;
	import spine.attachments.AttachmentLoader;
	import spine.starling.SkeletonAnimation;
	import spine.starling.StarlingTextureLoader;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	public class CoinAnimation extends Sprite
	{
		
		[Embed(source="../../media/spine/coin/coin.json", mimeType="application/octet-stream")]
		static public const CoinJson:Class;
		
		[Embed(source="../../media/spine/coin/coin.atlas", mimeType="application/octet-stream")]
		static public const CoinAtlas:Class;
		
		[Embed(source="../../media/spine/coin/coin.png")]
		static public const CoinAtlasTexture:Class;
		
		public static var coinSkeleton:SkeletonAnimation;
		private static var coinTween:Tween;
		
		public function CoinAnimation()
		{
			
			initCoin();
		}
		
		
		private function initCoin():void {
			
			var spineCoinAtlas:Atlas = new Atlas(new CoinAtlas(), new StarlingTextureLoader(new CoinAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineCoinAtlas);
			var coinJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			coinJson.scale = 0.5;
			var coinSceletonData:SkeletonData = coinJson.readSkeletonData(new CoinJson());
			
			var coinStateData:AnimationStateData = new AnimationStateData(coinSceletonData);
			//coinStateData.setMixByName("coin", "coin", 0.2);
			
			coinSkeleton = new SkeletonAnimation(coinSceletonData, coinStateData);
			
			coinSkeleton.skeleton.setToSetupPose();
			coinSkeleton.state.setAnimationByName(0, "coin", true);
			
			this.addChild(coinSkeleton);
			this.setChildIndex(coinSkeleton, this.numChildren - 1);
			Starling.juggler.add(coinSkeleton);
			
			coinTween = new Tween(coinSkeleton, 4.5, Transitions.EASE_OUT);
			coinTween.fadeTo(0);
			coinTween.animate("y", coinSkeleton.y - 200);
			Starling.juggler.add(coinTween);
			
		}
	}
}