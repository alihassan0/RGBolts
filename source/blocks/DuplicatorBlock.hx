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
		super.affectSeq(s);
		s.kill();
		var seq :Seq = new Seq(Math.floor(position.x), Math.floor(position.y), s.getString());
		var seq1 :Seq = new Seq(Math.floor(position.x), Math.floor(position.y), s.getString());
		var seq2 :Seq = new Seq(Math.floor(position.x), Math.floor(position.y), s.getString());
		var seq3 :Seq = new Seq(Math.floor(position.x), Math.floor(position.y), s.getString());
			
			/*if ("k" == directionBoxDown){
				direct(seq3, GlobalVars.DOWN);
			}
			if ("k" == directionBoxUp){
				direct(seq, GlobalVars.UP);
			}
			if ("k" == directionBoxLeft){
				direct(seq1, GlobalVars.LEFT);
			}
			if ("k" == directionBoxRight){
				direct(seq2, GlobalVars.RIGHT);
			}*/
	}
}