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
	
	public class Father extends Sprite
	{
		
		[Embed(source="../../media/spine/father/father.json", mimeType="application/octet-stream")]
		static public const FatherJson:Class;
		
		[Embed(source="../../media/spine/father/father.atlas", mimeType="application/octet-stream")]
		static public const FatherAtlas:Class;
		
		[Embed(source="../../media/spine/father/father.png")]
		static public const FatherAtlasTexture:Class;
		
		public static var fatherSceleton:SkeletonAnimation;
		
		public function Father()
		{
			var spineFatherAtlas:Atlas = new Atlas(new FatherAtlas(), new StarlingTextureLoader(new FatherAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineFatherAtlas);
			var fatherJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			fatherJson.scale = 0.4;
			var fatherSceletonData:SkeletonData = fatherJson.readSkeletonData(new FatherJson());
			
			var fatherStateData:AnimationStateData = new AnimationStateData(fatherSceletonData);
			fatherStateData.setMixByName("speak", "speak", 0.2);
			fatherStateData.setMixByName("state", "state", 0.2);
			
			fatherSceleton = new SkeletonAnimation(fatherSceletonData, fatherStateData);
			fatherSceleton.x = int((Constant.STAGE_WIDTH_FATHER - fatherSceleton.width) / 2);
			fatherSceleton.y = Constant.STAGE_HEIGHT_FATHER * 0.75;
			
			fatherSceleton.skeleton.setToSetupPose();
			
			this.addChild(fatherSceleton);
			this.setChildIndex(fatherSceleton, this.numChildren - 1);
			Starling.juggler.add(fatherSceleton);
			
		}
		
		public function state():void {
			
			fatherSceleton.state.setAnimationByName(0, "state", true);
			
		}
		
		public function speak():void {
			
			fatherSceleton.state.setAnimationByName(0, "speak", false);
			
		}
	}
}