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
 * ...
 * @author Ahmed El Sayegh
 */
class CustomizationPanel extends FlxTypedGroup<FlxSprite>
{
	public var block:Block;
	private var background:FlxSprite;
	private var customizableBlock:CustomizableBlock;

	public function new()
	{
		super();
		add(background = new FlxSprite(430, 50).loadGraphic("assets/images/Container.png", false));
		FlxG.state.add(this);
	}	
	public function customize(block:Block)
	{
		this.block = block;
		if(customizableBlock != null)
		{
			customizableBlock.kill();
			customizableBlock.destroy();
			trace("killedAnfDestroyed");
		}
		customizableBlock = block.addCustomizableBlock(500,100,block);
	}
	override public function update():Void 
	{
		super.update();	
	}
	
}	