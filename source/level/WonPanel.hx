package level;

import flixel.group.FlxTypedGroup;
import flixel.group.FlxTypedSpriteGroup;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

using GUI.ButtonExtender;
class WonPanel extends FlxTypedSpriteGroup<FlxSprite>
{
	public var bg:FlxSprite;
	public var blocksCountTxt:FlxText;
	public var cyclesCountTxt:FlxText;
	public var nextLevelBtn:FlxButton;
	public var closeBtn:FlxButton;
	public var expandBtn:FlxButton;
	public function new() 
	{
		super();
		add(bg = new FlxSprite(0,0).makeGraphic(400,150,0xff000000));
		add(new flixel.text.FlxText(30,bg.y + 10,bg.width - 60, "congratulation").setFormat(null, 16 , 0xffffff,"center"));
		add(blocksCountTxt = new flixel.text.FlxText(30,40,bg.width - 60, "").setFormat(null, 12 , 0xffffff,"left"));
		add(cyclesCountTxt = new flixel.text.FlxText(30,60,bg.width - 60, "").setFormat(null, 12 , 0xffffff,"left"));
		add(nextLevelBtn = new FlxButton(120, 110, "next level", GlobalVars.level.nextLevelF));
		add(closeBtn = new FlxButton(370, 10, "x", close));
		expandBtn = new FlxButton(150, 130, "vvvv", expand);
		//add(scalebtn);
		closeBtn.scalebtn(0.2, 1);
		expandBtn.scalebtn(0.4, 1);
		y = 500;
		x = 120;
	}
	public function show()
	{ 
		blocksCountTxt.text = "num of Blocks : " + GlobalVars.gameGrid.getBlocksCount();
		cyclesCountTxt.text = "num of cycles : " + getCycles() + "    avg : " + getCyclesAverage();
		FlxTween.tween(this, {y:200}, .66, {ease:FlxEase.quadInOut});
	}
	public function expand()
	{
		FlxTween.tween(bg.scale, {y:1.5}, .66, {ease:FlxEase.quadInOut});
		FlxTween.tween(bg, {y:137.5}, .66, {ease:FlxEase.quadInOut});
		FlxTween.tween(this, {y:100}, .66, {ease:FlxEase.quadInOut});
	}
	public function close()
	{
		FlxTween.tween(this, {y:500}, .66, {ease:FlxEase.quadInOut});
	}
	public function getCycles()
	{
		var res:Array<Int> = new Array<Int>();
		for (i in 0 ... GlobalVars.level.gui.inputTests.length) 
			res.push(GlobalVars.level.gui.inputTests[i].cycles);
		return res;
	}
	
	public function getCyclesAverage()
	{
		var res:Float = 0;
		for (i in 0 ... GlobalVars.level.gui.inputTests.length) 
			res += GlobalVars.level.gui.inputTests[i].cycles;
		return res/5;
	}
}