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
		for (i in 0 ... filterBlock.arrowSprites.length) 
		{
			addArrowFromArrowSprite(filterBlock.arrowSprites[i]);
		}
	}
	public function addToggleButton(t:ToggleColorButton)
	{
		GlobalVars.level.gui.panelsGroup.add(t);
		toggleColorButtons.push(t);
	}
	
	override public function addToggleButtons()
	{
		super.addToggleButtons();
		for (i in 0 ... filterBlock.arrowSprites.length) 
		{
			var arrow:ArrowSprite = filterBlock.arrowSprites[i];
			addToggleButton(new ToggleColorButton(440+i*25,160,arrow.rgbColor,this,arrow.alive));		
		}
	}
	override public function updateGridBlock()
	{
		block.loadCustomBehaviour(this);
	}
	
}