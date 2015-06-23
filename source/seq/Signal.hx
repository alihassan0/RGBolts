package seq;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxPoint;
import blocks.Block;
import blocks.DirectionalBlock;

class Signal extends Seq{
	
	public function new (posX:Int, posY:Int)
	{
		super(posX, posY,"#");
		loadGraphic("assets/images/sig.png");
		seqRepresenter.kill();
	}
	override public function affectBlock(b:Block)
	{
		kill();
		b.toggleEnabled(this);
	}
}