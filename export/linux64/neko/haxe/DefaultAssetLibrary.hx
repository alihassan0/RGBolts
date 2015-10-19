package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/images/customArrow2.png", "assets/images/customArrow2.png");
		type.set ("assets/images/customArrow2.png", AssetType.IMAGE);
		path.set ("assets/images/inputold.png", "assets/images/inputold.png");
		type.set ("assets/images/inputold.png", AssetType.IMAGE);
		path.set ("assets/images/directionalUps.png", "assets/images/directionalUps.png");
		type.set ("assets/images/directionalUps.png", AssetType.IMAGE);
		path.set ("assets/images/directional3.png", "assets/images/directional3.png");
		type.set ("assets/images/directional3.png", AssetType.IMAGE);
		path.set ("assets/images/sig.png", "assets/images/sig.png");
		type.set ("assets/images/sig.png", AssetType.IMAGE);
		path.set ("assets/images/Levels.png", "assets/images/Levels.png");
		type.set ("assets/images/Levels.png", AssetType.IMAGE);
		path.set ("assets/images/MINUS.png", "assets/images/MINUS.png");
		type.set ("assets/images/MINUS.png", AssetType.IMAGE);
		path.set ("assets/images/Entypo_2d(0)_24.png", "assets/images/Entypo_2d(0)_24.png");
		type.set ("assets/images/Entypo_2d(0)_24.png", AssetType.IMAGE);
		path.set ("assets/images/grouper.png", "assets/images/grouper.png");
		type.set ("assets/images/grouper.png", AssetType.IMAGE);
		path.set ("assets/images/ifgreen2.png", "assets/images/ifgreen2.png");
		type.set ("assets/images/ifgreen2.png", AssetType.IMAGE);
		path.set ("assets/images/directionalxUp.png", "assets/images/directionalxUp.png");
		type.set ("assets/images/directionalxUp.png", AssetType.IMAGE);
		path.set ("assets/images/ifblue2.png", "assets/images/ifblue2.png");
		type.set ("assets/images/ifblue2.png", AssetType.IMAGE);
		path.set ("assets/images/iterator2.png", "assets/images/iterator2.png");
		type.set ("assets/images/iterator2.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/directional.png", "assets/images/directional.png");
		type.set ("assets/images/directional.png", AssetType.IMAGE);
		path.set ("assets/images/arrowSprite.png", "assets/images/arrowSprite.png");
		type.set ("assets/images/arrowSprite.png", AssetType.IMAGE);
		path.set ("assets/images/directionalUpd.png", "assets/images/directionalUpd.png");
		type.set ("assets/images/directionalUpd.png", AssetType.IMAGE);
		path.set ("assets/images/directionala.png", "assets/images/directionala.png");
		type.set ("assets/images/directionala.png", AssetType.IMAGE);
		path.set ("assets/images/bolt.png", "assets/images/bolt.png");
		type.set ("assets/images/bolt.png", AssetType.IMAGE);
		path.set ("assets/images/seq2.png", "assets/images/seq2.png");
		type.set ("assets/images/seq2.png", AssetType.IMAGE);
		path.set ("assets/images/Entypo_2191(0)_36.bmp", "assets/images/Entypo_2191(0)_36.bmp");
		type.set ("assets/images/Entypo_2191(0)_36.bmp", AssetType.TEXT);
		path.set ("assets/images/color.png", "assets/images/color.png");
		type.set ("assets/images/color.png", AssetType.IMAGE);
		path.set ("assets/images/outputs.png", "assets/images/outputs.png");
		type.set ("assets/images/outputs.png", AssetType.IMAGE);
		path.set ("assets/images/directionalUp.png", "assets/images/directionalUp.png");
		type.set ("assets/images/directionalUp.png", AssetType.IMAGE);
		path.set ("assets/images/Entypo_2191(0)_32.png", "assets/images/Entypo_2191(0)_32.png");
		type.set ("assets/images/Entypo_2191(0)_32.png", AssetType.IMAGE);
		path.set ("assets/images/output.png", "assets/images/output.png");
		type.set ("assets/images/output.png", AssetType.IMAGE);
		path.set ("assets/images/blueBlock.png", "assets/images/blueBlock.png");
		type.set ("assets/images/blueBlock.png", AssetType.IMAGE);
		path.set ("assets/images/duplicato2.png", "assets/images/duplicato2.png");
		type.set ("assets/images/duplicato2.png", AssetType.IMAGE);
		path.set ("assets/images/discreptionPanel.png", "assets/images/discreptionPanel.png");
		type.set ("assets/images/discreptionPanel.png", AssetType.IMAGE);
		path.set ("assets/images/customArrow0.png", "assets/images/customArrow0.png");
		type.set ("assets/images/customArrow0.png", AssetType.IMAGE);
		path.set ("assets/images/duplicators.png", "assets/images/duplicators.png");
		type.set ("assets/images/duplicators.png", AssetType.IMAGE);
		path.set ("assets/images/directional2.png", "assets/images/directional2.png");
		type.set ("assets/images/directional2.png", AssetType.IMAGE);
		path.set ("assets/images/waiter2.png", "assets/images/waiter2.png");
		type.set ("assets/images/waiter2.png", AssetType.IMAGE);
		path.set ("assets/images/customArrow4.png", "assets/images/customArrow4.png");
		type.set ("assets/images/customArrow4.png", AssetType.IMAGE);
		path.set ("assets/images/Container.png", "assets/images/Container.png");
		type.set ("assets/images/Container.png", AssetType.IMAGE);
		path.set ("assets/images/Entypo_e4ad(0)_42.png", "assets/images/Entypo_e4ad(0)_42.png");
		type.set ("assets/images/Entypo_e4ad(0)_42.png", AssetType.IMAGE);
		path.set ("assets/images/pinkBlock.png", "assets/images/pinkBlock.png");
		type.set ("assets/images/pinkBlock.png", AssetType.IMAGE);
		path.set ("assets/images/question.png", "assets/images/question.png");
		type.set ("assets/images/question.png", AssetType.IMAGE);
		path.set ("assets/images/directionaly.png", "assets/images/directionaly.png");
		type.set ("assets/images/directionaly.png", AssetType.IMAGE);
		path.set ("assets/images/directionalUpd (2).png", "assets/images/directionalUpd (2).png");
		type.set ("assets/images/directionalUpd (2).png", AssetType.IMAGE);
		path.set ("assets/images/inputd.png", "assets/images/inputd.png");
		type.set ("assets/images/inputd.png", AssetType.IMAGE);
		path.set ("assets/images/directionalUpi.png", "assets/images/directionalUpi.png");
		type.set ("assets/images/directionalUpi.png", AssetType.IMAGE);
		path.set ("assets/images/outputold.png", "assets/images/outputold.png");
		type.set ("assets/images/outputold.png", AssetType.IMAGE);
		path.set ("assets/images/ifgreen.png", "assets/images/ifgreen.png");
		type.set ("assets/images/ifgreen.png", AssetType.IMAGE);
		path.set ("assets/images/duplicator.png", "assets/images/duplicator.png");
		type.set ("assets/images/duplicator.png", AssetType.IMAGE);
		path.set ("assets/images/directionalLeft.png", "assets/images/directionalLeft.png");
		type.set ("assets/images/directionalLeft.png", AssetType.IMAGE);
		path.set ("assets/images/input.png", "assets/images/input.png");
		type.set ("assets/images/input.png", AssetType.IMAGE);
		path.set ("assets/images/levelIcon.png", "assets/images/levelIcon.png");
		type.set ("assets/images/levelIcon.png", AssetType.IMAGE);
		path.set ("assets/images/Balanced_scale_of_Justice.svg", "assets/images/Balanced_scale_of_Justice.svg");
		type.set ("assets/images/Balanced_scale_of_Justice.svg", AssetType.TEXT);
		path.set ("assets/images/signal2.png", "assets/images/signal2.png");
		type.set ("assets/images/signal2.png", AssetType.IMAGE);
		path.set ("assets/images/directionalsUp.png", "assets/images/directionalsUp.png");
		type.set ("assets/images/directionalsUp.png", AssetType.IMAGE);
		path.set ("assets/images/directional - Copy.png", "assets/images/directional - Copy.png");
		type.set ("assets/images/directional - Copy.png", AssetType.IMAGE);
		path.set ("assets/images/seq.png", "assets/images/seq.png");
		type.set ("assets/images/seq.png", AssetType.IMAGE);
		path.set ("assets/images/PLUS.png", "assets/images/PLUS.png");
		type.set ("assets/images/PLUS.png", AssetType.IMAGE);
		path.set ("assets/images/waiter.png", "assets/images/waiter.png");
		type.set ("assets/images/waiter.png", AssetType.IMAGE);
		path.set ("assets/images/ifred.png", "assets/images/ifred.png");
		type.set ("assets/images/ifred.png", AssetType.IMAGE);
		path.set ("assets/images/duplicatsor.png", "assets/images/duplicatsor.png");
		type.set ("assets/images/duplicatsor.png", AssetType.IMAGE);
		path.set ("assets/images/directional5.png", "assets/images/directional5.png");
		type.set ("assets/images/directional5.png", AssetType.IMAGE);
		path.set ("assets/images/ifblue.png", "assets/images/ifblue.png");
		type.set ("assets/images/ifblue.png", AssetType.IMAGE);
		path.set ("assets/images/directionalDown.png", "assets/images/directionalDown.png");
		type.set ("assets/images/directionalDown.png", AssetType.IMAGE);
		path.set ("assets/images/directional4.png", "assets/images/directional4.png");
		type.set ("assets/images/directional4.png", AssetType.IMAGE);
		path.set ("assets/images/ifred2.png", "assets/images/ifred2.png");
		type.set ("assets/images/ifred2.png", AssetType.IMAGE);
		path.set ("assets/images/customArrow1.png", "assets/images/customArrow1.png");
		type.set ("assets/images/customArrow1.png", AssetType.IMAGE);
		path.set ("assets/images/cyanBlock.png", "assets/images/cyanBlock.png");
		type.set ("assets/images/cyanBlock.png", AssetType.IMAGE);
		path.set ("assets/images/iterator.png", "assets/images/iterator.png");
		type.set ("assets/images/iterator.png", AssetType.IMAGE);
		path.set ("assets/images/signal.png", "assets/images/signal.png");
		type.set ("assets/images/signal.png", AssetType.IMAGE);
		path.set ("assets/images/arrow2X.png", "assets/images/arrow2X.png");
		type.set ("assets/images/arrow2X.png", AssetType.IMAGE);
		path.set ("assets/images/customArrow3.png", "assets/images/customArrow3.png");
		type.set ("assets/images/customArrow3.png", AssetType.IMAGE);
		path.set ("assets/images/transparent_spacer.gif", "assets/images/transparent_spacer.gif");
		type.set ("assets/images/transparent_spacer.gif", AssetType.IMAGE);
		path.set ("assets/images/addblack.png", "assets/images/addblack.png");
		type.set ("assets/images/addblack.png", AssetType.IMAGE);
		path.set ("assets/images/Entypo_2b(1)_24.png", "assets/images/Entypo_2b(1)_24.png");
		type.set ("assets/images/Entypo_2b(1)_24.png", AssetType.IMAGE);
		path.set ("assets/images/ifblack.png", "assets/images/ifblack.png");
		type.set ("assets/images/ifblack.png", AssetType.IMAGE);
		path.set ("assets/images/duplicatosr.png", "assets/images/duplicatosr.png");
		type.set ("assets/images/duplicatosr.png", AssetType.IMAGE);
		path.set ("assets/images/greenBlock.png", "assets/images/greenBlock.png");
		type.set ("assets/images/greenBlock.png", AssetType.IMAGE);
		path.set ("assets/images/arrow.png", "assets/images/arrow.png");
		type.set ("assets/images/arrow.png", AssetType.IMAGE);
		path.set ("assets/images/groupesr.png", "assets/images/groupesr.png");
		type.set ("assets/images/groupesr.png", AssetType.IMAGE);
		path.set ("assets/images/directionalRight.png", "assets/images/directionalRight.png");
		type.set ("assets/images/directionalRight.png", AssetType.IMAGE);
		path.set ("assets/fonts/font.png", "assets/fonts/font.png");
		type.set ("assets/fonts/font.png", AssetType.IMAGE);
		path.set ("assets/fonts/font.fnt", "assets/fonts/font.fnt");
		type.set ("assets/fonts/font.fnt", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/bolt.png", "assets/data/bolt.png");
		type.set ("assets/data/bolt.png", AssetType.IMAGE);
		path.set ("assets/data/queries.xml", "assets/data/queries.xml");
		type.set ("assets/data/queries.xml", AssetType.TEXT);
		path.set ("assets/sounds/powerup.wav", "assets/sounds/powerup.wav");
		type.set ("assets/sounds/powerup.wav", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/images/customArrow2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/inputold.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUps.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sig.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Levels.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MINUS.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2d(0)_24.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/grouper.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifgreen2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalxUp.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblue2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/iterator2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/directional.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/arrowSprite.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUpd.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionala.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bolt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2191(0)_36.bmp";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/color.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/outputs.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUp.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2191(0)_32.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/output.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blueBlock.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicato2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/discreptionPanel.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicators.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/waiter2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Container.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_e4ad(0)_42.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pinkBlock.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/question.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionaly.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUpd (2).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/inputd.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUpi.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/outputold.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifgreen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicator.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalLeft.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/input.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelIcon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Balanced_scale_of_Justice.svg";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/signal2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalsUp.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional - Copy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/PLUS.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/waiter.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifred.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicatsor.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblue.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalDown.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifred2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cyanBlock.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/iterator.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/signal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/arrow2X.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/transparent_spacer.gif";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/addblack.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2b(1)_24.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblack.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicatosr.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/greenBlock.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/arrow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/groupesr.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalRight.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/fonts/font.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/fonts/font.fnt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/bolt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/queries.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/powerup.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		#else
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__assets_fonts_arial_ttf);
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash
























































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5
























































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "Nokia Cellphone FC Small"; } #end }
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "Arial"; } #end }


#else

#if (windows || mac || linux)


@:font("/usr/lib/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("/usr/lib/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") @:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font {}





#else


class __ASSET__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/arial.ttf"; fontName = "Arial";  }}


#end

#end
