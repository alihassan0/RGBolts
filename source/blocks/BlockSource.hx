package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;

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
		MouseEventManager.add(this, onDown, null, null, null,true);
	}
	private function loadSprite()
	{
		switch(blockType)
		{
			case 0: loadGraphic("assets/images/blocks/icons/directionalUp.png");
			case 1: loadGraphic("assets/images/blocks/icons/iterator.png");
			case 2: loadGraphic("assets/images/blocks/icons/grouper.png");
			case 3: loadGraphic("assets/images/blocks/icons/ifred.png");
			case 4: loadGraphic("assets/images/blocks/icons/waiter.png");
			case 5: loadGraphic("assets/images/blocks/icons/duplicator.png");
			case 6: loadGraphic("assets/images/blocks/icons/signal.png");
			case 7: loadGraphic("assets/images/blocks/icons/addblack.png");
		}
	}
	private function onDown(Sprite:FlxSprite)
	{
		if(!GlobalVars.level.isRunning && GlobalVars.blocksCreatingEnabled && !(TutVars.exists && GlobalVars.gameGrid.getBlocksCount()>=3))
		{
			switch(blockType)
			{
				case 0: new DirectionalBlock(0,0);
				case 1: new RemoveFirstBlock(0,0);
				case 2: new GrouperBlock(0,0);
				case 3: new FilterBlock(0, 0);
				case 4: new WaiterBlock(0,0);
				case 5: new DuplicatorBlock(0, 0);
				case 6: new SignalBlock(0,0);
				case 7: new AddBlack(0, 0);
			}
		}
		if(blockType == 0)
			TutVars.checkForTutorial("directional_click");
	}
	
	public function disable()
	{
		alpha = .5;
	}
}