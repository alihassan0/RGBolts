package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import util.AnimatedButton;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	var title:FlxText;
	var playBtn:FlxButton;
	var titleUpdateCounter:Int = 0;
	var runBtn:AnimatedButton;
	var timer: FlxTimer;
	override public function create():Void
	{
		super.create();
		bgColor = Reg.logoBackground;

		title = new FlxText(0, -100, FlxG.width, "RGBolts",32, true);
		title.setFormat(Reg.titleFont, 80, null, "center");
		updateTitleFormat(title);
		add(title);
		
		timer = new FlxTimer();
		timer.start(.5+Math.random()*1,updateTimer, 2);

		var options:TweenOptions = { type: FlxTween.ONESHOT, ease: FlxEase.bounceOut};
		FlxTween.tween(title, {y:100 }, 2, options);

		runBtn = new AnimatedButton(Math.floor(320 - 175/2), Math.floor(360 - 185/2), "run.png", Reg.switchState.bind(new level.LevelSelector()));
		add(runBtn);
		runBtn.scale.set(1, 1);
		runBtn.updateHitbox();
		runBtn.alpha = 0;

		FlxTween.tween(runBtn, {alpha:1}, 2, options);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}	

	public function updateTimer(?timer:FlxTimer):Void
	{
		updateTitleFormat(title);
		timer.start(.3+Math.random()*.2,updateTimer, 1);
	}
	public function updateTitleFormat(title:FlxText):Void
	{
		var redFont = new FlxTextFormat(FlxColor.RED, false, false, null);
		var greenFont = new FlxTextFormat(FlxColor.GREEN, false, false, null);
		var blueFont = new FlxTextFormat(FlxColor.BLUE, false, false, null);
		
		title.addFormat(redFont, 0, 1);
		title.addFormat(greenFont, 1, 2);
		title.addFormat(blueFont, 2, 3);

		titleUpdateCounter ++;

		for (i in 3 ... title.text.length) {
			switch ((i+ titleUpdateCounter)%3) {
				case 0: title.addFormat(redFont, i, i+1);			
				case 1: title.addFormat(greenFont, i, i+1);			
				case 2: title.addFormat(blueFont, i, i+1);			
			}
		}
		add(title);

	}	
}