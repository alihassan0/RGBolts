package;
import flixel.FlxState;
import openfl.Assets;
import openfl.display.Loader;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class Video extends Sprite
{

	public function new() 
	{
		super();
		
		Assets.loadLibrary ("splash", function (_) {

		trace ("SWF library loaded");
		var clip = Assets.getMovieClip ("splash:MySymbolClass");
		addChild(clip);
		});
		
	}
	
}