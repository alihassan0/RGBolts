package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;
import blocks.*;

/**
 * the customizable version of a filter block
 */
class FilterCustomizableBlock extends CustomizableBlock
{
	public function new(X:Float , Y:Float, block:Block)
	{
		super(X,Y);
		loadGraphic("assets/images/cyanBlock.png");
		this.block = block;
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.red,Direction.down);
		addArrow(Color.green,Direction.right);
	}

}