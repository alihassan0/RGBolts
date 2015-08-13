package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.system.ThreadPool;
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
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var threadPool:ThreadPool;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/images/directional3.png", __ASSET__assets_images_directional3_png);
		type.set ("assets/images/directional3.png", AssetType.IMAGE);
		className.set ("assets/images/sig.png", __ASSET__assets_images_sig_png);
		type.set ("assets/images/sig.png", AssetType.IMAGE);
		className.set ("assets/images/grouper.png", __ASSET__assets_images_grouper_png);
		type.set ("assets/images/grouper.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/directional.png", __ASSET__assets_images_directional_png);
		type.set ("assets/images/directional.png", AssetType.IMAGE);
		className.set ("assets/images/bolt.png", __ASSET__assets_images_bolt_png);
		type.set ("assets/images/bolt.png", AssetType.IMAGE);
		className.set ("assets/images/seq2.png", __ASSET__assets_images_seq2_png);
		type.set ("assets/images/seq2.png", AssetType.IMAGE);
		className.set ("assets/images/color.png", __ASSET__assets_images_color_png);
		type.set ("assets/images/color.png", AssetType.IMAGE);
		className.set ("assets/images/output.png", __ASSET__assets_images_output_png);
		type.set ("assets/images/output.png", AssetType.IMAGE);
		className.set ("assets/images/directional2.png", __ASSET__assets_images_directional2_png);
		type.set ("assets/images/directional2.png", AssetType.IMAGE);
		className.set ("assets/images/question.png", __ASSET__assets_images_question_png);
		type.set ("assets/images/question.png", AssetType.IMAGE);
		className.set ("assets/images/ifgreen.png", __ASSET__assets_images_ifgreen_png);
		type.set ("assets/images/ifgreen.png", AssetType.IMAGE);
		className.set ("assets/images/duplicator.png", __ASSET__assets_images_duplicator_png);
		type.set ("assets/images/duplicator.png", AssetType.IMAGE);
		className.set ("assets/images/input.png", __ASSET__assets_images_input_png);
		type.set ("assets/images/input.png", AssetType.IMAGE);
		className.set ("assets/images/seq.png", __ASSET__assets_images_seq_png);
		type.set ("assets/images/seq.png", AssetType.IMAGE);
		className.set ("assets/images/waiter.png", __ASSET__assets_images_waiter_png);
		type.set ("assets/images/waiter.png", AssetType.IMAGE);
		className.set ("assets/images/ifred.png", __ASSET__assets_images_ifred_png);
		type.set ("assets/images/ifred.png", AssetType.IMAGE);
		className.set ("assets/images/directional5.png", __ASSET__assets_images_directional5_png);
		type.set ("assets/images/directional5.png", AssetType.IMAGE);
		className.set ("assets/images/ifblue.png", __ASSET__assets_images_ifblue_png);
		type.set ("assets/images/ifblue.png", AssetType.IMAGE);
		className.set ("assets/images/directional4.png", __ASSET__assets_images_directional4_png);
		type.set ("assets/images/directional4.png", AssetType.IMAGE);
		className.set ("assets/images/iterator.png", __ASSET__assets_images_iterator_png);
		type.set ("assets/images/iterator.png", AssetType.IMAGE);
		className.set ("assets/images/signal.png", __ASSET__assets_images_signal_png);
		type.set ("assets/images/signal.png", AssetType.IMAGE);
		className.set ("assets/data/queries2.xml", __ASSET__assets_data_queries2_xml);
		type.set ("assets/data/queries2.xml", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/queries.xml", __ASSET__assets_data_queries_xml);
		type.set ("assets/data/queries.xml", AssetType.TEXT);
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
		id = "assets/images/directional3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sig.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/grouper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/directional.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bolt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/color.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/question.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifgreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duplicator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/input.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/seq.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/waiter.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifred.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ifblue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/directional4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/iterator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/signal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/queries2.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/queries.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<<<<<<< HEAD
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
=======
>>>>>>> tutSystem
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/images/directional3.png", __ASSET__assets_images_directional3_png);
		type.set ("assets/images/directional3.png", AssetType.IMAGE);
		
		className.set ("assets/images/sig.png", __ASSET__assets_images_sig_png);
		type.set ("assets/images/sig.png", AssetType.IMAGE);
		
		className.set ("assets/images/grouper.png", __ASSET__assets_images_grouper_png);
		type.set ("assets/images/grouper.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/directional.png", __ASSET__assets_images_directional_png);
		type.set ("assets/images/directional.png", AssetType.IMAGE);
		
		className.set ("assets/images/bolt.png", __ASSET__assets_images_bolt_png);
		type.set ("assets/images/bolt.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq2.png", __ASSET__assets_images_seq2_png);
		type.set ("assets/images/seq2.png", AssetType.IMAGE);
		
		className.set ("assets/images/color.png", __ASSET__assets_images_color_png);
		type.set ("assets/images/color.png", AssetType.IMAGE);
		
		className.set ("assets/images/output.png", __ASSET__assets_images_output_png);
		type.set ("assets/images/output.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional2.png", __ASSET__assets_images_directional2_png);
		type.set ("assets/images/directional2.png", AssetType.IMAGE);
		
		className.set ("assets/images/question.png", __ASSET__assets_images_question_png);
		type.set ("assets/images/question.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifgreen.png", __ASSET__assets_images_ifgreen_png);
		type.set ("assets/images/ifgreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/duplicator.png", __ASSET__assets_images_duplicator_png);
		type.set ("assets/images/duplicator.png", AssetType.IMAGE);
		
		className.set ("assets/images/input.png", __ASSET__assets_images_input_png);
		type.set ("assets/images/input.png", AssetType.IMAGE);
		
		className.set ("assets/images/seq.png", __ASSET__assets_images_seq_png);
		type.set ("assets/images/seq.png", AssetType.IMAGE);
		
		className.set ("assets/images/waiter.png", __ASSET__assets_images_waiter_png);
		type.set ("assets/images/waiter.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifred.png", __ASSET__assets_images_ifred_png);
		type.set ("assets/images/ifred.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional5.png", __ASSET__assets_images_directional5_png);
		type.set ("assets/images/directional5.png", AssetType.IMAGE);
		
		className.set ("assets/images/ifblue.png", __ASSET__assets_images_ifblue_png);
		type.set ("assets/images/ifblue.png", AssetType.IMAGE);
		
		className.set ("assets/images/directional4.png", __ASSET__assets_images_directional4_png);
		type.set ("assets/images/directional4.png", AssetType.IMAGE);
		
		className.set ("assets/images/iterator.png", __ASSET__assets_images_iterator_png);
		type.set ("assets/images/iterator.png", AssetType.IMAGE);
		
		className.set ("assets/images/signal.png", __ASSET__assets_images_signal_png);
		type.set ("assets/images/signal.png", AssetType.IMAGE);
		
		className.set ("assets/data/queries2.xml", __ASSET__assets_data_queries2_xml);
		type.set ("assets/data/queries2.xml", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/queries.xml", __ASSET__assets_data_queries_xml);
		type.set ("assets/data/queries.xml", AssetType.TEXT);
		
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
	
	
	private function createThreadPool ():Void {
		
		threadPool = new ThreadPool (0, 2);
		threadPool.doWork.add (function (id, data) {
			
			data.result = data.getMethod (id);
			threadPool.sendComplete (data.handler, data);
			
		});
		threadPool.onComplete.add (function (id, data) {
			
			data.handler (data.result);
			
		});
		
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
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			createThreadPool ();
			
		}
		
		threadPool.queue (id, { handler: handler, getMethod: getBytes });
		
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
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				handler (Image.fromImageElement (image));
				
			}
			image.src = path.get (id);
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			createThreadPool ();
			
		}
		
		threadPool.queue (id, { handler: handler, getMethod: getImage });
		
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
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
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


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_images_directional3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_grouper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bolt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_color_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_question_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifgreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duplicator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_input_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_seq_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_waiter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ifblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_directional4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_iterator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_signal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_queries2_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_queries_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }


