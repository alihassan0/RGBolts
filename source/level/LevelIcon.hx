package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.text.FlxBitmapTextField;

class LevelIcon extends FlxSprite
{
	private var levelNumbertxt:FlxBitmapTextField;
	private var discriptionText:FlxBitmapTextField;
	private var id:Int;
	public function new(X:Float=0, Y:Float=0, i:Int,discriptionText:FlxBitmapTextField) 
	{
		super(X, Y,"assets/images/levelIcon.png");
		id = i;
		FlxG.state.add(this);
		
		levelNumbertxt = new FlxBitmapTextField(GlobalVars.font);
		levelNumbertxt.x = X+25;
		levelNumbertxt.y = Y+15;
		levelNumbertxt.useTextColor = false;
		levelNumbertxt.text = i+"";
		levelNumbertxt.fontScale = .7;
		levelNumbertxt.color = 0xffffffff;
		FlxG.state.add(levelNumbertxt);
		//FlxText(X, Y, 30, i + "");
		/*if((i + "").length == 1)
		levelNumbertxt.setFormat(null, 22, 0x9C9F84, "center");
		else
		levelNumbertxt.setFormat(null, 18, 0x9C9F84, "center");*/
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