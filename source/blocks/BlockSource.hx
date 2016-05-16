package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import util.*;
/**
 * ...
 * @author ...
 */
class BlockSource extends FlxSprite
{
	private var blockType:Int;
	public function new(X:Int,Y:Int,blockType:Int) 
	{
		super(X, Y);
		this.blockType = blockType;
		loadSprite();
		FlxMouseEventManager.add(this, onDown, null, null, null,true);
	}
	private function loadSprite()
	{
		//this need some refactoring
		switch(blockType)
		{
			case 0: loadGraphic("assets/images/blocks/icons/directionalUp.png");
			case 1: loadGraphic("assets/images/blocks/icons/iterator.png");
			case 3: loadGraphic("assets/images/blocks/icons/grouper.png");
			case 21,22,23: loadGraphic("assets/images/blocks/icons/ifred.png");
			case 4: loadGraphic("assets/images/blocks/icons/waiter.png");
			case 5: loadGraphic("assets/images/blocks/icons/duplicator.png");
			case 6: loadGraphic("assets/images/blocks/icons/signal.png");
			case 7: loadGraphic("assets/images/blocks/icons/addblack.png");
		}
	}
	private function onDown(Sprite:FlxSprite)
	{
		trace(blockType);
		if(!GlobalVars.level.isRunning && GlobalVars.blocksCreatingEnabled && !(TutVars.exists && GlobalVars.gameGrid.getBlocksCount()>=3))
		{
			var block:Block;
			switch(blockType)
			{
				//i really REALLY should come up with a better solution later
				case 0: block = new DirectionalBlock(0,0);
				case 1: block = new RemoveFirstBlock(0,0);
				case 21: block = new FilterBlock(0, 0)
				.setAvailableColors([Color.grey, Color.red]);
				case 22: block = new FilterBlock(0, 0)
				.setAvailableColors([Color.grey, Color.red, Color.green, Color.blue]);
				case 23: block = new FilterBlock(0, 0)
				.setAvailableColors([Color.grey, Color.red, Color.green, Color.blue, Color.black]);
				case 3: block = new GrouperBlock(0,0);
				case 4: block = new WaiterBlock(0,0);
				case 5: block = new DuplicatorBlock(0, 0);
				case 6: block = new SignalBlock(0,0);
				case 7: block = new AddBlack(0, 0);
				default: block = new Block(0,0);
			}
			block.mouseOffset.set(FlxG.mouse.x - x,FlxG.mouse.y - y);
		}
		if(blockType == 0)
			TutVars.checkForTutorial("directional_click");
	}
	
	public function disable()
	{
		alpha = .5;
	}
}