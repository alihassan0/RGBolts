package;
import flixel.FlxState;
import openfl.Assets;
import openfl.display.Loader;
import openfl.Lib;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class Intro extends FlxState
{

	public function new() 
	{
		super();
		Lib.current.addChild(new Video());
	}
}