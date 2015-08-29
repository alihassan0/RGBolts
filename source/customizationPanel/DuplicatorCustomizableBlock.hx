package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;
import blocks.*;

/**
 * the customizable version of a directional block
 */
class DuplicatorCustomizableBlock extends CustomizableBlock
{
	public function new(x:Float , y:Float, block:Block)
	{
		super(x,y);
		loadGraphic("assets/images/blueBlock.png");
		this.block = block;
		arrows[0].setDirection(cast(block,DuplicatorBlock).firstDuplicate.direction);
		arrows[1].setDirection(cast(block,DuplicatorBlock).secondDuplicate.direction);
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.yellow,Direction.up);
		addArrow(Color.yellow,Direction.down);
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
}