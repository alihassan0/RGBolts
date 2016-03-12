package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import customizationPanel.*;
import util.*;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	var block:CustomizableBlock;
	var arrow:Arrow;
	override public function create():Void
	{
		super.create();
		bgColor = FlxColor.GRAY;
		block = new DirectionalCustomizableBlock(40,240);
		block = new FilterCustomizableBlock(120,240);
		add(new ToggleColorButton(120,280,Color.green,block));
		add(new ToggleColorButton(150,280,Color.red,block));
		add(new ToggleColorButton(180,280,Color.blue,block));
		add(new ToggleColorButton(180,280,Color.black,block));
		add(new ToggleColorButton(180,280,Color.blue,block));
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
}