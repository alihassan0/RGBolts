package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class LevelIcon extends FlxSprite
{
	private var levelNumbertxt:FlxText;
	private var discriptionText:FlxText;
	private var id:Int;
	public function new(X:Float=0, Y:Float=0, i:Int,discriptionText:FlxText) 
	{
		super(X, Y);
		id = i;
		makeGraphic(30, 30, 0xFFA97D5D);
		FlxG.state.add(this);
		
		levelNumbertxt = new FlxText(X, Y, 30, i + "");
		if((i + "").length == 1)
		levelNumbertxt.setFormat(null, 22, 0x9C9F84, "center");
		else
		levelNumbertxt.setFormat(null, 18, 0x9C9F84, "center");
		FlxG.state.add(levelNumbertxt);
		this.discriptionText = discriptionText;
		MouseEventManager.add(this, onDown, null, onOver,true);
	}
	function onDown(Sprite:FlxSprite) 
	{
		GlobalVars.levelInfo = GlobalVars.levels[id-1];
		FlxG.switchState(new Level());
	}
	function onOver(Sprite:FlxSprite) 
	{
		discriptionText.text = GlobalVars.levels[id-1].description;
	}
}