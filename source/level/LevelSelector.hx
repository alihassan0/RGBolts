package level;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;

using flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author ...
 */
class LevelSelector extends FlxState
{
	public var textDiscription:FlxText;
	override public function create():Void 
	{
		addDiscription();
		bgColor = FlxColor.WHEAT;
		GlovalVars.loadLevels();
		for (i in 0...GlovalVars.levels.length)
		{
			new LevelIcon(50 + i*40, 50, i+1,textDiscription);
		}
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(0,420).makeGraphic(640,50,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		var offset:Int = 8;
		discription.drawRoundRect(offset, offset, discription.width -2*offset, discription.height - 2*offset, 15, 15, FlxColor.WHEAT);
		add(discription);
		
		textDiscription = new FlxText(discription.x + offset , discription.y + offset, discription.width - 2*offset, "", 12);
		textDiscription.color = 0xAA5C755E;
		add(textDiscription);
	}
	
}