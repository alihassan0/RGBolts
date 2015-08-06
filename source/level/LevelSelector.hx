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
		add(new FlxSprite(150,0,"assets/images/Levels.png"));
		bgColor = 0xffafe4e5;
		GlobalVars.loadLevels();
		for (i in 0...GlobalVars.levels.length)
		{
			new LevelIcon(150+70 + (i%5)*110,0+140 +Math.floor(i/5)*100, i+1,textDiscription);
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