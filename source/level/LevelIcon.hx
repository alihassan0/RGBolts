package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.text.FlxBitmapText;

class LevelIcon extends FlxSprite
{
	private var levelNumbertxt:FlxBitmapText;
	private var discriptionText:FlxBitmapText;
	private var id:Int;
	public function new(X:Float=0, Y:Float=0, i:Int,discriptionText:FlxBitmapText) 
	{
		super(X, Y,"assets/images/levelSelector/levelIcon.png");
		id = i;
		FlxG.state.add(this);
		
		levelNumbertxt = new FlxBitmapText(GlobalVars.font);
		levelNumbertxt.x = X+25;
		levelNumbertxt.y = Y+15;
		levelNumbertxt.useTextColor = false;
		levelNumbertxt.text = i+"";
		levelNumbertxt.scale.set(.7,.7);
		levelNumbertxt.color = 0xffffffff;
		FlxG.state.add(levelNumbertxt);
		//FlxText(X, Y, 30, i + "");
		/*if((i + "").length == 1)
		levelNumbertxt.setFormat(null, 22, 0x9C9F84, "center");
		else
		levelNumbertxt.setFormat(null, 18, 0x9C9F84, "center");*/
		this.discriptionText = discriptionText;
		FlxMouseEventManager.add(this, onDown, null, onOver,true);
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