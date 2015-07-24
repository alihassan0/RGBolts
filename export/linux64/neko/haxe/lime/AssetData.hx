package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/sig.png", "assets/images/sig.png");
			type.set ("assets/images/sig.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/grouper.png", "assets/images/grouper.png");
			type.set ("assets/images/grouper.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/directional.png", "assets/images/directional.png");
			type.set ("assets/images/directional.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/color.png", "assets/images/color.png");
			type.set ("assets/images/color.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/output.png", "assets/images/output.png");
			type.set ("assets/images/output.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/question.png", "assets/images/question.png");
			type.set ("assets/images/question.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifgreen.png", "assets/images/ifgreen.png");
			type.set ("assets/images/ifgreen.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duplicator.png", "assets/images/duplicator.png");
			type.set ("assets/images/duplicator.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/input.png", "assets/images/input.png");
			type.set ("assets/images/input.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/seq.png", "assets/images/seq.png");
			type.set ("assets/images/seq.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/waiter.png", "assets/images/waiter.png");
			type.set ("assets/images/waiter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifred.png", "assets/images/ifred.png");
			type.set ("assets/images/ifred.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifblue.png", "assets/images/ifblue.png");
			type.set ("assets/images/ifblue.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/iterator.png", "assets/images/iterator.png");
			type.set ("assets/images/iterator.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/signal.png", "assets/images/signal.png");
			type.set ("assets/images/signal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/queries2.xml", "assets/data/queries2.xml");
			type.set ("assets/data/queries2.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/queries.xml", "assets/data/queries.xml");
			type.set ("assets/data/queries.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
