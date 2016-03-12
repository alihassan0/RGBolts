package seq;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;
import blocks.Block;
import blocks.DirectionalBlock;

class Signal extends Seq{
	
	public function new (posX:Int, posY:Int)
	{
		super(posX, posY,"#");
		loadGraphic("assets/images/seq/sig.png");
	}
	override public function affectBlock(b:Block)
	{
		b.toggleEnabled(this);
		kill();
		trace("something should happen here ");
	}
	override public function affect()
	{

		var currBLock:Block = GlobalVars.gameGrid.getBlockOfPos(position);		
		affectBlock(currBLock);
	}
}