package customizationPanel;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.plugin.MouseEventManager;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import blocks.*;
using flixel.util.FlxSpriteUtil;

/**
 * The panel that holds all customization stuff 
 */
class CustomizationPanel extends FlxTypedGroup<FlxSprite>
{
	public var background:FlxSprite;
	public var customizableBlock:CustomizableBlock;
	public function new()
	{
		super();
		add(background = new FlxSprite(430, 50).loadGraphic("assets/images/Container.png", false));
		GlobalVars.level.gui.panelsGroup.add(this);
		GlobalVars.customizationPanel = this;
	}
	/**
	 * a function that is called whenever you click on a new grid block
	 * it loads a new customization block and deletes the old one . 
	 */ 
	public function customize(block:Block)
	{
		if(customizableBlock != null)
		{
			customizableBlock.kill();
			customizableBlock.destroy();
		}
		customizableBlock = block.addCustomizableBlock(500,100,block);
	}
	override public function update():Void 
	{
		super.update();	
	}
	
}	