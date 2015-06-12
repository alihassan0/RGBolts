package seq;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxPoint;
import blocks.Block;

class Signal extends Seq{
	
	public function new (posX:Int, posY:Int)
	{
		super(posX, posY,"#");
		loadGraphic("assets/images/sig.png");
		seqRepresenter.kill();
	}
	override public function affectBlock(b:Block)
	{
		b.toggleEnabled(this);
	}
}