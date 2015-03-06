package ;
import flixel.FlxSprite;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class DuplicatorBlock extends Block
{
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/duplicator.png");
	}
	override public function affectSeq(s:Seq) 
	{
		var seq :Seq = new Seq(Math.floor(position.x), Math.floor(position.y), "rgrgb");
		direct(s, GlovalVars.UP);
		direct(seq, GlovalVars.DOWN);
	}
}