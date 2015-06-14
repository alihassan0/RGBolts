package blocks ;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import seq.Seq;

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
		var seq :Seq = new Seq(Math.floor(position.x), Math.floor(position.y), s.getString());
		direct(s, GlobalVars.UP);
		direct(seq, GlobalVars.DOWN);
	}
}