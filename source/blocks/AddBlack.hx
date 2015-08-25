package blocks;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import seq.Seq;
import seq.SeqColor;
import seq.SeqElem;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class AddBlack extends Block
{

	public function new(X:Int,Y:Int) 
	{
		
		super(X, Y);
		loadGraphic("assets/images/addblack.png");
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var newString =  s.seqString + "k";
		var newSeq = new Seq(Math.floor(position.x), Math.floor(position.y),newString); 
		var dir:FlxPoint = s.direction;
		newSeq.setDirection(dir);

		s.kill();
		
	}
}