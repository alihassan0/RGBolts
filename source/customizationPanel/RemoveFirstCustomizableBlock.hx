package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;
import blocks.*;

/**
 * the customizable version of a RemoveFirst block
 */
class RemoveFirstCustomizableBlock extends CustomizableBlock
{
	public function new(x:Float , y:Float, block:Block)
	{
		super(x,y);
		loadGraphic("assets/images/blocks/customizable/cyanBlock.png");
		this.block = block;
		arrows[0].setDirection(cast(block,RemoveFirstBlock).otherElementsArrow.direction);
		arrows[1].setDirection(cast(block,RemoveFirstBlock).firstElementArrow.direction);
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.black,Direction.up);
		addArrow(Color.grey,Direction.right);
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
}