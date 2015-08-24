package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;

/**
 * the customizable version of a directional block
 */
class DirectionalCustomizableBlock extends CustomizableBlock
{
	public function new(X:Float , Y:Float)
	{
		super(X,Y);
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.black,Direction.down);
	}
}