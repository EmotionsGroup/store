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
	
	import starling.core.Starling;
	import starling.display.Sprite;
	
	public class CoinBlick extends Sprite
	{
		
		[Embed(source="../../media/spine/coin_blick/coin_heand.json", mimeType="application/octet-stream")]
		static public const CoinBlickJson:Class;
		
		[Embed(source="../../media/spine/coin_blick/coin_heand.atlas", mimeType="application/octet-stream")]
		static public const CoinBlickAtlas:Class;
		
		[Embed(source="../../media/spine/coin_blick/coin_heand.png")]
		static public const CoinBlickAtlasTexture:Class;
		
		public static var coinBlickSkeleton:SkeletonAnimation;
		
		public function CoinBlick()
		{
			initCoin();
		}
		
		private function initCoin():void {
			
			var spineCoinBlickAtlas:Atlas = new Atlas(new CoinBlickAtlas(), new StarlingTextureLoader(new CoinBlickAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineCoinBlickAtlas);
			var coinBlickJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			coinBlickJson.scale = 0.5;
			var coinBlickSceletonData:SkeletonData = coinBlickJson.readSkeletonData(new CoinBlickJson());
			
			var coinBlickStateData:AnimationStateData = new AnimationStateData(coinBlickSceletonData);
			
			coinBlickSkeleton = new SkeletonAnimation(coinBlickSceletonData, coinBlickStateData);
			
			coinBlickSkeleton.skeleton.setToSetupPose();
			coinBlickSkeleton.state.setAnimationByName(0, "blik", false);
			
			this.addChild(coinBlickSkeleton);
			this.setChildIndex(coinBlickSkeleton, this.numChildren - 1);
			Starling.juggler.add(coinBlickSkeleton);
			
		}
	}
}