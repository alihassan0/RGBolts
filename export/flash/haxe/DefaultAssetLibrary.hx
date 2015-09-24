package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/bolt.png", __ASSET__assets_data_bolt_png);
		type.set ("assets/data/bolt.png", AssetType.IMAGE);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/queries.xml", __ASSET__assets_data_queries_xml);
		type.set ("assets/data/queries.xml", AssetType.TEXT);
		className.set ("assets/data/queries2.xml", __ASSET__assets_data_queries2_xml);
		type.set ("assets/data/queries2.xml", AssetType.TEXT);
		className.set ("assets/fonts/font.fnt", __ASSET__assets_fonts_font_fnt);
		type.set ("assets/fonts/font.fnt", AssetType.TEXT);
		className.set ("assets/fonts/font.png", __ASSET__assets_fonts_font_png);
		type.set ("assets/fonts/font.png", AssetType.IMAGE);
		className.set ("assets/images/11952675_432665506919045_5219540445880059877_o.jpg", __ASSET__assets_images_11952675_432665506919045_5219540445880059877_o_jpg);
		type.set ("assets/images/11952675_432665506919045_5219540445880059877_o.jpg", AssetType.IMAGE);
		className.set ("assets/images/11953379_432665490252380_188288520794321636_o.jpg", __ASSET__assets_images_11953379_432665490252380_188288520794321636_o_jpg);
		type.set ("assets/images/11953379_432665490252380_188288520794321636_o.jpg", AssetType.IMAGE);
		className.set ("assets/images/addblack.png", __ASSET__assets_images_addblack_png);
		type.set ("assets/images/addblack.png", AssetType.IMAGE);
		className.set ("assets/images/arrow.png", __ASSET__assets_images_arrow_png);
		type.set ("assets/images/arrow.png", AssetType.IMAGE);
		className.set ("assets/images/arrowSprite.png", __ASSET__assets_images_arrowsprite_png);
		type.set ("assets/images/arrowSprite.png", AssetType.IMAGE);
		className.set ("assets/images/Balanced_scale_of_Justice.svg", __ASSET__assets_images_balanced_scale_of_justice_svg);
		type.set ("assets/images/Balanced_scale_of_Justice.svg", AssetType.TEXT);
		className.set ("assets/images/blueBlock.png", __ASSET__assets_images_blueblock_png);
		type.set ("assets/images/blueBlock.png", AssetType.IMAGE);
		className.set ("assets/images/bolt.png", __ASSET__assets_images_bolt_png);
		type.set ("assets/images/bolt.png", AssetType.IMAGE);
		className.set ("assets/images/color.png", __ASSET__assets_images_color_png);
		type.set ("assets/images/color.png", AssetType.IMAGE);
		className.set ("assets/images/Container.png", __ASSET__assets_images_container_png);
		type.set ("assets/images/Container.png", AssetType.IMAGE);
		className.set ("assets/images/customArrow0.png", __ASSET__assets_images_customarrow0_png);
		type.set ("assets/images/customArrow0.png", AssetType.IMAGE);
		className.set ("assets/images/customArrow1.png", __ASSET__assets_images_customarrow1_png);
		type.set ("assets/images/customArrow1.png", AssetType.IMAGE);
		className.set ("assets/images/customArrow2.png", __ASSET__assets_images_customarrow2_png);
		type.set ("assets/images/customArrow2.png", AssetType.IMAGE);
		className.set ("assets/images/customArrow3.png", __ASSET__assets_images_customarrow3_png);
		type.set ("assets/images/customArrow3.png", AssetType.IMAGE);
		className.set ("assets/images/customArrow4.png", __ASSET__assets_images_customarrow4_png);
		type.set ("assets/images/customArrow4.png", AssetType.IMAGE);
		className.set ("assets/images/cyanBlock.png", __ASSET__assets_images_cyanblock_png);
		type.set ("assets/images/cyanBlock.png", AssetType.IMAGE);
		className.set ("assets/images/directional - Copy.png", __ASSET__assets_images_directional___copy_png);
		type.set ("assets/images/directional - Copy.png", AssetType.IMAGE);
		className.set ("assets/images/directional.png", __ASSET__assets_images_directional_png);
		type.set ("assets/images/directional.png", AssetType.IMAGE);
		className.set ("assets/images/directional2.png", __ASSET__assets_images_directional2_png);
		type.set ("assets/images/directional2.png", AssetType.IMAGE);
		className.set ("assets/images/directional3.png", __ASSET__assets_images_directional3_png);
		type.set ("assets/images/directional3.png", AssetType.IMAGE);
		className.set ("assets/images/directional4.png", __ASSET__assets_images_directional4_png);
		type.set ("assets/images/directional4.png", AssetType.IMAGE);
		className.set ("assets/images/directional5.png", __ASSET__assets_images_directional5_png);
		type.set ("assets/images/directional5.png", AssetType.IMAGE);
		className.set ("assets/images/directionala.png", __ASSET__assets_images_directionala_png);
		type.set ("assets/images/directionala.png", AssetType.IMAGE);
		className.set ("assets/images/directionalDown.png", __ASSET__assets_images_directionaldown_png);
		type.set ("assets/images/directionalDown.png", AssetType.IMAGE);
		className.set ("assets/images/directionalLeft.png", __ASSET__assets_images_directionalleft_png);
		type.set ("assets/images/directionalLeft.png", AssetType.IMAGE);
		className.set ("assets/images/directionalRight.png", __ASSET__assets_images_directionalright_png);
		type.set ("assets/images/directionalRight.png", AssetType.IMAGE);
		className.set ("assets/images/directionalsUp.png", __ASSET__assets_images_directionalsup_png);
		type.set ("assets/images/directionalsUp.png", AssetType.IMAGE);
		className.set ("assets/images/directionalUp.png", __ASSET__assets_images_directionalup_png);
		type.set ("assets/images/directionalUp.png", AssetType.IMAGE);
		className.set ("assets/images/directionalUpd (2).png", __ASSET__assets_images_directionalupd__2__png);
		type.set ("assets/images/directionalUpd (2).png", AssetType.IMAGE);
		className.set ("assets/images/directionalUpd.png", __ASSET__assets_images_directionalupd_png);
		type.set ("assets/images/directionalUpd.png", AssetType.IMAGE);
		className.set ("assets/images/directionalUpi.png", __ASSET__assets_images_directionalupi_png);
		type.set ("assets/images/directionalUpi.png", AssetType.IMAGE);
		className.set ("assets/images/directionalUps.png", __ASSET__assets_images_directionalups_png);
		type.set ("assets/images/directionalUps.png", AssetType.IMAGE);
		className.set ("assets/images/directionalxUp.png", __ASSET__assets_images_directionalxup_png);
		type.set ("assets/images/directionalxUp.png", AssetType.IMAGE);
		className.set ("assets/images/directionaly.png", __ASSET__assets_images_directionaly_png);
		type.set ("assets/images/directionaly.png", AssetType.IMAGE);
		className.set ("assets/images/discreptionPanel.png", __ASSET__assets_images_discreptionpanel_png);
		type.set ("assets/images/discreptionPanel.png", AssetType.IMAGE);
		className.set ("assets/images/duplicato2.png", __ASSET__assets_images_duplicato2_png);
		type.set ("assets/images/duplicato2.png", AssetType.IMAGE);
		className.set ("assets/images/duplicator.png", __ASSET__assets_images_duplicator_png);
		type.set ("assets/images/duplicator.png", AssetType.IMAGE);
		className.set ("assets/images/duplicators.png", __ASSET__assets_images_duplicators_png);
		type.set ("assets/images/duplicators.png", AssetType.IMAGE);
		className.set ("assets/images/duplicatosr.png", __ASSET__assets_images_duplicatosr_png);
		type.set ("assets/images/duplicatosr.png", AssetType.IMAGE);
		className.set ("assets/images/duplicatsor.png", __ASSET__assets_images_duplicatsor_png);
		type.set ("assets/images/duplicatsor.png", AssetType.IMAGE);
		className.set ("assets/images/Entypo_2191(0)_32.png", __ASSET__assets_images_entypo_2191_0__32_png);
		type.set ("assets/images/Entypo_2191(0)_32.png", AssetType.IMAGE);
		className.set ("assets/images/Entypo_2191(0)_36.bmp", __ASSET__assets_images_entypo_2191_0__36_bmp);
		type.set ("assets/images/Entypo_2191(0)_36.bmp", AssetType.TEXT);
		className.set ("assets/images/Entypo_2b(1)_24.png", __ASSET__assets_images_entypo_2b_1__24_png);
		type.set ("assets/images/Entypo_2b(1)_24.png", AssetType.IMAGE);
		className.set ("assets/images/Entypo_2d(0)_24.png", __ASSET__assets_images_entypo_2d_0__24_png);
		type.set ("assets/images/Entypo_2d(0)_24.png", AssetType.IMAGE);
		className.set ("assets/images/Entypo_e4ad(0)_42.png", __ASSET__assets_images_entypo_e4ad_0__42_png);
		type.set ("assets/images/Entypo_e4ad(0)_42.png", AssetType.IMAGE);
		className.set ("assets/images/greenBlock.png", __ASSET__assets_images_greenblock_png);
		type.set ("assets/images/greenBlock.png", AssetType.IMAGE);
		className.set ("assets/images/grouper.png", __ASSET__assets_images_grouper_png);
		type.set ("assets/images/grouper.png", AssetType.IMAGE);
		className.set ("assets/images/groupesr.png", __ASSET__assets_images_groupesr_png);
		type.set ("assets/images/groupesr.png", AssetType.IMAGE);
		className.set ("assets/images/ifblack.png", __ASSET__assets_images_ifblack_png);
		type.set ("assets/images/ifblack.png", AssetType.IMAGE);
		className.set ("assets/images/ifblue.png", __ASSET__assets_images_ifblue_png);
		type.set ("assets/images/ifblue.png", AssetType.IMAGE);
		className.set ("assets/images/ifblue2.png", __ASSET__assets_images_ifblue2_png);
		type.set ("assets/images/ifblue2.png", AssetType.IMAGE);
		className.set ("assets/images/ifgreen.png", __ASSET__assets_images_ifgreen_png);
		type.set ("assets/images/ifgreen.png", AssetType.IMAGE);
		className.set ("assets/images/ifgreen2.png", __ASSET__assets_images_ifgreen2_png);
		type.set ("assets/images/ifgreen2.png", AssetType.IMAGE);
		className.set ("assets/images/ifred.png", __ASSET__assets_images_ifred_png);
		type.set ("assets/images/ifred.png", AssetType.IMAGE);
		className.set ("assets/images/ifred2.png", __ASSET__assets_images_ifred2_png);
		type.set ("assets/images/ifred2.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/input.png", __ASSET__assets_images_input_png);
		type.set ("assets/images/input.png", AssetType.IMAGE);
		className.set ("assets/images/inputd.png", __ASSET__assets_images_inputd_png);
		type.set ("assets/images/inputd.png", AssetType.IMAGE);
		className.set ("assets/images/inputold.png", __ASSET__assets_images_inputold_png);
		type.set ("assets/images/inputold.png", AssetType.IMAGE);
		className.set ("assets/images/iterator.png", __ASSET__assets_images_iterator_png);
		type.set ("assets/images/iterator.png", AssetType.IMAGE);
		className.set ("assets/images/iterator2.png", __ASSET__assets_images_iterator2_png);
		type.set ("assets/images/iterator2.png", AssetType.IMAGE);
		className.set ("assets/images/Laser.jpg", __ASSET__assets_images_laser_jpg);
		type.set ("assets/images/Laser.jpg", AssetType.IMAGE);
		className.set ("assets/images/levelIcon.png", __ASSET__assets_images_levelicon_png);
		type.set ("assets/images/levelIcon.png", AssetType.IMAGE);
		className.set ("assets/images/Levels.png", __ASSET__assets_images_levels_png);
		type.set ("assets/images/Levels.png", AssetType.IMAGE);
		className.set ("assets/images/MINUS.png", __ASSET__assets_images_minus_png);
		type.set ("assets/images/MINUS.png", AssetType.IMAGE);
		className.set ("assets/images/output.png", __ASSET__assets_images_output_png);
		type.set ("assets/images/output.png", AssetType.IMAGE);
		className.set ("assets/images/outputold.png", __ASSET__assets_images_outputold_png);
		type.set ("assets/images/outputold.png", AssetType.IMAGE);
		className.set ("assets/images/outputs.png", __ASSET__assets_images_outputs_png);
		type.set ("assets/images/outputs.png", AssetType.IMAGE);
		className.set ("assets/images/pinkBlock.png", __ASSET__assets_images_pinkblock_png);
		type.set ("assets/images/pinkBlock.png", AssetType.IMAGE);
		className.set ("assets/images/PLUS.png", __ASSET__assets_images_plus_png);
		type.set ("assets/images/PLUS.png", AssetType.IMAGE);
		className.set ("assets/images/question.png", __ASSET__assets_images_question_png);
		type.set ("assets/images/question.png", AssetType.IMAGE);
		className.set ("assets/images/seq.png", __ASSET__assets_images_seq_png);
		type.set ("assets/images/seq.png", AssetType.IMAGE);
		className.set ("assets/images/seq2.png", __ASSET__assets_images_seq2_png);
		type.set ("assets/images/seq2.png", AssetType.IMAGE);
		className.set ("assets/images/sig.png", __ASSET__assets_images_sig_png);
		type.set ("assets/images/sig.png", AssetType.IMAGE);
		className.set ("assets/images/signal.png", __ASSET__assets_images_signal_png);
		type.set ("assets/images/signal.png", AssetType.IMAGE);
		className.set ("assets/images/signal2.png", __ASSET__assets_images_signal2_png);
		type.set ("assets/images/signal2.png", AssetType.IMAGE);
		className.set ("assets/images/transparent_spacer.gif", __ASSET__assets_images_transparent_spacer_gif);
		type.set ("assets/images/transparent_spacer.gif", AssetType.IMAGE);
		className.set ("assets/images/waiter.png", __ASSET__assets_images_waiter_png);
		type.set ("assets/images/waiter.png", AssetType.IMAGE);
		className.set ("assets/images/waiter2.png", __ASSET__assets_images_waiter2_png);
		type.set ("assets/images/waiter2.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/powerup.wav", __ASSET__assets_sounds_powerup_wav);
		type.set ("assets/sounds/powerup.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/splash.swf", __ASSET__assets_splash_swf);
		type.set ("assets/splash.swf", AssetType.BINARY);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		className.set ("libraries/test/test.swf", __ASSET__libraries_test_test_swf);
		type.set ("libraries/test/test.swf", AssetType.BINARY);
		className.set ("libraries/test.json", __ASSET__libraries_test_json);
		type.set ("libraries/test.json", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/bolt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/queries.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/queries2.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/font.fnt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/font.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/11952675_432665506919045_5219540445880059877_o.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/11953379_432665490252380_188288520794321636_o.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/addblack.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/arrowSprite.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Balanced_scale_of_Justice.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/blueBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bolt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/color.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/customArrow4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cyanBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional - Copy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionala.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalDown.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalRight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalsUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUpd (2).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUpd.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUpi.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalUps.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionalxUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directionaly.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/discreptionPanel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicato2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicators.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicatosr.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicatsor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2191(0)_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2191(0)_36.bmp";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Entypo_2b(1)_24.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_2d(0)_24.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Entypo_e4ad(0)_42.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/greenBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/grouper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/groupesr.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblack.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblue2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifgreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifgreen2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifred.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifred2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/input.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/inputd.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/inputold.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/iterator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/iterator2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Laser.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelIcon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Levels.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MINUS.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/outputold.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/outputs.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pinkBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/PLUS.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/question.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sig.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/signal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/signal2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/transparent_spacer.gif";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/waiter.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/waiter2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/powerup.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/splash.swf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "libraries/test/test.swf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "libraries/test.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/bolt.png", __ASSET__assets_data_bolt_png);
		type.set ("assets/data/bolt.png", AssetType.IMAGE);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/queries.xml", __ASSET__assets_data_queries_xml);
		type.set ("assets/data/queries.xml", AssetType.TEXT);
		
		className.set ("assets/data/queries2.xml", __ASSET__assets_data_queries2_xml);
		type.set ("assets/data/queries2.xml", AssetType.TEXT);
		
		className.set ("assets/fonts/font.fnt", __ASSET__assets_fonts_font_fnt);
		type.set ("assets/fonts/font.fnt", AssetType.TEXT);
		
		className.set ("assets/fonts/font.png", __ASSET__assets_fonts_font_png);
		type.set ("assets/fonts/font.png", AssetType.IMAGE);
		
		className.set ("assets/images/11952675_432665506919045_5219540445880059877_o.jpg", __ASSET__assets_images_11952675_432665506919045_5219540445880059877_o_jpg);
		type.set ("assets/images/11952675_432665506919045_5219540445880059877_o.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/11953379_432665490252380_188288520794321636_o.jpg", __ASSET__assets_images_11953379_432665490252380_188288520794321636_o_jpg);
		type.set ("assets/images/11953379_432665490252380_188288520794321636_o.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/addblack.png", __ASSET__assets_images_addblack_png);
		type.set ("assets/images/addblack.png", AssetType.IMAGE);
		
		className.set ("assets/images/arrow.png", __ASSET__assets_images_arrow_png);
		type.set ("assets/images/arrow.png", AssetType.IMAGE);
		
		className.set ("assets/images/arrowSprite.png", __ASSET__assets_images_arrowsprite_png);
		type.set ("assets/images/arrowSprite.png", AssetType.IMAGE);
		
		className.set ("assets/images/Balanced_scale_of_Justice.svg", __ASSET__assets_images_balanced_scale_of_justice_svg);
		type.set ("assets/images/Balanced_scale_of_Justice.svg", AssetType.TEXT);
		
		className.set ("assets/images/blueBlock.png", __ASSET__assets_images_blueblock_png);
		type.set ("assets/images/blueBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/bolt.png", __ASSET__assets_images_bolt_png);
		type.set ("assets/images/bolt.png", AssetType.IMAGE);
		
		className.set ("assets/images/color.png", __ASSET__assets_images_color_png);
		type.set ("assets/images/color.png", AssetType.IMAGE);
		
		className.set ("assets/images/Container.png", __ASSET__assets_images_container_png);
		type.set ("assets/images/Container.png", AssetType.IMAGE);
		
		className.set ("assets/images/customArrow0.png", __ASSET__assets_images_customarrow0_png);
		type.set ("assets/images/customArrow0.png", AssetType.IMAGE);
		
		className.set ("assets/images/customArrow1.png", __ASSET__assets_images_customarrow1_png);
		type.set ("assets/images/customArrow1.png", AssetType.IMAGE);
		
		className.set ("assets/images/customArrow2.png", __ASSET__assets_images_customarrow2_png);
		type.set ("assets/images/customArrow2.png", AssetType.IMAGE);
		
		className.set ("assets/images/customArrow3.png", __ASSET__assets_images_customarrow3_png);
		type.set ("assets/images/customArrow3.png", AssetType.IMAGE);
		
		className.set ("assets/images/customArrow4.png", __ASSET__assets_images_customarrow4_png);
		type.set ("assets/images/customArrow4.png", AssetType.IMAGE);
		
		className.set ("assets/images/cyanBlock.png", __ASSET__assets_images_cyanblock_png);
		type.set ("assets/images/cyanBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional - Copy.png", __ASSET__assets_images_directional___copy_png);
		type.set ("assets/images/directional - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional.png", __ASSET__assets_images_directional_png);
		type.set ("assets/images/directional.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional2.png", __ASSET__assets_images_directional2_png);
		type.set ("assets/images/directional2.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional3.png", __ASSET__assets_images_directional3_png);
		type.set ("assets/images/directional3.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional4.png", __ASSET__assets_images_directional4_png);
		type.set ("assets/images/directional4.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional5.png", __ASSET__assets_images_directional5_png);
		type.set ("assets/images/directional5.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionala.png", __ASSET__assets_images_directionala_png);
		type.set ("assets/images/directionala.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalDown.png", __ASSET__assets_images_directionaldown_png);
		type.set ("assets/images/directionalDown.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalLeft.png", __ASSET__assets_images_directionalleft_png);
		type.set ("assets/images/directionalLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalRight.png", __ASSET__assets_images_directionalright_png);
		type.set ("assets/images/directionalRight.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalsUp.png", __ASSET__assets_images_directionalsup_png);
		type.set ("assets/images/directionalsUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalUp.png", __ASSET__assets_images_directionalup_png);
		type.set ("assets/images/directionalUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalUpd (2).png", __ASSET__assets_images_directionalupd__2__png);
		type.set ("assets/images/directionalUpd (2).png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalUpd.png", __ASSET__assets_images_directionalupd_png);
		type.set ("assets/images/directionalUpd.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalUpi.png", __ASSET__assets_images_directionalupi_png);
		type.set ("assets/images/directionalUpi.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalUps.png", __ASSET__assets_images_directionalups_png);
		type.set ("assets/images/directionalUps.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionalxUp.png", __ASSET__assets_images_directionalxup_png);
		type.set ("assets/images/directionalxUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/directionaly.png", __ASSET__assets_images_directionaly_png);
		type.set ("assets/images/directionaly.png", AssetType.IMAGE);
		
		className.set ("assets/images/discreptionPanel.png", __ASSET__assets_images_discreptionpanel_png);
		type.set ("assets/images/discreptionPanel.png", AssetType.IMAGE);
		
		className.set ("assets/images/duplicato2.png", __ASSET__assets_images_duplicato2_png);
		type.set ("assets/images/duplicato2.png", AssetType.IMAGE);
		
		className.set ("assets/images/duplicator.png", __ASSET__assets_images_duplicator_png);
		type.set ("assets/images/duplicator.png", AssetType.IMAGE);
		
		className.set ("assets/images/duplicators.png", __ASSET__assets_images_duplicators_png);
		type.set ("assets/images/duplicators.png", AssetType.IMAGE);
		
		className.set ("assets/images/duplicatosr.png", __ASSET__assets_images_duplicatosr_png);
		type.set ("assets/images/duplicatosr.png", AssetType.IMAGE);
		
		className.set ("assets/images/duplicatsor.png", __ASSET__assets_images_duplicatsor_png);
		type.set ("assets/images/duplicatsor.png", AssetType.IMAGE);
		
		className.set ("assets/images/Entypo_2191(0)_32.png", __ASSET__assets_images_entypo_2191_0__32_png);
		type.set ("assets/images/Entypo_2191(0)_32.png", AssetType.IMAGE);
		
		className.set ("assets/images/Entypo_2191(0)_36.bmp", __ASSET__assets_images_entypo_2191_0__36_bmp);
		type.set ("assets/images/Entypo_2191(0)_36.bmp", AssetType.TEXT);
		
		className.set ("assets/images/Entypo_2b(1)_24.png", __ASSET__assets_images_entypo_2b_1__24_png);
		type.set ("assets/images/Entypo_2b(1)_24.png", AssetType.IMAGE);
		
		className.set ("assets/images/Entypo_2d(0)_24.png", __ASSET__assets_images_entypo_2d_0__24_png);
		type.set ("assets/images/Entypo_2d(0)_24.png", AssetType.IMAGE);
		
		className.set ("assets/images/Entypo_e4ad(0)_42.png", __ASSET__assets_images_entypo_e4ad_0__42_png);
		type.set ("assets/images/Entypo_e4ad(0)_42.png", AssetType.IMAGE);
		
		className.set ("assets/images/greenBlock.png", __ASSET__assets_images_greenblock_png);
		type.set ("assets/images/greenBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/grouper.png", __ASSET__assets_images_grouper_png);
		type.set ("assets/images/grouper.png", AssetType.IMAGE);
		
		className.set ("assets/images/groupesr.png", __ASSET__assets_images_groupesr_png);
		type.set ("assets/images/groupesr.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifblack.png", __ASSET__assets_images_ifblack_png);
		type.set ("assets/images/ifblack.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifblue.png", __ASSET__assets_images_ifblue_png);
		type.set ("assets/images/ifblue.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifblue2.png", __ASSET__assets_images_ifblue2_png);
		type.set ("assets/images/ifblue2.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifgreen.png", __ASSET__assets_images_ifgreen_png);
		type.set ("assets/images/ifgreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifgreen2.png", __ASSET__assets_images_ifgreen2_png);
		type.set ("assets/images/ifgreen2.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifred.png", __ASSET__assets_images_ifred_png);
		type.set ("assets/images/ifred.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifred2.png", __ASSET__assets_images_ifred2_png);
		type.set ("assets/images/ifred2.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/input.png", __ASSET__assets_images_input_png);
		type.set ("assets/images/input.png", AssetType.IMAGE);
		
		className.set ("assets/images/inputd.png", __ASSET__assets_images_inputd_png);
		type.set ("assets/images/inputd.png", AssetType.IMAGE);
		
		className.set ("assets/images/inputold.png", __ASSET__assets_images_inputold_png);
		type.set ("assets/images/inputold.png", AssetType.IMAGE);
		
		className.set ("assets/images/iterator.png", __ASSET__assets_images_iterator_png);
		type.set ("assets/images/iterator.png", AssetType.IMAGE);
		
		className.set ("assets/images/iterator2.png", __ASSET__assets_images_iterator2_png);
		type.set ("assets/images/iterator2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Laser.jpg", __ASSET__assets_images_laser_jpg);
		type.set ("assets/images/Laser.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/levelIcon.png", __ASSET__assets_images_levelicon_png);
		type.set ("assets/images/levelIcon.png", AssetType.IMAGE);
		
		className.set ("assets/images/Levels.png", __ASSET__assets_images_levels_png);
		type.set ("assets/images/Levels.png", AssetType.IMAGE);
		
		className.set ("assets/images/MINUS.png", __ASSET__assets_images_minus_png);
		type.set ("assets/images/MINUS.png", AssetType.IMAGE);
		
		className.set ("assets/images/output.png", __ASSET__assets_images_output_png);
		type.set ("assets/images/output.png", AssetType.IMAGE);
		
		className.set ("assets/images/outputold.png", __ASSET__assets_images_outputold_png);
		type.set ("assets/images/outputold.png", AssetType.IMAGE);
		
		className.set ("assets/images/outputs.png", __ASSET__assets_images_outputs_png);
		type.set ("assets/images/outputs.png", AssetType.IMAGE);
		
		className.set ("assets/images/pinkBlock.png", __ASSET__assets_images_pinkblock_png);
		type.set ("assets/images/pinkBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/PLUS.png", __ASSET__assets_images_plus_png);
		type.set ("assets/images/PLUS.png", AssetType.IMAGE);
		
		className.set ("assets/images/question.png", __ASSET__assets_images_question_png);
		type.set ("assets/images/question.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq.png", __ASSET__assets_images_seq_png);
		type.set ("assets/images/seq.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq2.png", __ASSET__assets_images_seq2_png);
		type.set ("assets/images/seq2.png", AssetType.IMAGE);
		
		className.set ("assets/images/sig.png", __ASSET__assets_images_sig_png);
		type.set ("assets/images/sig.png", AssetType.IMAGE);
		
		className.set ("assets/images/signal.png", __ASSET__assets_images_signal_png);
		type.set ("assets/images/signal.png", AssetType.IMAGE);
		
		className.set ("assets/images/signal2.png", __ASSET__assets_images_signal2_png);
		type.set ("assets/images/signal2.png", AssetType.IMAGE);
		
		className.set ("assets/images/transparent_spacer.gif", __ASSET__assets_images_transparent_spacer_gif);
		type.set ("assets/images/transparent_spacer.gif", AssetType.IMAGE);
		
		className.set ("assets/images/waiter.png", __ASSET__assets_images_waiter_png);
		type.set ("assets/images/waiter.png", AssetType.IMAGE);
		
		className.set ("assets/images/waiter2.png", __ASSET__assets_images_waiter2_png);
		type.set ("assets/images/waiter2.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/powerup.wav", __ASSET__assets_sounds_powerup_wav);
		type.set ("assets/sounds/powerup.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/splash.swf", __ASSET__assets_splash_swf);
		type.set ("assets/splash.swf", AssetType.BINARY);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		className.set ("libraries/test/test.swf", __ASSET__libraries_test_test_swf);
		type.set ("libraries/test/test.swf", AssetType.BINARY);
		
		className.set ("libraries/test.json", __ASSET__libraries_test_json);
		type.set ("libraries/test.json", AssetType.TEXT);
		
		
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
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
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
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
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
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
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
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
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
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
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
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_bolt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_queries_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_queries2_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_font_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_font_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_11952675_432665506919045_5219540445880059877_o_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_11953379_432665490252380_188288520794321636_o_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_addblack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_arrowsprite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_balanced_scale_of_justice_svg extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_blueblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bolt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_color_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_customarrow0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_customarrow1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_customarrow2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_customarrow3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_customarrow4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cyanblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional___copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionala_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionaldown_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalsup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalupd__2__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalupd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalupi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalups_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionalxup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directionaly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_discreptionpanel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duplicato2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duplicator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duplicators_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duplicatosr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duplicatsor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_entypo_2191_0__32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_entypo_2191_0__36_bmp extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_entypo_2b_1__24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_entypo_2d_0__24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_entypo_e4ad_0__42_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_greenblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_grouper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_groupesr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifblack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifblue2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifgreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifgreen2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifred2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_input_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_inputd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_inputold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_iterator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_iterator2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_laser_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelicon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levels_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_minus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_outputold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_outputs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pinkblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_plus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_question_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_signal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_signal2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_transparent_spacer_gif extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_waiter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_waiter2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_powerup_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_splash_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__libraries_test_test_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__libraries_test_json extends flash.utils.ByteArray { }


#elseif html5




























































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 




#else



#if (windows || mac || linux || cpp)


@:image("assets/data/bolt.png") #if display private #end class __ASSET__assets_data_bolt_png extends lime.graphics.Image {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/data/queries.xml") #if display private #end class __ASSET__assets_data_queries_xml extends lime.utils.ByteArray {}
@:file("assets/data/queries2.xml") #if display private #end class __ASSET__assets_data_queries2_xml extends lime.utils.ByteArray {}
@:file("assets/fonts/font.fnt") #if display private #end class __ASSET__assets_fonts_font_fnt extends lime.utils.ByteArray {}
@:image("assets/fonts/font.png") #if display private #end class __ASSET__assets_fonts_font_png extends lime.graphics.Image {}
@:image("assets/images/11952675_432665506919045_5219540445880059877_o.jpg") #if display private #end class __ASSET__assets_images_11952675_432665506919045_5219540445880059877_o_jpg extends lime.graphics.Image {}
@:image("assets/images/11953379_432665490252380_188288520794321636_o.jpg") #if display private #end class __ASSET__assets_images_11953379_432665490252380_188288520794321636_o_jpg extends lime.graphics.Image {}
@:image("assets/images/addblack.png") #if display private #end class __ASSET__assets_images_addblack_png extends lime.graphics.Image {}
@:image("assets/images/arrow.png") #if display private #end class __ASSET__assets_images_arrow_png extends lime.graphics.Image {}
@:image("assets/images/arrowSprite.png") #if display private #end class __ASSET__assets_images_arrowsprite_png extends lime.graphics.Image {}
@:file("assets/images/Balanced_scale_of_Justice.svg") #if display private #end class __ASSET__assets_images_balanced_scale_of_justice_svg extends lime.utils.ByteArray {}
@:image("assets/images/blueBlock.png") #if display private #end class __ASSET__assets_images_blueblock_png extends lime.graphics.Image {}
@:image("assets/images/bolt.png") #if display private #end class __ASSET__assets_images_bolt_png extends lime.graphics.Image {}
@:image("assets/images/color.png") #if display private #end class __ASSET__assets_images_color_png extends lime.graphics.Image {}
@:image("assets/images/Container.png") #if display private #end class __ASSET__assets_images_container_png extends lime.graphics.Image {}
@:image("assets/images/customArrow0.png") #if display private #end class __ASSET__assets_images_customarrow0_png extends lime.graphics.Image {}
@:image("assets/images/customArrow1.png") #if display private #end class __ASSET__assets_images_customarrow1_png extends lime.graphics.Image {}
@:image("assets/images/customArrow2.png") #if display private #end class __ASSET__assets_images_customarrow2_png extends lime.graphics.Image {}
@:image("assets/images/customArrow3.png") #if display private #end class __ASSET__assets_images_customarrow3_png extends lime.graphics.Image {}
@:image("assets/images/customArrow4.png") #if display private #end class __ASSET__assets_images_customarrow4_png extends lime.graphics.Image {}
@:image("assets/images/cyanBlock.png") #if display private #end class __ASSET__assets_images_cyanblock_png extends lime.graphics.Image {}
@:image("assets/images/directional - Copy.png") #if display private #end class __ASSET__assets_images_directional___copy_png extends lime.graphics.Image {}
@:image("assets/images/directional.png") #if display private #end class __ASSET__assets_images_directional_png extends lime.graphics.Image {}
@:image("assets/images/directional2.png") #if display private #end class __ASSET__assets_images_directional2_png extends lime.graphics.Image {}
@:image("assets/images/directional3.png") #if display private #end class __ASSET__assets_images_directional3_png extends lime.graphics.Image {}
@:image("assets/images/directional4.png") #if display private #end class __ASSET__assets_images_directional4_png extends lime.graphics.Image {}
@:image("assets/images/directional5.png") #if display private #end class __ASSET__assets_images_directional5_png extends lime.graphics.Image {}
@:image("assets/images/directionala.png") #if display private #end class __ASSET__assets_images_directionala_png extends lime.graphics.Image {}
@:image("assets/images/directionalDown.png") #if display private #end class __ASSET__assets_images_directionaldown_png extends lime.graphics.Image {}
@:image("assets/images/directionalLeft.png") #if display private #end class __ASSET__assets_images_directionalleft_png extends lime.graphics.Image {}
@:image("assets/images/directionalRight.png") #if display private #end class __ASSET__assets_images_directionalright_png extends lime.graphics.Image {}
@:image("assets/images/directionalsUp.png") #if display private #end class __ASSET__assets_images_directionalsup_png extends lime.graphics.Image {}
@:image("assets/images/directionalUp.png") #if display private #end class __ASSET__assets_images_directionalup_png extends lime.graphics.Image {}
@:image("assets/images/directionalUpd (2).png") #if display private #end class __ASSET__assets_images_directionalupd__2__png extends lime.graphics.Image {}
@:image("assets/images/directionalUpd.png") #if display private #end class __ASSET__assets_images_directionalupd_png extends lime.graphics.Image {}
@:image("assets/images/directionalUpi.png") #if display private #end class __ASSET__assets_images_directionalupi_png extends lime.graphics.Image {}
@:image("assets/images/directionalUps.png") #if display private #end class __ASSET__assets_images_directionalups_png extends lime.graphics.Image {}
@:image("assets/images/directionalxUp.png") #if display private #end class __ASSET__assets_images_directionalxup_png extends lime.graphics.Image {}
@:image("assets/images/directionaly.png") #if display private #end class __ASSET__assets_images_directionaly_png extends lime.graphics.Image {}
@:image("assets/images/discreptionPanel.png") #if display private #end class __ASSET__assets_images_discreptionpanel_png extends lime.graphics.Image {}
@:image("assets/images/duplicato2.png") #if display private #end class __ASSET__assets_images_duplicato2_png extends lime.graphics.Image {}
@:image("assets/images/duplicator.png") #if display private #end class __ASSET__assets_images_duplicator_png extends lime.graphics.Image {}
@:image("assets/images/duplicators.png") #if display private #end class __ASSET__assets_images_duplicators_png extends lime.graphics.Image {}
@:image("assets/images/duplicatosr.png") #if display private #end class __ASSET__assets_images_duplicatosr_png extends lime.graphics.Image {}
@:image("assets/images/duplicatsor.png") #if display private #end class __ASSET__assets_images_duplicatsor_png extends lime.graphics.Image {}
@:image("assets/images/Entypo_2191(0)_32.png") #if display private #end class __ASSET__assets_images_entypo_2191_0__32_png extends lime.graphics.Image {}
@:file("assets/images/Entypo_2191(0)_36.bmp") #if display private #end class __ASSET__assets_images_entypo_2191_0__36_bmp extends lime.utils.ByteArray {}
@:image("assets/images/Entypo_2b(1)_24.png") #if display private #end class __ASSET__assets_images_entypo_2b_1__24_png extends lime.graphics.Image {}
@:image("assets/images/Entypo_2d(0)_24.png") #if display private #end class __ASSET__assets_images_entypo_2d_0__24_png extends lime.graphics.Image {}
@:image("assets/images/Entypo_e4ad(0)_42.png") #if display private #end class __ASSET__assets_images_entypo_e4ad_0__42_png extends lime.graphics.Image {}
@:image("assets/images/greenBlock.png") #if display private #end class __ASSET__assets_images_greenblock_png extends lime.graphics.Image {}
@:image("assets/images/grouper.png") #if display private #end class __ASSET__assets_images_grouper_png extends lime.graphics.Image {}
@:image("assets/images/groupesr.png") #if display private #end class __ASSET__assets_images_groupesr_png extends lime.graphics.Image {}
@:image("assets/images/ifblack.png") #if display private #end class __ASSET__assets_images_ifblack_png extends lime.graphics.Image {}
@:image("assets/images/ifblue.png") #if display private #end class __ASSET__assets_images_ifblue_png extends lime.graphics.Image {}
@:image("assets/images/ifblue2.png") #if display private #end class __ASSET__assets_images_ifblue2_png extends lime.graphics.Image {}
@:image("assets/images/ifgreen.png") #if display private #end class __ASSET__assets_images_ifgreen_png extends lime.graphics.Image {}
@:image("assets/images/ifgreen2.png") #if display private #end class __ASSET__assets_images_ifgreen2_png extends lime.graphics.Image {}
@:image("assets/images/ifred.png") #if display private #end class __ASSET__assets_images_ifred_png extends lime.graphics.Image {}
@:image("assets/images/ifred2.png") #if display private #end class __ASSET__assets_images_ifred2_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/input.png") #if display private #end class __ASSET__assets_images_input_png extends lime.graphics.Image {}
@:image("assets/images/inputd.png") #if display private #end class __ASSET__assets_images_inputd_png extends lime.graphics.Image {}
@:image("assets/images/inputold.png") #if display private #end class __ASSET__assets_images_inputold_png extends lime.graphics.Image {}
@:image("assets/images/iterator.png") #if display private #end class __ASSET__assets_images_iterator_png extends lime.graphics.Image {}
@:image("assets/images/iterator2.png") #if display private #end class __ASSET__assets_images_iterator2_png extends lime.graphics.Image {}
@:image("assets/images/Laser.jpg") #if display private #end class __ASSET__assets_images_laser_jpg extends lime.graphics.Image {}
@:image("assets/images/levelIcon.png") #if display private #end class __ASSET__assets_images_levelicon_png extends lime.graphics.Image {}
@:image("assets/images/Levels.png") #if display private #end class __ASSET__assets_images_levels_png extends lime.graphics.Image {}
@:image("assets/images/MINUS.png") #if display private #end class __ASSET__assets_images_minus_png extends lime.graphics.Image {}
@:image("assets/images/output.png") #if display private #end class __ASSET__assets_images_output_png extends lime.graphics.Image {}
@:image("assets/images/outputold.png") #if display private #end class __ASSET__assets_images_outputold_png extends lime.graphics.Image {}
@:image("assets/images/outputs.png") #if display private #end class __ASSET__assets_images_outputs_png extends lime.graphics.Image {}
@:image("assets/images/pinkBlock.png") #if display private #end class __ASSET__assets_images_pinkblock_png extends lime.graphics.Image {}
@:image("assets/images/PLUS.png") #if display private #end class __ASSET__assets_images_plus_png extends lime.graphics.Image {}
@:image("assets/images/question.png") #if display private #end class __ASSET__assets_images_question_png extends lime.graphics.Image {}
@:image("assets/images/seq.png") #if display private #end class __ASSET__assets_images_seq_png extends lime.graphics.Image {}
@:image("assets/images/seq2.png") #if display private #end class __ASSET__assets_images_seq2_png extends lime.graphics.Image {}
@:image("assets/images/sig.png") #if display private #end class __ASSET__assets_images_sig_png extends lime.graphics.Image {}
@:image("assets/images/signal.png") #if display private #end class __ASSET__assets_images_signal_png extends lime.graphics.Image {}
@:image("assets/images/signal2.png") #if display private #end class __ASSET__assets_images_signal2_png extends lime.graphics.Image {}
@:image("assets/images/transparent_spacer.gif") #if display private #end class __ASSET__assets_images_transparent_spacer_gif extends lime.graphics.Image {}
@:image("assets/images/waiter.png") #if display private #end class __ASSET__assets_images_waiter_png extends lime.graphics.Image {}
@:image("assets/images/waiter2.png") #if display private #end class __ASSET__assets_images_waiter2_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/powerup.wav") #if display private #end class __ASSET__assets_sounds_powerup_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/splash.swf") #if display private #end class __ASSET__assets_splash_swf extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}
@:file("assets/splash.swf") #if display private #end class __ASSET__libraries_test_test_swf extends lime.utils.ByteArray {}
@:file("") #if display private #end class __ASSET__libraries_test_json extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end