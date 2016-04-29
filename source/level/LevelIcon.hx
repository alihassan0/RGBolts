package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;

import util.BitmapText;

class LevelIcon extends FlxSprite
{
	private var levelNumbertxt:BitmapText;
	private var discriptionText:BitmapText;
	private var id:Int;
	public function new(x:Float=0, y:Float=0, i:Int,discriptionText:BitmapText) 
	{
		super(x, y,"assets/images/levelSelector/levelIcon.png");
		id = i;
		FlxG.state.add(this);
		
		levelNumbertxt = new BitmapText(GlobalVars.font,.75);
		levelNumbertxt.setPosition(x+25,y+15);
		levelNumbertxt.changeText(i+"");
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
		discriptionText.changeText(GlobalVars.levels[id-1].description);
	}
}