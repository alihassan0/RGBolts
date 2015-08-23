package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;

/**
 * ...
 * @author ...
 */
class CustomizableBlock extends FlxSprite
{
	public var arrows:Array<Arrow>;
	public function new(X:Float , Y:Float)
	{
		super(X, Y, "assets/images/greenBlock.png");
		FlxG.state.add(this);
		addArrows();
	}
	public function addArrows()
	{
		arrows = new Array<Arrow>();
		addArrow(FlxColor.RED,Direction.down);
		addArrow(FlxColor.GREEN,Direction.right);
	}
	public function addArrow(color:Int,direction:Direction)
	{
		var arrow:Arrow = new Arrow(this, color , direction);
		FlxG.state.add(arrow);
		arrows.push(arrow);
	}
}