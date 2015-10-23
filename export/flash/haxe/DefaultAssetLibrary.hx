package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
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

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
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
		
		#if flash
		
		className.set ("assets/images/blocks/grid/arrowSprite.png", __ASSET__assets_images_blocks_grid_arrowsprite_png);
		type.set ("assets/images/blocks/grid/arrowSprite.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/directionalUp.png", __ASSET__assets_images_blocks_grid_directionalup_png);
		type.set ("assets/images/blocks/grid/directionalUp.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/output.png", __ASSET__assets_images_blocks_grid_output_png);
		type.set ("assets/images/blocks/grid/output.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/blueBlock.png", __ASSET__assets_images_blocks_grid_blueblock_png);
		type.set ("assets/images/blocks/grid/blueBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/pinkBlock.png", __ASSET__assets_images_blocks_grid_pinkblock_png);
		type.set ("assets/images/blocks/grid/pinkBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/input.png", __ASSET__assets_images_blocks_grid_input_png);
		type.set ("assets/images/blocks/grid/input.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/cyanBlock.png", __ASSET__assets_images_blocks_grid_cyanblock_png);
		type.set ("assets/images/blocks/grid/cyanBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/grid/greenBlock.png", __ASSET__assets_images_blocks_grid_greenblock_png);
		type.set ("assets/images/blocks/grid/greenBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/customizable/blueBlock.png", __ASSET__assets_images_blocks_customizable_blueblock_png);
		type.set ("assets/images/blocks/customizable/blueBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/customizable/pinkBlock.png", __ASSET__assets_images_blocks_customizable_pinkblock_png);
		type.set ("assets/images/blocks/customizable/pinkBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/customizable/cyanBlock.png", __ASSET__assets_images_blocks_customizable_cyanblock_png);
		type.set ("assets/images/blocks/customizable/cyanBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/customizable/arrow2X.png", __ASSET__assets_images_blocks_customizable_arrow2x_png);
		type.set ("assets/images/blocks/customizable/arrow2X.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/customizable/greenBlock.png", __ASSET__assets_images_blocks_customizable_greenblock_png);
		type.set ("assets/images/blocks/customizable/greenBlock.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/grouper.png", __ASSET__assets_images_blocks_icons_grouper_png);
		type.set ("assets/images/blocks/icons/grouper.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/directionalUp.png", __ASSET__assets_images_blocks_icons_directionalup_png);
		type.set ("assets/images/blocks/icons/directionalUp.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/duplicator.png", __ASSET__assets_images_blocks_icons_duplicator_png);
		type.set ("assets/images/blocks/icons/duplicator.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/waiter.png", __ASSET__assets_images_blocks_icons_waiter_png);
		type.set ("assets/images/blocks/icons/waiter.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/ifred.png", __ASSET__assets_images_blocks_icons_ifred_png);
		type.set ("assets/images/blocks/icons/ifred.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/iterator.png", __ASSET__assets_images_blocks_icons_iterator_png);
		type.set ("assets/images/blocks/icons/iterator.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/signal.png", __ASSET__assets_images_blocks_icons_signal_png);
		type.set ("assets/images/blocks/icons/signal.png", AssetType.IMAGE);
		className.set ("assets/images/blocks/icons/addblack.png", __ASSET__assets_images_blocks_icons_addblack_png);
		type.set ("assets/images/blocks/icons/addblack.png", AssetType.IMAGE);
		className.set ("assets/images/levelSelector/Levels.png", __ASSET__assets_images_levelselector_levels_png);
		type.set ("assets/images/levelSelector/Levels.png", AssetType.IMAGE);
		className.set ("assets/images/levelSelector/discreptionPanel.png", __ASSET__assets_images_levelselector_discreptionpanel_png);
		type.set ("assets/images/levelSelector/discreptionPanel.png", AssetType.IMAGE);
		className.set ("assets/images/levelSelector/levelIcon.png", __ASSET__assets_images_levelselector_levelicon_png);
		type.set ("assets/images/levelSelector/levelIcon.png", AssetType.IMAGE);
		className.set ("assets/images/seq/sig.png", __ASSET__assets_images_seq_sig_png);
		type.set ("assets/images/seq/sig.png", AssetType.IMAGE);
		className.set ("assets/images/seq/bolt.png", __ASSET__assets_images_seq_bolt_png);
		type.set ("assets/images/seq/bolt.png", AssetType.IMAGE);
		className.set ("assets/images/seq/seq.png", __ASSET__assets_images_seq_seq_png);
		type.set ("assets/images/seq/seq.png", AssetType.IMAGE);
		className.set ("assets/images/GUI/panels/Container.png", __ASSET__assets_images_gui_panels_container_png);
		type.set ("assets/images/GUI/panels/Container.png", AssetType.IMAGE);
		className.set ("assets/images/GUI/buttons/plus.png", __ASSET__assets_images_gui_buttons_plus_png);
		type.set ("assets/images/GUI/buttons/plus.png", AssetType.IMAGE);
		className.set ("assets/images/GUI/buttons/minus.png", __ASSET__assets_images_gui_buttons_minus_png);
		type.set ("assets/images/GUI/buttons/minus.png", AssetType.IMAGE);
		className.set ("assets/images/GUI/buttons/question.png", __ASSET__assets_images_gui_buttons_question_png);
		type.set ("assets/images/GUI/buttons/question.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/customArrow2.png", __ASSET__assets_images_useless_images_customarrow2_png);
		type.set ("assets/images/useless images/customArrow2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/inputold.png", __ASSET__assets_images_useless_images_inputold_png);
		type.set ("assets/images/useless images/inputold.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalUps.png", __ASSET__assets_images_useless_images_directionalups_png);
		type.set ("assets/images/useless images/directionalUps.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directional3.png", __ASSET__assets_images_useless_images_directional3_png);
		type.set ("assets/images/useless images/directional3.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/sig.png", __ASSET__assets_images_useless_images_sig_png);
		type.set ("assets/images/useless images/sig.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/MINUS.png", __ASSET__assets_images_useless_images_minus_png);
		type.set ("assets/images/useless images/MINUS.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/Entypo_2d(0)_24.png", __ASSET__assets_images_useless_images_entypo_2d_0__24_png);
		type.set ("assets/images/useless images/Entypo_2d(0)_24.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/ifgreen2.png", __ASSET__assets_images_useless_images_ifgreen2_png);
		type.set ("assets/images/useless images/ifgreen2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalxUp.png", __ASSET__assets_images_useless_images_directionalxup_png);
		type.set ("assets/images/useless images/directionalxUp.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/ifblue2.png", __ASSET__assets_images_useless_images_ifblue2_png);
		type.set ("assets/images/useless images/ifblue2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/iterator2.png", __ASSET__assets_images_useless_images_iterator2_png);
		type.set ("assets/images/useless images/iterator2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/images-go-here.txt", __ASSET__assets_images_useless_images_images_go_here_txt);
		type.set ("assets/images/useless images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/useless images/directional.png", __ASSET__assets_images_useless_images_directional_png);
		type.set ("assets/images/useless images/directional.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalUpd.png", __ASSET__assets_images_useless_images_directionalupd_png);
		type.set ("assets/images/useless images/directionalUpd.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionala.png", __ASSET__assets_images_useless_images_directionala_png);
		type.set ("assets/images/useless images/directionala.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/bolt.png", __ASSET__assets_images_useless_images_bolt_png);
		type.set ("assets/images/useless images/bolt.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/seq2.png", __ASSET__assets_images_useless_images_seq2_png);
		type.set ("assets/images/useless images/seq2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/Entypo_2191(0)_36.bmp", __ASSET__assets_images_useless_images_entypo_2191_0__36_bmp);
		type.set ("assets/images/useless images/Entypo_2191(0)_36.bmp", AssetType.TEXT);
		className.set ("assets/images/useless images/color.png", __ASSET__assets_images_useless_images_color_png);
		type.set ("assets/images/useless images/color.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/outputs.png", __ASSET__assets_images_useless_images_outputs_png);
		type.set ("assets/images/useless images/outputs.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/Entypo_2191(0)_32.png", __ASSET__assets_images_useless_images_entypo_2191_0__32_png);
		type.set ("assets/images/useless images/Entypo_2191(0)_32.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/output.png", __ASSET__assets_images_useless_images_output_png);
		type.set ("assets/images/useless images/output.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/duplicato2.png", __ASSET__assets_images_useless_images_duplicato2_png);
		type.set ("assets/images/useless images/duplicato2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/discreptionPanel.png", __ASSET__assets_images_useless_images_discreptionpanel_png);
		type.set ("assets/images/useless images/discreptionPanel.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/customArrow0.png", __ASSET__assets_images_useless_images_customarrow0_png);
		type.set ("assets/images/useless images/customArrow0.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/duplicators.png", __ASSET__assets_images_useless_images_duplicators_png);
		type.set ("assets/images/useless images/duplicators.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directional2.png", __ASSET__assets_images_useless_images_directional2_png);
		type.set ("assets/images/useless images/directional2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/waiter2.png", __ASSET__assets_images_useless_images_waiter2_png);
		type.set ("assets/images/useless images/waiter2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/customArrow4.png", __ASSET__assets_images_useless_images_customarrow4_png);
		type.set ("assets/images/useless images/customArrow4.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/Entypo_e4ad(0)_42.png", __ASSET__assets_images_useless_images_entypo_e4ad_0__42_png);
		type.set ("assets/images/useless images/Entypo_e4ad(0)_42.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionaly.png", __ASSET__assets_images_useless_images_directionaly_png);
		type.set ("assets/images/useless images/directionaly.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalUpd (2).png", __ASSET__assets_images_useless_images_directionalupd__2__png);
		type.set ("assets/images/useless images/directionalUpd (2).png", AssetType.IMAGE);
		className.set ("assets/images/useless images/inputd.png", __ASSET__assets_images_useless_images_inputd_png);
		type.set ("assets/images/useless images/inputd.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalUpi.png", __ASSET__assets_images_useless_images_directionalupi_png);
		type.set ("assets/images/useless images/directionalUpi.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/outputold.png", __ASSET__assets_images_useless_images_outputold_png);
		type.set ("assets/images/useless images/outputold.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/ifgreen.png", __ASSET__assets_images_useless_images_ifgreen_png);
		type.set ("assets/images/useless images/ifgreen.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/duplicator.png", __ASSET__assets_images_useless_images_duplicator_png);
		type.set ("assets/images/useless images/duplicator.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalLeft.png", __ASSET__assets_images_useless_images_directionalleft_png);
		type.set ("assets/images/useless images/directionalLeft.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/input.png", __ASSET__assets_images_useless_images_input_png);
		type.set ("assets/images/useless images/input.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/Balanced_scale_of_Justice.svg", __ASSET__assets_images_useless_images_balanced_scale_of_justice_svg);
		type.set ("assets/images/useless images/Balanced_scale_of_Justice.svg", AssetType.TEXT);
		className.set ("assets/images/useless images/signal2.png", __ASSET__assets_images_useless_images_signal2_png);
		type.set ("assets/images/useless images/signal2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalsUp.png", __ASSET__assets_images_useless_images_directionalsup_png);
		type.set ("assets/images/useless images/directionalsUp.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directional - Copy.png", __ASSET__assets_images_useless_images_directional___copy_png);
		type.set ("assets/images/useless images/directional - Copy.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/seq.png", __ASSET__assets_images_useless_images_seq_png);
		type.set ("assets/images/useless images/seq.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/PLUS.png", __ASSET__assets_images_useless_images_plus_png);
		type.set ("assets/images/useless images/PLUS.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/duplicatsor.png", __ASSET__assets_images_useless_images_duplicatsor_png);
		type.set ("assets/images/useless images/duplicatsor.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directional5.png", __ASSET__assets_images_useless_images_directional5_png);
		type.set ("assets/images/useless images/directional5.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/ifblue.png", __ASSET__assets_images_useless_images_ifblue_png);
		type.set ("assets/images/useless images/ifblue.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalDown.png", __ASSET__assets_images_useless_images_directionaldown_png);
		type.set ("assets/images/useless images/directionalDown.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directional4.png", __ASSET__assets_images_useless_images_directional4_png);
		type.set ("assets/images/useless images/directional4.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/ifred2.png", __ASSET__assets_images_useless_images_ifred2_png);
		type.set ("assets/images/useless images/ifred2.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/customArrow1.png", __ASSET__assets_images_useless_images_customarrow1_png);
		type.set ("assets/images/useless images/customArrow1.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/signal.png", __ASSET__assets_images_useless_images_signal_png);
		type.set ("assets/images/useless images/signal.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/customArrow3.png", __ASSET__assets_images_useless_images_customarrow3_png);
		type.set ("assets/images/useless images/customArrow3.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/transparent_spacer.gif", __ASSET__assets_images_useless_images_transparent_spacer_gif);
		type.set ("assets/images/useless images/transparent_spacer.gif", AssetType.IMAGE);
		className.set ("assets/images/useless images/addblack.png", __ASSET__assets_images_useless_images_addblack_png);
		type.set ("assets/images/useless images/addblack.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/Entypo_2b(1)_24.png", __ASSET__assets_images_useless_images_entypo_2b_1__24_png);
		type.set ("assets/images/useless images/Entypo_2b(1)_24.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/ifblack.png", __ASSET__assets_images_useless_images_ifblack_png);
		type.set ("assets/images/useless images/ifblack.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/duplicatosr.png", __ASSET__assets_images_useless_images_duplicatosr_png);
		type.set ("assets/images/useless images/duplicatosr.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/arrow.png", __ASSET__assets_images_useless_images_arrow_png);
		type.set ("assets/images/useless images/arrow.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/groupesr.png", __ASSET__assets_images_useless_images_groupesr_png);
		type.set ("assets/images/useless images/groupesr.png", AssetType.IMAGE);
		className.set ("assets/images/useless images/directionalRight.png", __ASSET__assets_images_useless_images_directionalright_png);
		type.set ("assets/images/useless images/directionalRight.png", AssetType.IMAGE);
		className.set ("assets/fonts/font.png", __ASSET__assets_fonts_font_png);
		type.set ("assets/fonts/font.png", AssetType.IMAGE);
		className.set ("assets/fonts/font.fnt", __ASSET__assets_fonts_font_fnt);
		type.set ("assets/fonts/font.fnt", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/bolt.png", __ASSET__assets_data_bolt_png);
		type.set ("assets/data/bolt.png", AssetType.IMAGE);
		className.set ("assets/data/queries.xml", __ASSET__assets_data_queries_xml);
		type.set ("assets/data/queries.xml", AssetType.TEXT);
		className.set ("assets/sounds/powerup.wav", __ASSET__assets_sounds_powerup_wav);
		type.set ("assets/sounds/powerup.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/images/blocks/grid/arrowSprite.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/directionalUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/blueBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/pinkBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/input.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/cyanBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/grid/greenBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/customizable/blueBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/customizable/pinkBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/customizable/cyanBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/customizable/arrow2X.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/customizable/greenBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/grouper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/directionalUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/duplicator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/waiter.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/ifred.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/iterator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/signal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blocks/icons/addblack.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelSelector/Levels.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelSelector/discreptionPanel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelSelector/levelIcon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq/sig.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq/bolt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq/seq.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GUI/panels/Container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GUI/buttons/plus.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GUI/buttons/minus.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GUI/buttons/question.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/customArrow2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/inputold.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalUps.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directional3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/sig.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/MINUS.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/Entypo_2d(0)_24.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/ifgreen2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalxUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/ifblue2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/iterator2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/useless images/directional.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalUpd.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionala.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/bolt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/seq2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/Entypo_2191(0)_36.bmp";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/useless images/color.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/outputs.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/Entypo_2191(0)_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/duplicato2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/discreptionPanel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/customArrow0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/duplicators.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directional2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/waiter2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/customArrow4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/Entypo_e4ad(0)_42.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionaly.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalUpd (2).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/inputd.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalUpi.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/outputold.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/ifgreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/duplicator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/input.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/Balanced_scale_of_Justice.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/useless images/signal2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalsUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directional - Copy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/seq.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/PLUS.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/duplicatsor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directional5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/ifblue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalDown.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directional4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/ifred2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/customArrow1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/signal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/customArrow3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/transparent_spacer.gif";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/addblack.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/Entypo_2b(1)_24.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/ifblack.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/duplicatosr.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/groupesr.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/useless images/directionalRight.png";
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
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/images/blocks/grid/arrowSprite.png", __ASSET__assets_images_blocks_grid_arrowsprite_png);
		type.set ("assets/images/blocks/grid/arrowSprite.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/directionalUp.png", __ASSET__assets_images_blocks_grid_directionalup_png);
		type.set ("assets/images/blocks/grid/directionalUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/output.png", __ASSET__assets_images_blocks_grid_output_png);
		type.set ("assets/images/blocks/grid/output.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/blueBlock.png", __ASSET__assets_images_blocks_grid_blueblock_png);
		type.set ("assets/images/blocks/grid/blueBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/pinkBlock.png", __ASSET__assets_images_blocks_grid_pinkblock_png);
		type.set ("assets/images/blocks/grid/pinkBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/input.png", __ASSET__assets_images_blocks_grid_input_png);
		type.set ("assets/images/blocks/grid/input.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/cyanBlock.png", __ASSET__assets_images_blocks_grid_cyanblock_png);
		type.set ("assets/images/blocks/grid/cyanBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/grid/greenBlock.png", __ASSET__assets_images_blocks_grid_greenblock_png);
		type.set ("assets/images/blocks/grid/greenBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/customizable/blueBlock.png", __ASSET__assets_images_blocks_customizable_blueblock_png);
		type.set ("assets/images/blocks/customizable/blueBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/customizable/pinkBlock.png", __ASSET__assets_images_blocks_customizable_pinkblock_png);
		type.set ("assets/images/blocks/customizable/pinkBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/customizable/cyanBlock.png", __ASSET__assets_images_blocks_customizable_cyanblock_png);
		type.set ("assets/images/blocks/customizable/cyanBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/customizable/arrow2X.png", __ASSET__assets_images_blocks_customizable_arrow2x_png);
		type.set ("assets/images/blocks/customizable/arrow2X.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/customizable/greenBlock.png", __ASSET__assets_images_blocks_customizable_greenblock_png);
		type.set ("assets/images/blocks/customizable/greenBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/grouper.png", __ASSET__assets_images_blocks_icons_grouper_png);
		type.set ("assets/images/blocks/icons/grouper.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/directionalUp.png", __ASSET__assets_images_blocks_icons_directionalup_png);
		type.set ("assets/images/blocks/icons/directionalUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/duplicator.png", __ASSET__assets_images_blocks_icons_duplicator_png);
		type.set ("assets/images/blocks/icons/duplicator.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/waiter.png", __ASSET__assets_images_blocks_icons_waiter_png);
		type.set ("assets/images/blocks/icons/waiter.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/ifred.png", __ASSET__assets_images_blocks_icons_ifred_png);
		type.set ("assets/images/blocks/icons/ifred.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/iterator.png", __ASSET__assets_images_blocks_icons_iterator_png);
		type.set ("assets/images/blocks/icons/iterator.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/signal.png", __ASSET__assets_images_blocks_icons_signal_png);
		type.set ("assets/images/blocks/icons/signal.png", AssetType.IMAGE);
		
		className.set ("assets/images/blocks/icons/addblack.png", __ASSET__assets_images_blocks_icons_addblack_png);
		type.set ("assets/images/blocks/icons/addblack.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelSelector/Levels.png", __ASSET__assets_images_levelselector_levels_png);
		type.set ("assets/images/levelSelector/Levels.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelSelector/discreptionPanel.png", __ASSET__assets_images_levelselector_discreptionpanel_png);
		type.set ("assets/images/levelSelector/discreptionPanel.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelSelector/levelIcon.png", __ASSET__assets_images_levelselector_levelicon_png);
		type.set ("assets/images/levelSelector/levelIcon.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq/sig.png", __ASSET__assets_images_seq_sig_png);
		type.set ("assets/images/seq/sig.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq/bolt.png", __ASSET__assets_images_seq_bolt_png);
		type.set ("assets/images/seq/bolt.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq/seq.png", __ASSET__assets_images_seq_seq_png);
		type.set ("assets/images/seq/seq.png", AssetType.IMAGE);
		
		className.set ("assets/images/GUI/panels/Container.png", __ASSET__assets_images_gui_panels_container_png);
		type.set ("assets/images/GUI/panels/Container.png", AssetType.IMAGE);
		
		className.set ("assets/images/GUI/buttons/plus.png", __ASSET__assets_images_gui_buttons_plus_png);
		type.set ("assets/images/GUI/buttons/plus.png", AssetType.IMAGE);
		
		className.set ("assets/images/GUI/buttons/minus.png", __ASSET__assets_images_gui_buttons_minus_png);
		type.set ("assets/images/GUI/buttons/minus.png", AssetType.IMAGE);
		
		className.set ("assets/images/GUI/buttons/question.png", __ASSET__assets_images_gui_buttons_question_png);
		type.set ("assets/images/GUI/buttons/question.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/customArrow2.png", __ASSET__assets_images_useless_images_customarrow2_png);
		type.set ("assets/images/useless images/customArrow2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/inputold.png", __ASSET__assets_images_useless_images_inputold_png);
		type.set ("assets/images/useless images/inputold.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalUps.png", __ASSET__assets_images_useless_images_directionalups_png);
		type.set ("assets/images/useless images/directionalUps.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directional3.png", __ASSET__assets_images_useless_images_directional3_png);
		type.set ("assets/images/useless images/directional3.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/sig.png", __ASSET__assets_images_useless_images_sig_png);
		type.set ("assets/images/useless images/sig.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/MINUS.png", __ASSET__assets_images_useless_images_minus_png);
		type.set ("assets/images/useless images/MINUS.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/Entypo_2d(0)_24.png", __ASSET__assets_images_useless_images_entypo_2d_0__24_png);
		type.set ("assets/images/useless images/Entypo_2d(0)_24.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/ifgreen2.png", __ASSET__assets_images_useless_images_ifgreen2_png);
		type.set ("assets/images/useless images/ifgreen2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalxUp.png", __ASSET__assets_images_useless_images_directionalxup_png);
		type.set ("assets/images/useless images/directionalxUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/ifblue2.png", __ASSET__assets_images_useless_images_ifblue2_png);
		type.set ("assets/images/useless images/ifblue2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/iterator2.png", __ASSET__assets_images_useless_images_iterator2_png);
		type.set ("assets/images/useless images/iterator2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/images-go-here.txt", __ASSET__assets_images_useless_images_images_go_here_txt);
		type.set ("assets/images/useless images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/useless images/directional.png", __ASSET__assets_images_useless_images_directional_png);
		type.set ("assets/images/useless images/directional.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalUpd.png", __ASSET__assets_images_useless_images_directionalupd_png);
		type.set ("assets/images/useless images/directionalUpd.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionala.png", __ASSET__assets_images_useless_images_directionala_png);
		type.set ("assets/images/useless images/directionala.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/bolt.png", __ASSET__assets_images_useless_images_bolt_png);
		type.set ("assets/images/useless images/bolt.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/seq2.png", __ASSET__assets_images_useless_images_seq2_png);
		type.set ("assets/images/useless images/seq2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/Entypo_2191(0)_36.bmp", __ASSET__assets_images_useless_images_entypo_2191_0__36_bmp);
		type.set ("assets/images/useless images/Entypo_2191(0)_36.bmp", AssetType.TEXT);
		
		className.set ("assets/images/useless images/color.png", __ASSET__assets_images_useless_images_color_png);
		type.set ("assets/images/useless images/color.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/outputs.png", __ASSET__assets_images_useless_images_outputs_png);
		type.set ("assets/images/useless images/outputs.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/Entypo_2191(0)_32.png", __ASSET__assets_images_useless_images_entypo_2191_0__32_png);
		type.set ("assets/images/useless images/Entypo_2191(0)_32.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/output.png", __ASSET__assets_images_useless_images_output_png);
		type.set ("assets/images/useless images/output.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/duplicato2.png", __ASSET__assets_images_useless_images_duplicato2_png);
		type.set ("assets/images/useless images/duplicato2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/discreptionPanel.png", __ASSET__assets_images_useless_images_discreptionpanel_png);
		type.set ("assets/images/useless images/discreptionPanel.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/customArrow0.png", __ASSET__assets_images_useless_images_customarrow0_png);
		type.set ("assets/images/useless images/customArrow0.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/duplicators.png", __ASSET__assets_images_useless_images_duplicators_png);
		type.set ("assets/images/useless images/duplicators.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directional2.png", __ASSET__assets_images_useless_images_directional2_png);
		type.set ("assets/images/useless images/directional2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/waiter2.png", __ASSET__assets_images_useless_images_waiter2_png);
		type.set ("assets/images/useless images/waiter2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/customArrow4.png", __ASSET__assets_images_useless_images_customarrow4_png);
		type.set ("assets/images/useless images/customArrow4.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/Entypo_e4ad(0)_42.png", __ASSET__assets_images_useless_images_entypo_e4ad_0__42_png);
		type.set ("assets/images/useless images/Entypo_e4ad(0)_42.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionaly.png", __ASSET__assets_images_useless_images_directionaly_png);
		type.set ("assets/images/useless images/directionaly.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalUpd (2).png", __ASSET__assets_images_useless_images_directionalupd__2__png);
		type.set ("assets/images/useless images/directionalUpd (2).png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/inputd.png", __ASSET__assets_images_useless_images_inputd_png);
		type.set ("assets/images/useless images/inputd.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalUpi.png", __ASSET__assets_images_useless_images_directionalupi_png);
		type.set ("assets/images/useless images/directionalUpi.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/outputold.png", __ASSET__assets_images_useless_images_outputold_png);
		type.set ("assets/images/useless images/outputold.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/ifgreen.png", __ASSET__assets_images_useless_images_ifgreen_png);
		type.set ("assets/images/useless images/ifgreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/duplicator.png", __ASSET__assets_images_useless_images_duplicator_png);
		type.set ("assets/images/useless images/duplicator.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalLeft.png", __ASSET__assets_images_useless_images_directionalleft_png);
		type.set ("assets/images/useless images/directionalLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/input.png", __ASSET__assets_images_useless_images_input_png);
		type.set ("assets/images/useless images/input.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/Balanced_scale_of_Justice.svg", __ASSET__assets_images_useless_images_balanced_scale_of_justice_svg);
		type.set ("assets/images/useless images/Balanced_scale_of_Justice.svg", AssetType.TEXT);
		
		className.set ("assets/images/useless images/signal2.png", __ASSET__assets_images_useless_images_signal2_png);
		type.set ("assets/images/useless images/signal2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalsUp.png", __ASSET__assets_images_useless_images_directionalsup_png);
		type.set ("assets/images/useless images/directionalsUp.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directional - Copy.png", __ASSET__assets_images_useless_images_directional___copy_png);
		type.set ("assets/images/useless images/directional - Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/seq.png", __ASSET__assets_images_useless_images_seq_png);
		type.set ("assets/images/useless images/seq.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/PLUS.png", __ASSET__assets_images_useless_images_plus_png);
		type.set ("assets/images/useless images/PLUS.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/duplicatsor.png", __ASSET__assets_images_useless_images_duplicatsor_png);
		type.set ("assets/images/useless images/duplicatsor.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directional5.png", __ASSET__assets_images_useless_images_directional5_png);
		type.set ("assets/images/useless images/directional5.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/ifblue.png", __ASSET__assets_images_useless_images_ifblue_png);
		type.set ("assets/images/useless images/ifblue.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalDown.png", __ASSET__assets_images_useless_images_directionaldown_png);
		type.set ("assets/images/useless images/directionalDown.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directional4.png", __ASSET__assets_images_useless_images_directional4_png);
		type.set ("assets/images/useless images/directional4.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/ifred2.png", __ASSET__assets_images_useless_images_ifred2_png);
		type.set ("assets/images/useless images/ifred2.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/customArrow1.png", __ASSET__assets_images_useless_images_customarrow1_png);
		type.set ("assets/images/useless images/customArrow1.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/signal.png", __ASSET__assets_images_useless_images_signal_png);
		type.set ("assets/images/useless images/signal.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/customArrow3.png", __ASSET__assets_images_useless_images_customarrow3_png);
		type.set ("assets/images/useless images/customArrow3.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/transparent_spacer.gif", __ASSET__assets_images_useless_images_transparent_spacer_gif);
		type.set ("assets/images/useless images/transparent_spacer.gif", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/addblack.png", __ASSET__assets_images_useless_images_addblack_png);
		type.set ("assets/images/useless images/addblack.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/Entypo_2b(1)_24.png", __ASSET__assets_images_useless_images_entypo_2b_1__24_png);
		type.set ("assets/images/useless images/Entypo_2b(1)_24.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/ifblack.png", __ASSET__assets_images_useless_images_ifblack_png);
		type.set ("assets/images/useless images/ifblack.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/duplicatosr.png", __ASSET__assets_images_useless_images_duplicatosr_png);
		type.set ("assets/images/useless images/duplicatosr.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/arrow.png", __ASSET__assets_images_useless_images_arrow_png);
		type.set ("assets/images/useless images/arrow.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/groupesr.png", __ASSET__assets_images_useless_images_groupesr_png);
		type.set ("assets/images/useless images/groupesr.png", AssetType.IMAGE);
		
		className.set ("assets/images/useless images/directionalRight.png", __ASSET__assets_images_useless_images_directionalright_png);
		type.set ("assets/images/useless images/directionalRight.png", AssetType.IMAGE);
		
		className.set ("assets/fonts/font.png", __ASSET__assets_fonts_font_png);
		type.set ("assets/fonts/font.png", AssetType.IMAGE);
		
		className.set ("assets/fonts/font.fnt", __ASSET__assets_fonts_font_fnt);
		type.set ("assets/fonts/font.fnt", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/bolt.png", __ASSET__assets_data_bolt_png);
		type.set ("assets/data/bolt.png", AssetType.IMAGE);
		
		className.set ("assets/data/queries.xml", __ASSET__assets_data_queries_xml);
		type.set ("assets/data/queries.xml", AssetType.TEXT);
		
		className.set ("assets/sounds/powerup.wav", __ASSET__assets_sounds_powerup_wav);
		type.set ("assets/sounds/powerup.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
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
		var data = Preloader.loaders.get (path.get (id)).data;
		
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
		var data = Preloader.loaders.get (path.get (id)).data;
		
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
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
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
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
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
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_arrowsprite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_directionalup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_blueblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_pinkblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_input_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_cyanblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_grid_greenblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_customizable_blueblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_customizable_pinkblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_customizable_cyanblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_customizable_arrow2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_customizable_greenblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_grouper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_directionalup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_duplicator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_waiter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_ifred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_iterator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_signal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blocks_icons_addblack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelselector_levels_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelselector_discreptionpanel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelselector_levelicon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq_sig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq_bolt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq_seq_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gui_panels_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gui_buttons_plus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gui_buttons_minus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gui_buttons_question_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_customarrow2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_inputold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalups_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directional3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_sig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_minus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_entypo_2d_0__24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_ifgreen2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalxup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_ifblue2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_iterator2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directional_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalupd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionala_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_bolt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_seq2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_entypo_2191_0__36_bmp extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_color_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_outputs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_entypo_2191_0__32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_duplicato2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_discreptionpanel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_customarrow0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_duplicators_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directional2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_waiter2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_customarrow4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_entypo_e4ad_0__42_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionaly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalupd__2__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_inputd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalupi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_outputold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_ifgreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_duplicator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_input_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_balanced_scale_of_justice_svg extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_signal2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalsup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directional___copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_seq_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_plus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_duplicatsor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directional5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_ifblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionaldown_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directional4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_ifred2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_customarrow1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_signal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_customarrow3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_transparent_spacer_gif extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_addblack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_entypo_2b_1__24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_ifblack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_duplicatosr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_groupesr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_useless_images_directionalright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_font_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_font_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_bolt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_queries_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_powerup_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }


#elseif html5








































































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux)


@:image("assets/images/blocks/grid/arrowSprite.png") #if display private #end class __ASSET__assets_images_blocks_grid_arrowsprite_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/directionalUp.png") #if display private #end class __ASSET__assets_images_blocks_grid_directionalup_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/output.png") #if display private #end class __ASSET__assets_images_blocks_grid_output_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/blueBlock.png") #if display private #end class __ASSET__assets_images_blocks_grid_blueblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/pinkBlock.png") #if display private #end class __ASSET__assets_images_blocks_grid_pinkblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/input.png") #if display private #end class __ASSET__assets_images_blocks_grid_input_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/cyanBlock.png") #if display private #end class __ASSET__assets_images_blocks_grid_cyanblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/grid/greenBlock.png") #if display private #end class __ASSET__assets_images_blocks_grid_greenblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/customizable/blueBlock.png") #if display private #end class __ASSET__assets_images_blocks_customizable_blueblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/customizable/pinkBlock.png") #if display private #end class __ASSET__assets_images_blocks_customizable_pinkblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/customizable/cyanBlock.png") #if display private #end class __ASSET__assets_images_blocks_customizable_cyanblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/customizable/arrow2X.png") #if display private #end class __ASSET__assets_images_blocks_customizable_arrow2x_png extends lime.graphics.Image {}
@:image("assets/images/blocks/customizable/greenBlock.png") #if display private #end class __ASSET__assets_images_blocks_customizable_greenblock_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/grouper.png") #if display private #end class __ASSET__assets_images_blocks_icons_grouper_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/directionalUp.png") #if display private #end class __ASSET__assets_images_blocks_icons_directionalup_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/duplicator.png") #if display private #end class __ASSET__assets_images_blocks_icons_duplicator_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/waiter.png") #if display private #end class __ASSET__assets_images_blocks_icons_waiter_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/ifred.png") #if display private #end class __ASSET__assets_images_blocks_icons_ifred_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/iterator.png") #if display private #end class __ASSET__assets_images_blocks_icons_iterator_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/signal.png") #if display private #end class __ASSET__assets_images_blocks_icons_signal_png extends lime.graphics.Image {}
@:image("assets/images/blocks/icons/addblack.png") #if display private #end class __ASSET__assets_images_blocks_icons_addblack_png extends lime.graphics.Image {}
@:image("assets/images/levelSelector/Levels.png") #if display private #end class __ASSET__assets_images_levelselector_levels_png extends lime.graphics.Image {}
@:image("assets/images/levelSelector/discreptionPanel.png") #if display private #end class __ASSET__assets_images_levelselector_discreptionpanel_png extends lime.graphics.Image {}
@:image("assets/images/levelSelector/levelIcon.png") #if display private #end class __ASSET__assets_images_levelselector_levelicon_png extends lime.graphics.Image {}
@:image("assets/images/seq/sig.png") #if display private #end class __ASSET__assets_images_seq_sig_png extends lime.graphics.Image {}
@:image("assets/images/seq/bolt.png") #if display private #end class __ASSET__assets_images_seq_bolt_png extends lime.graphics.Image {}
@:image("assets/images/seq/seq.png") #if display private #end class __ASSET__assets_images_seq_seq_png extends lime.graphics.Image {}
@:image("assets/images/GUI/panels/Container.png") #if display private #end class __ASSET__assets_images_gui_panels_container_png extends lime.graphics.Image {}
@:image("assets/images/GUI/buttons/plus.png") #if display private #end class __ASSET__assets_images_gui_buttons_plus_png extends lime.graphics.Image {}
@:image("assets/images/GUI/buttons/minus.png") #if display private #end class __ASSET__assets_images_gui_buttons_minus_png extends lime.graphics.Image {}
@:image("assets/images/GUI/buttons/question.png") #if display private #end class __ASSET__assets_images_gui_buttons_question_png extends lime.graphics.Image {}
@:image("assets/images/useless images/customArrow2.png") #if display private #end class __ASSET__assets_images_useless_images_customarrow2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/inputold.png") #if display private #end class __ASSET__assets_images_useless_images_inputold_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalUps.png") #if display private #end class __ASSET__assets_images_useless_images_directionalups_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directional3.png") #if display private #end class __ASSET__assets_images_useless_images_directional3_png extends lime.graphics.Image {}
@:image("assets/images/useless images/sig.png") #if display private #end class __ASSET__assets_images_useless_images_sig_png extends lime.graphics.Image {}
@:image("assets/images/useless images/MINUS.png") #if display private #end class __ASSET__assets_images_useless_images_minus_png extends lime.graphics.Image {}
@:image("assets/images/useless images/Entypo_2d(0)_24.png") #if display private #end class __ASSET__assets_images_useless_images_entypo_2d_0__24_png extends lime.graphics.Image {}
@:image("assets/images/useless images/ifgreen2.png") #if display private #end class __ASSET__assets_images_useless_images_ifgreen2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalxUp.png") #if display private #end class __ASSET__assets_images_useless_images_directionalxup_png extends lime.graphics.Image {}
@:image("assets/images/useless images/ifblue2.png") #if display private #end class __ASSET__assets_images_useless_images_ifblue2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/iterator2.png") #if display private #end class __ASSET__assets_images_useless_images_iterator2_png extends lime.graphics.Image {}
@:file("assets/images/useless images/images-go-here.txt") #if display private #end class __ASSET__assets_images_useless_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/useless images/directional.png") #if display private #end class __ASSET__assets_images_useless_images_directional_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalUpd.png") #if display private #end class __ASSET__assets_images_useless_images_directionalupd_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionala.png") #if display private #end class __ASSET__assets_images_useless_images_directionala_png extends lime.graphics.Image {}
@:image("assets/images/useless images/bolt.png") #if display private #end class __ASSET__assets_images_useless_images_bolt_png extends lime.graphics.Image {}
@:image("assets/images/useless images/seq2.png") #if display private #end class __ASSET__assets_images_useless_images_seq2_png extends lime.graphics.Image {}
@:file("assets/images/useless images/Entypo_2191(0)_36.bmp") #if display private #end class __ASSET__assets_images_useless_images_entypo_2191_0__36_bmp extends lime.utils.ByteArray {}
@:image("assets/images/useless images/color.png") #if display private #end class __ASSET__assets_images_useless_images_color_png extends lime.graphics.Image {}
@:image("assets/images/useless images/outputs.png") #if display private #end class __ASSET__assets_images_useless_images_outputs_png extends lime.graphics.Image {}
@:image("assets/images/useless images/Entypo_2191(0)_32.png") #if display private #end class __ASSET__assets_images_useless_images_entypo_2191_0__32_png extends lime.graphics.Image {}
@:image("assets/images/useless images/output.png") #if display private #end class __ASSET__assets_images_useless_images_output_png extends lime.graphics.Image {}
@:image("assets/images/useless images/duplicato2.png") #if display private #end class __ASSET__assets_images_useless_images_duplicato2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/discreptionPanel.png") #if display private #end class __ASSET__assets_images_useless_images_discreptionpanel_png extends lime.graphics.Image {}
@:image("assets/images/useless images/customArrow0.png") #if display private #end class __ASSET__assets_images_useless_images_customarrow0_png extends lime.graphics.Image {}
@:image("assets/images/useless images/duplicators.png") #if display private #end class __ASSET__assets_images_useless_images_duplicators_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directional2.png") #if display private #end class __ASSET__assets_images_useless_images_directional2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/waiter2.png") #if display private #end class __ASSET__assets_images_useless_images_waiter2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/customArrow4.png") #if display private #end class __ASSET__assets_images_useless_images_customarrow4_png extends lime.graphics.Image {}
@:image("assets/images/useless images/Entypo_e4ad(0)_42.png") #if display private #end class __ASSET__assets_images_useless_images_entypo_e4ad_0__42_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionaly.png") #if display private #end class __ASSET__assets_images_useless_images_directionaly_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalUpd (2).png") #if display private #end class __ASSET__assets_images_useless_images_directionalupd__2__png extends lime.graphics.Image {}
@:image("assets/images/useless images/inputd.png") #if display private #end class __ASSET__assets_images_useless_images_inputd_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalUpi.png") #if display private #end class __ASSET__assets_images_useless_images_directionalupi_png extends lime.graphics.Image {}
@:image("assets/images/useless images/outputold.png") #if display private #end class __ASSET__assets_images_useless_images_outputold_png extends lime.graphics.Image {}
@:image("assets/images/useless images/ifgreen.png") #if display private #end class __ASSET__assets_images_useless_images_ifgreen_png extends lime.graphics.Image {}
@:image("assets/images/useless images/duplicator.png") #if display private #end class __ASSET__assets_images_useless_images_duplicator_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalLeft.png") #if display private #end class __ASSET__assets_images_useless_images_directionalleft_png extends lime.graphics.Image {}
@:image("assets/images/useless images/input.png") #if display private #end class __ASSET__assets_images_useless_images_input_png extends lime.graphics.Image {}
@:file("assets/images/useless images/Balanced_scale_of_Justice.svg") #if display private #end class __ASSET__assets_images_useless_images_balanced_scale_of_justice_svg extends lime.utils.ByteArray {}
@:image("assets/images/useless images/signal2.png") #if display private #end class __ASSET__assets_images_useless_images_signal2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalsUp.png") #if display private #end class __ASSET__assets_images_useless_images_directionalsup_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directional - Copy.png") #if display private #end class __ASSET__assets_images_useless_images_directional___copy_png extends lime.graphics.Image {}
@:image("assets/images/useless images/seq.png") #if display private #end class __ASSET__assets_images_useless_images_seq_png extends lime.graphics.Image {}
@:image("assets/images/useless images/PLUS.png") #if display private #end class __ASSET__assets_images_useless_images_plus_png extends lime.graphics.Image {}
@:image("assets/images/useless images/duplicatsor.png") #if display private #end class __ASSET__assets_images_useless_images_duplicatsor_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directional5.png") #if display private #end class __ASSET__assets_images_useless_images_directional5_png extends lime.graphics.Image {}
@:image("assets/images/useless images/ifblue.png") #if display private #end class __ASSET__assets_images_useless_images_ifblue_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalDown.png") #if display private #end class __ASSET__assets_images_useless_images_directionaldown_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directional4.png") #if display private #end class __ASSET__assets_images_useless_images_directional4_png extends lime.graphics.Image {}
@:image("assets/images/useless images/ifred2.png") #if display private #end class __ASSET__assets_images_useless_images_ifred2_png extends lime.graphics.Image {}
@:image("assets/images/useless images/customArrow1.png") #if display private #end class __ASSET__assets_images_useless_images_customarrow1_png extends lime.graphics.Image {}
@:image("assets/images/useless images/signal.png") #if display private #end class __ASSET__assets_images_useless_images_signal_png extends lime.graphics.Image {}
@:image("assets/images/useless images/customArrow3.png") #if display private #end class __ASSET__assets_images_useless_images_customarrow3_png extends lime.graphics.Image {}
@:image("assets/images/useless images/transparent_spacer.gif") #if display private #end class __ASSET__assets_images_useless_images_transparent_spacer_gif extends lime.graphics.Image {}
@:image("assets/images/useless images/addblack.png") #if display private #end class __ASSET__assets_images_useless_images_addblack_png extends lime.graphics.Image {}
@:image("assets/images/useless images/Entypo_2b(1)_24.png") #if display private #end class __ASSET__assets_images_useless_images_entypo_2b_1__24_png extends lime.graphics.Image {}
@:image("assets/images/useless images/ifblack.png") #if display private #end class __ASSET__assets_images_useless_images_ifblack_png extends lime.graphics.Image {}
@:image("assets/images/useless images/duplicatosr.png") #if display private #end class __ASSET__assets_images_useless_images_duplicatosr_png extends lime.graphics.Image {}
@:image("assets/images/useless images/arrow.png") #if display private #end class __ASSET__assets_images_useless_images_arrow_png extends lime.graphics.Image {}
@:image("assets/images/useless images/groupesr.png") #if display private #end class __ASSET__assets_images_useless_images_groupesr_png extends lime.graphics.Image {}
@:image("assets/images/useless images/directionalRight.png") #if display private #end class __ASSET__assets_images_useless_images_directionalright_png extends lime.graphics.Image {}
@:image("assets/fonts/font.png") #if display private #end class __ASSET__assets_fonts_font_png extends lime.graphics.Image {}
@:file("assets/fonts/font.fnt") #if display private #end class __ASSET__assets_fonts_font_fnt extends lime.utils.ByteArray {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:image("assets/data/bolt.png") #if display private #end class __ASSET__assets_data_bolt_png extends lime.graphics.Image {}
@:file("assets/data/queries.xml") #if display private #end class __ASSET__assets_data_queries_xml extends lime.utils.ByteArray {}
@:file("assets/sounds/powerup.wav") #if display private #end class __ASSET__assets_sounds_powerup_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("/usr/lib/haxe/lib/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("/usr/lib/haxe/lib/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:font("/usr/lib/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("/usr/lib/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/nokiafc22.ttf"; name = "Nokia Cellphone FC Small"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/arial.ttf"; name = "Arial"; super (); }}

#end

#end
#end

