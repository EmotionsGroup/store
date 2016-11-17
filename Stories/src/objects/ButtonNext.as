package objects
{
	import flash.media.Video;
	
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.animation.AnimationStateData;
	import spine.atlas.Atlas;
	import spine.attachments.AtlasAttachmentLoader;
	import spine.attachments.AttachmentLoader;
	import spine.starling.SkeletonAnimation;
	import spine.starling.StarlingTextureLoader;
	
	import starling.animation.DelayedCall;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ButtonNext extends Sprite
	{
		
		[Embed(source="../../media/spine/strela/strela.json", mimeType="application/octet-stream")]
		static public const BtnNextJson:Class;
		
		[Embed(source="../../media/spine/strela/strela.atlas", mimeType="application/octet-stream")]
		static public const BtnNextAtlas:Class;
		
		[Embed(source="../../media/spine/strela/strela.png")]
		static public const BtnNextAtlasTexture:Class;
		
		public static var btnNextSceleton:SkeletonAnimation;
		private static var btnNexTween:Tween;
		
		public static const START_SCENE_TWO:String = "Father and Son Scene two";
		
		public function ButtonNext()
		{
			var spineBtnNextAtlas:Atlas = new Atlas(new BtnNextAtlas(), new StarlingTextureLoader(new BtnNextAtlasTexture()));
			var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineBtnNextAtlas);
			var btnNextJson:SkeletonJson = new SkeletonJson(attachmentLoader);
			btnNextJson.scale = 0.11;
			var btnNextSceletonData:SkeletonData = btnNextJson.readSkeletonData(new BtnNextJson());
			
			var btnNextStateData:AnimationStateData = new AnimationStateData(btnNextSceletonData);
			btnNextStateData.setMixByName("blick", "blick", 0.2);
			
			btnNextSceleton = new SkeletonAnimation(btnNextSceletonData, btnNextStateData);
			
			btnNextSceleton.x = int((Constant.STAGE_WIDHT_BTN_NEXT - btnNextSceleton.width) / 2);
			btnNextSceleton.y = Constant.STAGE_HEIGHT_BTN_NEXT * 0.75;
			
			btnNextSceleton.skeleton.setToSetupPose();
			
			this.addChild(btnNextSceleton);
			this.setChildIndex(btnNextSceleton, this.numChildren - 1);
			Starling.juggler.add(btnNextSceleton);
			
			btnNextSceleton.addEventListener(TouchEvent.TOUCH, onClick);
			
			var delayCallBlick:DelayedCall = new DelayedCall(blick, 1.0);
			Starling.juggler.add(delayCallBlick);
			
		}
		
		public function tween():void {
			
			btnNexTween = new Tween(btnNextSceleton, 2, Transitions.EASE_OUT);
			btnNexTween.animate("x", btnNextSceleton.x - 50);
			Starling.juggler.add(btnNexTween)
		
		}
		
		public function blick():void {
			
			btnNextSceleton.state.setAnimationByName(0, "blick", false);
		}
	
		
		private function onClick(event:TouchEvent):void {
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			
			if (touch) {
				
				Roots.assets.playSound("click");
				dispatchEventWith(START_SCENE_TWO, true, "classic")
				
			}
		}
	}
}