package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import util.*;
/**
 * ...
 * @author ...
 */
class ArrowSprite extends FlxSprite
{
	public var direction:Direction;
	public function new(x:Int , y:Int, direction:Direction, color:Color)
	{
		super(x, y, "assets/images/arrowSprite.png");
		setDirection(direction);
		this.color = Util.colorToValue[color];
		GlobalVars.level.blocksGroup.add(this);
	}
	public function setDirection(direction:Direction)
	{
		this.direction = direction;
		this.angle = Util.directionToAngle[direction];
	}
}