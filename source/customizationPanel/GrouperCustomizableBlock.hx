package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;
import blocks.*;

/**
 * the customizable version of a directional block
 */
class GrouperCustomizableBlock extends CustomizableBlock
{
	public function new(x:Float , y:Float, block:Block)
	{
		super(x,y);//will probably add customization later
		loadGraphic("assets/images/greenBlock.png");
		this.block = block;
	}
	override public function addArrows()
	{
		super.addArrows();
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
}