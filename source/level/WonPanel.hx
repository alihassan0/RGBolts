package level;

import flixel.group.FlxTypedGroup;
import flixel.group.FlxTypedSpriteGroup;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
class WonPanel extends FlxTypedSpriteGroup<FlxSprite>
{
	public var bg:FlxSprite;
	public var blocksCountTxt:FlxText;
	public var cyclesCountTxt:FlxText;
	public var nextLevelBtn:FlxButton;

	public function new() 
	{
		super();
		add(bg = new FlxSprite(0,0).makeGraphic(400,150,0xff000000));
		add(new flixel.text.FlxText(30,bg.y + 10,bg.width - 60, "congratulation").setFormat(null, 16 , 0xffffff,"center"));
		add(blocksCountTxt = new flixel.text.FlxText(30,40,bg.width - 60, "").setFormat(null, 12 , 0xffffff,"left"));
		add(cyclesCountTxt = new flixel.text.FlxText(30,60,bg.width - 60, "").setFormat(null, 12 , 0xffffff,"left"));
		add(nextLevelBtn = new FlxButton(120, 120, "next level", GlobalVars.level.nextLevelF));

		y = 500;
		x = 120;
	}
	public function show()
	{
		blocksCountTxt.text = "num of Blocks : " + GlobalVars.gameGrid.getBlocksCount();
		cyclesCountTxt.text = "num of cycles : " + getCycles() + "    avg : " + getCyclesAverage();
		FlxTween.tween(this, {y:200}, .66, {ease:FlxEase.circOut});
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