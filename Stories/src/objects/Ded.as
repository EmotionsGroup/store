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
	
	public class Ded extends Sprite
	{
		[Embed(source="../../media/spine/ded/ded.json", mimeType="application/octet-stream")]
		static public const DedJson:Class;
		
		[Embed(source="../../media/spine/ded/ded.atlas", mimeType="application/octet-stream")]
		static public const DedAtlas:Class;
		
		[Embed(source="../../media/spine/ded/ded.png")]
		static public const DedAtlasTexture:Class;
		
		public static var dedSceleton:SkeletonAnimation;
		
		public function Ded()
		{
			
			var spineDedAtlas:Atlas = new Atlas(new DedAtlas(), new StarlingTextureLoader(new DedAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineDedAtlas);
			var dedJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			dedJson.scale = 0.3;
			var dedSceletonData:SkeletonData = dedJson.readSkeletonData(new DedJson());
			
			var dedStateData:AnimationStateData = new AnimationStateData(dedSceletonData);
			dedStateData.setMixByName("all", "all", 0.2);
			dedStateData.setMixByName("ears", "ears", 0.2);
			dedStateData.setMixByName("svechka", "svechka", 0.2);
			
			dedSceleton = new SkeletonAnimation(dedSceletonData, dedStateData);
			dedSceleton.x = int((Constant.STAGE_WIDHT_DED - dedSceleton.width) / 2);
			dedSceleton.y = Constant.STAGE_HEIGHT_DED * 0.75;
			
			dedSceleton.skeleton.setToSetupPose();
		
			this.addChild(dedSceleton);
			this.setChildIndex(dedSceleton, this.numChildren - 1);
			Starling.juggler.add(dedSceleton);
			
		}
		
		public function state():void {
			
			dedSceleton.state.setAnimationByName(0, "ears", true);
			dedSceleton.state.setAnimationByName(1, "svechka", true);
			
		}
		
		public function speak():void {
			
			dedSceleton.state.setAnimationByName(0, "all", true);
			dedSceleton.state.setAnimationByName(1, "svechka", true);
			
		}
	}
}