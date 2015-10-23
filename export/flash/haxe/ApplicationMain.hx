#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/images/blocks/grid/arrowSprite.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/directionalUp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/output.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/blueBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/pinkBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/input.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/cyanBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/grid/greenBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/customizable/blueBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/customizable/pinkBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/customizable/cyanBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/customizable/arrow2X.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/customizable/greenBlock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/grouper.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/directionalUp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/duplicator.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/waiter.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/ifred.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/iterator.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/signal.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/blocks/icons/addblack.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/levelSelector/Levels.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/levelSelector/discreptionPanel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/levelSelector/levelIcon.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/seq/sig.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/seq/bolt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/seq/seq.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GUI/panels/Container.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GUI/buttons/plus.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GUI/buttons/minus.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GUI/buttons/question.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/customArrow2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/inputold.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalUps.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directional3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/sig.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/MINUS.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/Entypo_2d(0)_24.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/ifgreen2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalxUp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/ifblue2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/iterator2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/useless images/directional.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalUpd.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionala.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/bolt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/seq2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/Entypo_2191(0)_36.bmp");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/useless images/color.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/outputs.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/Entypo_2191(0)_32.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/output.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/duplicato2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/discreptionPanel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/customArrow0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/duplicators.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directional2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/waiter2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/customArrow4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/Entypo_e4ad(0)_42.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionaly.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalUpd (2).png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/inputd.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalUpi.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/outputold.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/ifgreen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/duplicator.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalLeft.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/input.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/Balanced_scale_of_Justice.svg");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/useless images/signal2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalsUp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directional - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/seq.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/PLUS.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/duplicatsor.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directional5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/ifblue.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalDown.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directional4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/ifred2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/customArrow1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/signal.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/customArrow3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/transparent_spacer.gif");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/addblack.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/Entypo_2b(1)_24.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/ifblack.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/duplicatosr.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/arrow.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/groupesr.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/useless images/directionalRight.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/fonts/font.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/fonts/font.fnt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/bolt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/queries.xml");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/powerup.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			company: "HaxeFlixel",
			depthBuffer: false,
			file: "sequenceCSGame",
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (480),
			orientation: "portrait",
			packageName: "com.example.myapp",
			resizable: true,
			stencilBuffer: true,
			title: "sequenceCSGame",
			version: "0.0.1",
			vsync: true,
			width: Std.int (640),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 640, 480, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
