package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/customArrow2.png", "assets/images/customArrow2.png");
			type.set ("assets/images/customArrow2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/inputold.png", "assets/images/inputold.png");
			type.set ("assets/images/inputold.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalUps.png", "assets/images/directionalUps.png");
			type.set ("assets/images/directionalUps.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directional3.png", "assets/images/directional3.png");
			type.set ("assets/images/directional3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sig.png", "assets/images/sig.png");
			type.set ("assets/images/sig.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Levels.png", "assets/images/Levels.png");
			type.set ("assets/images/Levels.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MINUS.png", "assets/images/MINUS.png");
			type.set ("assets/images/MINUS.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Entypo_2d(0)_24.png", "assets/images/Entypo_2d(0)_24.png");
			type.set ("assets/images/Entypo_2d(0)_24.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/grouper.png", "assets/images/grouper.png");
			type.set ("assets/images/grouper.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifgreen2.png", "assets/images/ifgreen2.png");
			type.set ("assets/images/ifgreen2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalxUp.png", "assets/images/directionalxUp.png");
			type.set ("assets/images/directionalxUp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifblue2.png", "assets/images/ifblue2.png");
			type.set ("assets/images/ifblue2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/iterator2.png", "assets/images/iterator2.png");
			type.set ("assets/images/iterator2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/directional.png", "assets/images/directional.png");
			type.set ("assets/images/directional.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/arrowSprite.png", "assets/images/arrowSprite.png");
			type.set ("assets/images/arrowSprite.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalUpd.png", "assets/images/directionalUpd.png");
			type.set ("assets/images/directionalUpd.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionala.png", "assets/images/directionala.png");
			type.set ("assets/images/directionala.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bolt.png", "assets/images/bolt.png");
			type.set ("assets/images/bolt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/seq2.png", "assets/images/seq2.png");
			type.set ("assets/images/seq2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Entypo_2191(0)_36.bmp", "assets/images/Entypo_2191(0)_36.bmp");
			type.set ("assets/images/Entypo_2191(0)_36.bmp", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/color.png", "assets/images/color.png");
			type.set ("assets/images/color.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/outputs.png", "assets/images/outputs.png");
			type.set ("assets/images/outputs.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalUp.png", "assets/images/directionalUp.png");
			type.set ("assets/images/directionalUp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Entypo_2191(0)_32.png", "assets/images/Entypo_2191(0)_32.png");
			type.set ("assets/images/Entypo_2191(0)_32.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/output.png", "assets/images/output.png");
			type.set ("assets/images/output.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duplicato2.png", "assets/images/duplicato2.png");
			type.set ("assets/images/duplicato2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/discreptionPanel.png", "assets/images/discreptionPanel.png");
			type.set ("assets/images/discreptionPanel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/customArrow0.png", "assets/images/customArrow0.png");
			type.set ("assets/images/customArrow0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duplicators.png", "assets/images/duplicators.png");
			type.set ("assets/images/duplicators.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directional2.png", "assets/images/directional2.png");
			type.set ("assets/images/directional2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/waiter2.png", "assets/images/waiter2.png");
			type.set ("assets/images/waiter2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/customArrow4.png", "assets/images/customArrow4.png");
			type.set ("assets/images/customArrow4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Container.png", "assets/images/Container.png");
			type.set ("assets/images/Container.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Entypo_e4ad(0)_42.png", "assets/images/Entypo_e4ad(0)_42.png");
			type.set ("assets/images/Entypo_e4ad(0)_42.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pinkBlock.png", "assets/images/pinkBlock.png");
			type.set ("assets/images/pinkBlock.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/question.png", "assets/images/question.png");
			type.set ("assets/images/question.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionaly.png", "assets/images/directionaly.png");
			type.set ("assets/images/directionaly.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalUpd (2).png", "assets/images/directionalUpd (2).png");
			type.set ("assets/images/directionalUpd (2).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/inputd.png", "assets/images/inputd.png");
			type.set ("assets/images/inputd.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalUpi.png", "assets/images/directionalUpi.png");
			type.set ("assets/images/directionalUpi.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/outputold.png", "assets/images/outputold.png");
			type.set ("assets/images/outputold.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifgreen.png", "assets/images/ifgreen.png");
			type.set ("assets/images/ifgreen.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duplicator.png", "assets/images/duplicator.png");
			type.set ("assets/images/duplicator.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalLeft.png", "assets/images/directionalLeft.png");
			type.set ("assets/images/directionalLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/input.png", "assets/images/input.png");
			type.set ("assets/images/input.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/levelIcon.png", "assets/images/levelIcon.png");
			type.set ("assets/images/levelIcon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Balanced_scale_of_Justice.svg", "assets/images/Balanced_scale_of_Justice.svg");
			type.set ("assets/images/Balanced_scale_of_Justice.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/signal2.png", "assets/images/signal2.png");
			type.set ("assets/images/signal2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalsUp.png", "assets/images/directionalsUp.png");
			type.set ("assets/images/directionalsUp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directional - Copy.png", "assets/images/directional - Copy.png");
			type.set ("assets/images/directional - Copy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/seq.png", "assets/images/seq.png");
			type.set ("assets/images/seq.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PLUS.png", "assets/images/PLUS.png");
			type.set ("assets/images/PLUS.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/waiter.png", "assets/images/waiter.png");
			type.set ("assets/images/waiter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifred.png", "assets/images/ifred.png");
			type.set ("assets/images/ifred.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duplicatsor.png", "assets/images/duplicatsor.png");
			type.set ("assets/images/duplicatsor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directional5.png", "assets/images/directional5.png");
			type.set ("assets/images/directional5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifblue.png", "assets/images/ifblue.png");
			type.set ("assets/images/ifblue.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalDown.png", "assets/images/directionalDown.png");
			type.set ("assets/images/directionalDown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directional4.png", "assets/images/directional4.png");
			type.set ("assets/images/directional4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifred2.png", "assets/images/ifred2.png");
			type.set ("assets/images/ifred2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/customArrow1.png", "assets/images/customArrow1.png");
			type.set ("assets/images/customArrow1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cyanBlock.png", "assets/images/cyanBlock.png");
			type.set ("assets/images/cyanBlock.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/iterator.png", "assets/images/iterator.png");
			type.set ("assets/images/iterator.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/signal.png", "assets/images/signal.png");
			type.set ("assets/images/signal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/customArrow3.png", "assets/images/customArrow3.png");
			type.set ("assets/images/customArrow3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/transparent_spacer.gif", "assets/images/transparent_spacer.gif");
			type.set ("assets/images/transparent_spacer.gif", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/addblack.png", "assets/images/addblack.png");
			type.set ("assets/images/addblack.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Entypo_2b(1)_24.png", "assets/images/Entypo_2b(1)_24.png");
			type.set ("assets/images/Entypo_2b(1)_24.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ifblack.png", "assets/images/ifblack.png");
			type.set ("assets/images/ifblack.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duplicatosr.png", "assets/images/duplicatosr.png");
			type.set ("assets/images/duplicatosr.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/greenBlock.png", "assets/images/greenBlock.png");
			type.set ("assets/images/greenBlock.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/arrow.png", "assets/images/arrow.png");
			type.set ("assets/images/arrow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/groupesr.png", "assets/images/groupesr.png");
			type.set ("assets/images/groupesr.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/directionalRight.png", "assets/images/directionalRight.png");
			type.set ("assets/images/directionalRight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/fonts/font.png", "assets/fonts/font.png");
			type.set ("assets/fonts/font.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/fonts/font.fnt", "assets/fonts/font.fnt");
			type.set ("assets/fonts/font.fnt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/directionalUp.png", "assets/directionalUp.png");
			type.set ("assets/directionalUp.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/queries2.xml", "assets/data/queries2.xml");
			type.set ("assets/data/queries2.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/bolt.png", "assets/data/bolt.png");
			type.set ("assets/data/bolt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/queries.xml", "assets/data/queries.xml");
			type.set ("assets/data/queries.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/powerup.wav", "assets/sounds/powerup.wav");
			type.set ("assets/sounds/powerup.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/directionalLeft.png", "assets/directionalLeft.png");
			type.set ("assets/directionalLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/directionalDown.png", "assets/directionalDown.png");
			type.set ("assets/directionalDown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/directionalRight.png", "assets/directionalRight.png");
			type.set ("assets/directionalRight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
