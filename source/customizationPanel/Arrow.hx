package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;
import util.*;
/**
 * ...
 * @author ali hassan
 */
class Arrow extends FlxSprite
{
	private var block:CustomizableBlock;
	private var draggable:Bool;
	private var direction:Direction;
	public function new(block:CustomizableBlock,color:Int,direction:Direction)
	{
		super(block.x + block.width/2 - 8 ,block.y + block.height/2 - 24);
		loadGraphic("assets/images/arrow.png", false, 0,0,true);
		this.color = color;
		this.block = block;
		this.origin.set(width/2,height);
		this.draggable = false;
		setDirection(direction);
		MouseEventManager.add(this, onDown, null, null, null);

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
	public function onDown(Sprite:FlxSprite)
	{
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
	}
	private function setDirection(direction:Direction)
	{
		var oldDirection:Direction = this.direction;
		this.direction = direction;
		this.angle = Util.directionToAngle[direction];
		for (i in 0 ... block.arrows.length) {
			if(block.arrows[i] != this && block.arrows[i].direction == direction)
			{
				block.arrows[i].setDirection(oldDirection);
			}
		}
	}
	private function getDirection():Direction
	{
		for (key in Util.directionToAngle.keys()) {
		    if(Util.directionToAngle[key] == ((angle+360)%360))
		    {
		    	return key;
		    }
		}
		return null;//may introduce bugs later
	}
}