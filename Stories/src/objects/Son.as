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
	
	public class Son extends Sprite
	{
		
		[Embed(source="../../media/spine/son/son.json", mimeType="application/octet-stream")]
		static public const SonJson:Class;
		
		[Embed(source="../../media/spine/son/son.atlas", mimeType="application/octet-stream")]
		static public const SonAtlas:Class;
		
		[Embed(source="../../media/spine/son/son.png")]
		static public const SonAtlasTexture:Class;
		
		public static var sonSceleton:SkeletonAnimation;
		
		public function Son()
		{
		
			var spineSonAtlas:Atlas = new Atlas(new SonAtlas(), new StarlingTextureLoader(new SonAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineSonAtlas);
			var sonJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			sonJson.scale = 0.4;
			var sonSceletonData:SkeletonData = sonJson.readSkeletonData(new SonJson());
			
			var sonStateData:AnimationStateData = new AnimationStateData(sonSceletonData);
			sonStateData.setMixByName("ease", "ease", 0.2);
			sonStateData.setMixByName("left_heand", "left_heand", 0.2);
			sonStateData.setMixByName("right_heand", "right_heand", 0.2);
			sonStateData.setMixByName("brov_mus", "brov_mus", 0.2);
			
			sonSceleton = new SkeletonAnimation(sonSceletonData, sonStateData);
			sonSceleton.x = int((Constant.STAGE_WIDTH_SON - sonSceleton.width) / 2);
			sonSceleton.y = Constant.STAGE_HEIGHT_SON * 0.75;
			
			sonSceleton.skeleton.setToSetupPose();
			sonSceleton.state.setAnimationByName(0, "ease", true);
			
			this.addChild(sonSceleton);
			this.setChildIndex(sonSceleton, this.numChildren - 1);
			Starling.juggler.add(sonSceleton);
		}
		
		public function listen():void {
			
			sonSceleton.state.setAnimationByName(1, "brov_mus", true);
			sonSceleton.state.setAnimationByName(3, "right_heand", true);
		}
		
		public function takeMoney():void {
			
			sonSceleton.state.setAnimationByName(2, "left_heand", false);
			
		}
	}
}