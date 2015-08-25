package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;
import util.*;

/**
 * toggle buttons that can add or remove arrows
 */
class ToggleColorButton extends FlxSprite
{
	/**
	 * internal , describes whether the button is curruntly enabled or disabled
	 */
	private var enabled:Bool;
	/**
	 * internal, reference to the block it affects
	 */
	private var block:CustomizableBlock;
	/**
	 * the color of the arrow that this button can add or remove
	 */
	private var rgbColor:Color;

	/**
	 * @param	X				The initial X position of the button.
	 * @param	Y				The initial Y position of the button.
	 * @param 	rgbColor		the initial color of the button
	 * @param 	block			reference to the customizable block it affects
	 */
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
	private function toggleEnabled()
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
	private function onDown(Sprite:FlxSprite)
	{
		toggleEnabled();
	}
	private function disableArrow()
	{
		for (i in 0 ... block.arrows.length) {
			if(block.arrows[i].rgbColor == this.rgbColor)
			{
				//block.arrows[i].kill();
				block.arrows[i].alpha = .3;
			}
		}
	}
	private function enableArrow():Bool
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