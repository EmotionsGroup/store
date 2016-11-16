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
	
	public class FingerAnim extends Sprite
	{
		
		[Embed(source="../../media/spine/finger/finger.json", mimeType="application/octet-stream")]
		static public const FingerJson:Class;
		
		[Embed(source="../../media/spine/finger/finger.atlas", mimeType="application/octet-stream")]
		static public const FingerAtlas:Class;
		
		[Embed(source="../../media/spine/finger/finger.png")]
		static public const FingerAtlasTexture:Class;
		
		public static var fingerSceleton:SkeletonAnimation;
		
		public function FingerAnim()
		{
			var spineFingerAtlas:Atlas = new Atlas(new FingerAtlas(), new StarlingTextureLoader(new FingerAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineFingerAtlas);
			var fingerJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			fingerJson.scale = 0.14;
			var fingerSceletonData:SkeletonData = fingerJson.readSkeletonData(new FingerJson());
			
			var fingerStateData:AnimationStateData = new AnimationStateData(fingerSceletonData);
			fingerStateData.setMixByName("start", "start", 0.2);
			
			fingerSceleton = new SkeletonAnimation(fingerSceletonData, fingerStateData);
			
			fingerSceleton.skeleton.setToSetupPose();
			
			this.addChild(fingerSceleton);
			this.setChildIndex(fingerSceleton, this.numChildren - 1);
			Starling.juggler.add(fingerSceleton);
		}
		
		public function anim():void {
			
			fingerSceleton.state.setAnimationByName(0, "start", true);
			
		}
		
	}
}