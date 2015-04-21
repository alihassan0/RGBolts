package level;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class LevelSelector extends FlxState
{

	override public function create():Void 
	{
		bgColor = FlxColor.WHEAT;
		GlovalVars.loadLevels();
		for (i in 0...GlovalVars.levels.length)
		{
			new LevelIcon(50 + i*40, 50, i+1);
		}	
	}
	
}