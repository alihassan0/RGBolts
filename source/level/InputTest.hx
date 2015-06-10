package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;


using flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author ...
 */
class InputTest extends FlxSprite
{
	private var levelNumbertxt:FlxText;
	private var id:Int;
	private var text:FlxText;
	private var selected:Bool;
	public function new(X:Float=0, Y:Float=0 , inputString:String , outputString:String) 
	{
		super(X, Y);
		makeGraphic(100,80,0x00000000,true);
		drawRoundRect(0, 0, 100, 80, 15, 15, FlxColor.WHEAT);
		FlxG.state.add(this);
		text = new FlxText(x , y ,width, "")
							.setFormat(null, 10 , 0x9C9F84,"center");
		text.text = "i : "+inputString+" \n\n o : "+outputString+" \n\n s : 'untested' \n\n";
		FlxG.state.add(text);
		
		MouseEventManager.add(this, onDown, null, null, null,true);
	}
	function onDown(Sprite:FlxSprite) 
	{
		selected = !selected;
		showSelection();
	}
	function showSelection() 
	{
		var lineStyle;
		if(selected)
		{
			lineStyle = { color: FlxColor.YELLOW, thickness: 4.0 };
			alpha =.6;
		}
		else
		{
			lineStyle = { color: FlxColor.WHEAT, thickness:  4.0 };
			alpha = 1;
		}

		drawRoundRect(0, 0, 100, 80, 15, 15, FlxColor.TRANSPARENT,lineStyle);
		
	}
}