package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;
import util.*;
import blocks.*;

/**
 * The arrow class .. represents the customizable arrows that appears on the customizable block  
 */
class Arrow extends FlxSprite
{
	/**
	 * internal, reference to the parent block
	 */
	private var block:CustomizableBlock;
	/**
	 * internal , controls whether the arrow can move with mouse or not
	 */
	private var draggable:Bool;
	/**
	 * the direction of the arrow
	 */
	private var direction:Direction;
	/**
	 * the color of the arrow
	 */
	public var rgbColor:Color;

	/**
	 * @param	block	reference to the parent block.
	 * @param	rgbColor	the color of the arrow.
	 * @param	direction	the direction of the arrow.
	 */
	public function new(block:CustomizableBlock,rgbColor:Color,direction:Direction,?enabled:Bool = true)
	{
		super(block.x + block.width/2 - 8 ,block.y + block.height/2 - 24);
		loadGraphic("assets/images/arrow.png", false, 0,0,true);
		this.block = block;
		this.origin.set(width/2,height);
		setColor(rgbColor);
		this.draggable = false;
		MouseEventManager.add(this, onDown, null, null, null);
		if(enabled)
			setDirection(direction);
		else
			kill();
	}
	override public function update():Void
	{
		super.update();

		if(draggable)
		{
			followMouse();
			if(!FlxG.mouse.pressed)
			{
				draggable = false;
				roundToNearestDirection();
			}
		}
	}
	/**
	 * sets a new direction for the arrow .. and makes sure there is no overlapping between arrows
	 */
	public function setDirection(direction:Direction)
	{
		var oldDirection:Direction = this.direction;
		this.direction = direction;
		this.angle = Util.directionToAngle[direction];
		for (i in 0 ... block.arrows.length) {
			if(block.arrows[i] != this && block.arrows[i].direction == direction)
			{
				if(block.arrows[i].alive)
					block.arrows[i].setDirection(oldDirection);
			}
		}
	}
	/**
	 * getter for the direction 
	 */
	public function getDirection():Direction
	{
		for (key in Util.directionToAngle.keys()) {
		    if(Util.directionToAngle[key] == ((angle+360)%360))
		    {
		    	return key;
		    }
		}
		return null;//may introduce bugs later
	}
	/**
	 * setter for the color for the arrow
	 */
	public function setColor(rgbColor:Color)
	{
		this.rgbColor = rgbColor;
		this.color = Util.colorToValue[rgbColor];
	}
	private function onDown(Sprite:FlxSprite)
	{
		if(GlobalVars.arrowDraggingEnabled)
			draggable = true;
	}
	private function followMouse()
	{
		angle = FlxAngle.getAngle(new FlxPoint(block.x + block.width/2 ,block.y + block.height/2),new FlxPoint(FlxG.mouse.x,FlxG.mouse.y));
	}
	private function roundToNearestDirection()
	{
		angle =  Math.round((angle+360)/90)*90;
		setDirection(getDirection());
		block.updateGridBlock();//update the sprite of the grid block
		if(getDirection() == util.Direction.down)
			GlobalVars.level.checkForTutorial("arrow_down");
	}
}