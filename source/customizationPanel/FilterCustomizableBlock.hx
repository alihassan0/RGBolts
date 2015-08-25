package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;

/**
 * the customizable version of a filter block
 */
class FilterCustomizableBlock extends CustomizableBlock
{
	public function new(X:Float , Y:Float)
	{
		super(X,Y);
		loadGraphic("assets/images/cyanBlock.png");
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.red,Direction.down);
		addArrow(Color.green,Direction.right);
	}
}