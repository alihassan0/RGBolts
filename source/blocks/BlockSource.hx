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
			case 0: loadGraphic("assets/images/directionalUp.png");
			case 1: loadGraphic("assets/images/iterator.png");
			case 2: loadGraphic("assets/images/grouper.png");
			case 3: loadGraphic("assets/images/ifred.png");
			case 4: loadGraphic("assets/images/ifgreen.png");
			case 5: loadGraphic("assets/images/ifblue.png");
			case 6: loadGraphic("assets/images/waiter.png");
			case 7: loadGraphic("assets/images/duplicator.png");
			case 8: loadGraphic("assets/images/signal.png");
		}
	}
	private function onDown(Sprite:FlxSprite)
	{
		if(!GlobalVars.level.isRunning)
		{
			switch(blockType)
			{
				case 0: new DirectionalBlock(0,0);
				case 1: new IteratorBlock(0,0);
				case 2: new GrouperBlock(0,0);
				case 3: new FilterBlock(0, 0, "r");
				case 4: new FilterBlock(0, 0, "g");
				case 5: new FilterBlock(0, 0, "b");
				case 6: new WaiterBlock(0,0);
				case 7: new DuplicatorBlock(0, 0);
				case 8: new SignalBlock(0,0);
			}
		}
		if(blockType == 0)
			GlobalVars.level.checkForTutorial("directional_click");
	}
	
	public function disable()
	{
		alpha = .5;
	}
}