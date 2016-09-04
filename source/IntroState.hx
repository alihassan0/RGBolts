package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.math.FlxPoint;
import customizationPanel.*;
import util.*;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class IntroState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	var logo:FlxSprite;

	override public function create():Void
	{
		super.create();
		bgColor = Reg.logoBackground;
		FlxG.camera.antialiasing = true;

		logo = new FlxSprite(FlxG.width/2 - 125, FlxG.height/2 - 218.5, "assets/images/logo/logo.png");
		logo.scale.set(.5, .5);
		logo.alpha = 0;
		add(logo);

		var options:TweenOptions = { type: FlxTween.ONESHOT, ease: FlxEase.quadOut , onComplete	:switchToGame};
		FlxTween.tween(logo.scale, { x: 1, y:1 }, 2, options);
		FlxTween.tween(logo, { alpha: 1 }, 2, options);
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

	public function switchToGame(tween:FlxTween):Void
	{
		Reg.switchState(new MenuState());
	}	

}