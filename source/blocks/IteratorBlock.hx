package blocks ;
import seq.Seq;

/**
 * ...
 * @author ...
 */
class IteratorBlock extends Block
{

	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/iterator.png");
	}
	override public function affectSeq(s:Seq) 
	{
		var curruntString:String = s.seqString;
		if (s.getString().length > 0 )
		{
			var newSeq = new Seq(Math.floor(position.x), Math.floor(position.y),""); 
			newSeq.setString(curruntString.charAt(0));
			direct(newSeq,GlobalVars.RIGHT);
			newSeq.insertFirst(s.removeFirst());
			newSeq.move();
			trace("removed "+curruntString.charAt(0) +"from " +curruntString );
			if(s.getString().length > 1)
			{
				s.setString(curruntString.substring(1, curruntString.length));
				direct(s,GlobalVars.UP);
			}
			else
			s.kill();
		}
		else
		{
			s.kill();
		}	
	}
}