#elseif html5


























<<<<<<< HEAD




@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


=======
>>>>>>> tutSystem
#else



#if (windows || mac || linux)


@:image("assets/images/directional3.png") #if display private #end class __ASSET__assets_images_directional3_png extends lime.graphics.Image {}
@:image("assets/images/sig.png") #if display private #end class __ASSET__assets_images_sig_png extends lime.graphics.Image {}
@:image("assets/images/grouper.png") #if display private #end class __ASSET__assets_images_grouper_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/directional.png") #if display private #end class __ASSET__assets_images_directional_png extends lime.graphics.Image {}
@:image("assets/images/bolt.png") #if display private #end class __ASSET__assets_images_bolt_png extends lime.graphics.Image {}
@:image("assets/images/seq2.png") #if display private #end class __ASSET__assets_images_seq2_png extends lime.graphics.Image {}
@:image("assets/images/color.png") #if display private #end class __ASSET__assets_images_color_png extends lime.graphics.Image {}
@:image("assets/images/output.png") #if display private #end class __ASSET__assets_images_output_png extends lime.graphics.Image {}
@:image("assets/images/directional2.png") #if display private #end class __ASSET__assets_images_directional2_png extends lime.graphics.Image {}
@:image("assets/images/question.png") #if display private #end class __ASSET__assets_images_question_png extends lime.graphics.Image {}
@:image("assets/images/ifgreen.png") #if display private #end class __ASSET__assets_images_ifgreen_png extends lime.graphics.Image {}
@:image("assets/images/duplicator.png") #if display private #end class __ASSET__assets_images_duplicator_png extends lime.graphics.Image {}
@:image("assets/images/input.png") #if display private #end class __ASSET__assets_images_input_png extends lime.graphics.Image {}
@:image("assets/images/seq.png") #if display private #end class __ASSET__assets_images_seq_png extends lime.graphics.Image {}
@:image("assets/images/waiter.png") #if display private #end class __ASSET__assets_images_waiter_png extends lime.graphics.Image {}
@:image("assets/images/ifred.png") #if display private #end class __ASSET__assets_images_ifred_png extends lime.graphics.Image {}
@:image("assets/images/directional5.png") #if display private #end class __ASSET__assets_images_directional5_png extends lime.graphics.Image {}
@:image("assets/images/ifblue.png") #if display private #end class __ASSET__assets_images_ifblue_png extends lime.graphics.Image {}
@:image("assets/images/directional4.png") #if display private #end class __ASSET__assets_images_directional4_png extends lime.graphics.Image {}
@:image("assets/images/iterator.png") #if display private #end class __ASSET__assets_images_iterator_png extends lime.graphics.Image {}
@:image("assets/images/signal.png") #if display private #end class __ASSET__assets_images_signal_png extends lime.graphics.Image {}
@:file("assets/data/queries2.xml") #if display private #end class __ASSET__assets_data_queries2_xml extends lime.utils.ByteArray {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/data/queries.xml") #if display private #end class __ASSET__assets_data_queries_xml extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("/home/alihassan/Desktop/my folders/flixel/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("/home/alihassan/Desktop/my folders/flixel/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:font("/home/alihassan/Desktop/my folders/flixel/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("/home/alihassan/Desktop/my folders/flixel/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end
#end

