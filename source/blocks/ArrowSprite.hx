package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import util.*;
import customizationPanel.*;
/**
 * ...
 * @author ...
 */
class ArrowSprite extends FlxSprite
{
	public var direction:Direction;
	private var enabled:Bool;
	public var rgbColor:Color;
	public function new(block:Block, direction:Direction, rgbColor:Color, ?enabled:Bool = true)
	{
		super(block.x , block.y, "assets/images/arrowSprite.png");
		setDirection(direction);
		setEnabled(enabled);
		this.rgbColor = rgbColor;
		this.color = Util.colorToValue[rgbColor];
		GlobalVars.level.gui.blocksGroup.add(this);
		block.arrowSprites.push(this);
	}
	public function setDirection(direction:Direction)
	{
		this.direction = direction;
		this.angle = Util.directionToAngle[direction];
	}
	public function loadDataFromArrow(arrow:Arrow)
	{
		if(arrow.alive)
		{
			revive();
			this.setDirection(arrow.getDirection());
		}
		else
		{
			kill();	
		}
	}
	public function setEnabled(enabled:Bool)
	{
		this.enabled = enabled;
		if(enabled)
		{
			revive();
		}
		else
		{
			kill();
		}
	}

}