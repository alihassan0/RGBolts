package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import util.*;
import blocks.*;

/**
 * the customizable version of a filter block
 */
class FilterCustomizableBlock extends CustomizableBlock
{
	public function new(X:Float , Y:Float, block:Block)
	{
		super(X,Y);
		loadGraphic("assets/images/pinkBlock.png");
		this.block = block;
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrow(Color.grey,Direction.up);
		addArrow(Color.red,Direction.right);
	}
	override public function addToggleButtons()
	{
		super.addToggleButtons();
		FlxG.state.add(new ToggleColorButton(440,160,Color.red,this));
		FlxG.state.add(new ToggleColorButton(465,160,Color.blue,this));
		FlxG.state.add(new ToggleColorButton(490,160,Color.green,this));
		FlxG.state.add(new ToggleColorButton(515,160,Color.black,this));
		FlxG.state.add(new ToggleColorButton(540,160,Color.grey,this));
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
}