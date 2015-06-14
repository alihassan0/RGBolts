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
			case 0: loadGraphic("assets/images/directional.png");
			case 1: loadGraphic("assets/images/iterator.png");
			case 2: loadGraphic("assets/images/grouper.png");
			case 3: loadGraphic("assets/images/waiter.png");
			case 4: loadGraphic("assets/images/duplicator.png");
			case 5: loadGraphic("assets/images/ifred.png");
			case 6: loadGraphic("assets/images/ifgreen.png");
			case 7: loadGraphic("assets/images/ifblack.png");
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
				case 3: new WaiterBlock(0,0);
				case 4: new DuplicatorBlock(0, 0);
				case 5: new FilterBlock(0, 0, "r");
				case 6: new FilterBlock(0, 0, "g");
				case 7: new FilterBlock(0, 0, "b");
				case 8: new SignalBlock(0,0);
			}
		}
	}
	
	public function disable()
	{
		alpha = .5;
	}
}