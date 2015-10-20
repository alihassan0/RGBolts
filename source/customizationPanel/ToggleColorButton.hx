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
	public function new(X:Float , Y:Float, rgbColor:Color , block:CustomizableBlock,?enabled = false)
	{
		super(X,Y);
		makeGraphic(20,20);
		this.block = block;
		setColor(rgbColor);
		this.setEnabled(enabled);
		MouseEventManager.add(this, onDown, null, null, null);
	}
	public function setColor(rgbColor:Color)
	{
		this.rgbColor = rgbColor;
		this.color = Util.colorToValue[rgbColor];
	}

	private function setEnabled(enabled:Bool)
	{
		this.enabled = enabled;
		if(enabled)
		{
			if(enableArrow())
			{
				alpha = 1;
				scale.set(1,1.1);
			}
				
			else
				enabled = false;
		}
		else
		{
			disableArrow();//there is no checking here .. because there is no way you are unable to disable an arrow
			alpha = .6;
			scale.set(1,.9);
		}
	}
	private function toggleEnabled()
	{
		setEnabled(!enabled);
		block.updateGridBlock();
	}
	private function onDown(Sprite:FlxSprite)
	{
		if(!GlobalVars.level.isRunning)
			toggleEnabled();
	}
	private function disableArrow()
	{
		for (i in 0 ... block.arrows.length) {
			if(block.arrows[i].rgbColor == this.rgbColor)
			{
				block.arrows[i].kill();
			}
		}
	}
	private function enableArrow():Bool
	{
		var newDirection = getEmptyDirection();
		if(newDirection == null)
		{
			return false;
		}
		else
		{
			for (i in 0 ... block.arrows.length) 
			{
				if(block.arrows[i].rgbColor == this.rgbColor)
				{
					block.arrows[i].revive();
					var overlaps:Bool = false;
					for (j in 0 ... block.arrows.length) 
						if(i != j && block.arrows[j].alive && block.arrows[j].getDirection() == block.arrows[i].getDirection())
							overlaps = true;
					if(overlaps)
						block.arrows[i].setDirection(newDirection);
					return true;
				}
			}
			trace("the new direction is" + newDirection);
			block.addArrow(rgbColor,newDirection);
			return true;
		}
	}
	private function getEmptyDirection():Direction
	{
		var possibleDirections:Array<Direction> = [Direction.up,Direction.right,Direction.down,Direction.left];
		for (i in 0 ... block.arrows.length)
			if(block.arrows[i].alive)
				possibleDirections.remove(block.arrows[i].getDirection());
		if(possibleDirections.length == 0)
			return null;
		return possibleDirections[0];
	}
}