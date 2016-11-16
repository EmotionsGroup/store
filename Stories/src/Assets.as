package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="../media/textures/coinBtn.png")]
		static public const CoinBtn:Class;
		
		[Embed(source="../media/textures/bablik_1.png")]
		static public const Bablik:Class; 
		
		public static var storeTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture {
			
			if (storeTextures[name] == undefined) {
				
				var bitmap:Bitmap = new Assets[name]();
				storeTextures[name] = Texture.fromBitmap(bitmap);
			}
			
			return storeTextures[name];
		}
	}
}