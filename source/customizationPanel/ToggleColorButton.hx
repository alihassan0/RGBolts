package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;
import util.*;

/**
 * ...
 * @author ...
 */
class ToggleColorButton extends FlxSprite
{
	private var enabled:Bool;
	private var block:CustomizableBlock;
	private var rgbColor:Color;
	public function new(X:Float , Y:Float, rgbColor:Color , block:CustomizableBlock)
	{
		super(X,Y);
		makeGraphic(20,20);
		this.block = block;
		setColor(rgbColor);
		enabled = true;
		toggleEnabled();
		MouseEventManager.add(this, onDown, null, null, null);
	}
	public function setColor(rgbColor:Color)
	{
		this.rgbColor = rgbColor;
		this.color = Util.colorToValue[rgbColor];
		trace(this.color);
	}
	public function toggleEnabled()
	{
		if(enabled)
		{
			enabled = false;
			alpha = .4;
			disableArrow();
		}
		else
		{
			enabled = true;
			alpha = 1;
			enableArrow();
		}
	}
	public function onDown(Sprite:FlxSprite)
	{
		toggleEnabled();
	}
	public function disableArrow()
	{
		for (i in 0 ... block.arrows.length) {
			if(block.arrows[i].rgbColor == this.rgbColor)
			{
				//block.arrows[i].kill();
				block.arrows[i].alpha = .3;
			}
		}
	}public function enableArrow():Bool
	{
		for (i in 0 ... block.arrows.length) {
			if(block.arrows[i].rgbColor == this.rgbColor)
			{
				//block.arrows[i].revive();
				block.arrows[i].alpha = .7;
				return true;
			}
		}
		var possibleDirections:Array<Direction> = [Direction.up,Direction.right,Direction.down,Direction.left];
		for (i in 0 ... block.arrows.length) {
			possibleDirections.remove(block.arrows[i].getDirection());
		}
		if(possibleDirections.length == 0)
			return false;

		block.addArrow(rgbColor,possibleDirections[0]);
		return true;
	}
}