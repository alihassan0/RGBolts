package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;
import blocks.*;

/**
 * the customizable version of a directional block
 */
class SignalCustomizableBlock extends CustomizableBlock
{
	public function new(x:Float , y:Float, block:Block)
	{
		super(x,y);
		loadGraphic("assets/images/greenBlock.png");
		this.block = block;
		arrows[0].setDirection(cast(block,SignalBlock).direction);
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.black,Direction.down);
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
}