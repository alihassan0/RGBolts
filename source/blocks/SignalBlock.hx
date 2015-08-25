package blocks ;
import seq.*;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class SignalBlock extends Block
{

	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/signal.png");
	}
	override public function affectSeq(s:Seq) 
	{
		var sig :Signal = new Signal(Math.floor(position.x), Math.floor(position.y));
		var dir:Int = Math.floor((angle % 360) / 90);
		switch(dir)
		{
			case 0: sig.setDirection(new FlxPoint(0,-1));
			case 1: sig.setDirection(new FlxPoint(1,0));
			case 2: sig.setDirection(new FlxPoint(0,1));
			case 3: sig.setDirection(new FlxPoint(-1,0));
		}
		s.kill();
	}
}