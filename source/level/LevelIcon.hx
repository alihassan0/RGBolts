package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.text.FlxBitmapTextField;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;
class LevelIcon extends FlxSprite
{
	private var levelNumbertxt:FlxBitmapTextField;
	private var discriptionText:FlxBitmapTextField;
	private var id:Int;
	private var originalY:Float;
	private var originalHeight:Float;
	public var out:Bool = true;
	public var stay:Bool = false;
	public function new(X:Float=0, Y:Float=0, i:Int,discriptionText:FlxBitmapTextField) 
	{
		super(X, Y);
		id = i;

		makeGraphic(100, 75, FlxColor.GRAY);
		FlxG.state.add(this);
		
		levelNumbertxt = new FlxBitmapTextField(GlobalVars.font);
		levelNumbertxt.x = X+25;
		levelNumbertxt.y = Y+15;
		levelNumbertxt.useTextColor = false;
		levelNumbertxt.text = i+"";
		levelNumbertxt.fontScale = .7;
		levelNumbertxt.color = 0xffffffff;
		
		//FlxText(X, Y, 30, i + "");
		/*if((i + "").length == 1)
		levelNumbertxt.setFormat(null, 22, 0x9C9F84, "center");
		else
		levelNumbertxt.setFormat(null, 18, 0x9C9F84, "center");*/
		this.discriptionText = discriptionText;
		MouseEventManager.add(this, onDown, null, onOver, null, true);
		originalY = this.y;
		originalHeight = this.height;
		//b = new FlxSprite(x, y).makeGraphic(100, 80, );
		//this.makeGraphic(Math.floor(width), Math.floor(height), FlxColor.TRANSPARENT);// .drawRoundRect(this.x, this.y, Math.floor(width), Math.floor(height) + 25, 12, 12, FlxColor.RED);
		//		FlxG.state.add(levelNumbertxt);

	//	MouseEventManager.add(b, null, null, changeStay, changeStay, true);
		

	}
	
	
	public function decideDuration(boolean:Bool):Float
	{
		if (boolean) 
			return 0.01;
		return 0.5;
	}
	public function focus(initialise:Bool)
	{
		var duration = decideDuration(initialise);
		FlxTween.num(100, 400, duration,  unfocusChange);
		FlxTween.tween(this, { x:270, y:125}, duration);
	}
	public function unfocusLeft(initialise:Bool)
	{
		var duration = decideDuration(initialise);
		FlxTween.tween(this, { x:10, y:125}, duration);
		FlxTween.num(400, 100, duration, unfocusChange);
		//shift left
	}
	
	public function unfocusRight(initialise:Bool)
	{
		var duration = decideDuration(initialise);
		FlxTween.tween(this, { x:670-140, y:125}, duration);
		FlxTween.num(400, 100, duration, unfocusChange);
		//shift right
	}	
	/*function changeStay(_)
	{
		stay = !stay;
		onOut(this);
	}*/
	function done(_) {
		out = true;
	}
	function onDown(Sprite:FlxSprite) 
	{
		if (LevelSelector.selectedLevel!= (id - 1))
			return;
		GlobalVars.levelInfo = GlobalVars.levels[id-1];
		FlxG.switchState(new Level());
	}
	function onOver(Sprite:FlxSprite) 
	{
		/*if (!out)
		return;
		for (icon in LevelSelector.icons)
		{
			if (icon == this)
				continue;
			icon.change(0);
		}*/
		//FlxTween.num(0, 80, .2, { ease:FlxEase.circInOut, complete:done}, change);
	}
	
	/*public function onOut(s:FlxSprite) 
	{
		if (!stay && out) {
		out = false;	
		FlxTween.num(80, 0, .3, { ease:FlxEase.circInOut, complete:done }, change);
		
		}
	}*/

	public function moveY(x:Float):Void
	{
		this.y = x;	
	}
	public function moveX(x:Float):Void
	{
		this.x = x;	
	}
	public function change(x:Float):Void
	{
		this.setGraphicSize(Math.floor(x), Math.floor(x - 100));
	}
	
	public function unfocusChangeY(y:Float):Void
	{
		this.setGraphicSize(Math.floor(x), Math.floor(x));
		
	}
	
	public function unfocusChange(x:Float):Void
	{
		this.setGraphicSize(Math.floor(x), Math.floor(x*.75));
		
	}
}