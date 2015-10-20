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
	private var filterBlock:FilterBlock;
	public function new(X:Float , Y:Float, block:Block)
	{
		this.filterBlock = cast(block,FilterBlock);//i know it's better to cast in the add arrows function 
														//.. but for some reason i couldn't cast outside constructor
		super(X,Y);
		loadGraphic("assets/images/blocks/customizable/pinkBlock.png");
		this.block = block;
	}
	override public function addArrows()
	{
		super.addArrows();
		addArrowFromArrowSprite(filterBlock.greyArrow);
		addArrowFromArrowSprite(filterBlock.redArrow);
		addArrowFromArrowSprite(filterBlock.greenArrow);
		addArrowFromArrowSprite(filterBlock.blueArrow);
		addArrowFromArrowSprite(filterBlock.blackArrow);
	}
	public function addToggleButton(t:ToggleColorButton)
	{
		GlobalVars.level.gui.panelsGroup.add(t);
		toggleColorButtons.push(t);
	}
	override public function addToggleButtons()
	{
		super.addToggleButtons();
		addToggleButton(new ToggleColorButton(440,160,Color.red,this,filterBlock.redArrow.alive));
		addToggleButton(new ToggleColorButton(465,160,Color.grey,this,filterBlock.greyArrow.alive));
		addToggleButton(new ToggleColorButton(490,160,Color.green,this,filterBlock.greenArrow.alive));
		addToggleButton(new ToggleColorButton(515,160,Color.blue,this,filterBlock.blueArrow.alive));
		addToggleButton(new ToggleColorButton(540,160,Color.black,this,filterBlock.blackArrow.alive));
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
	
}