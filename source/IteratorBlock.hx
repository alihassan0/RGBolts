package ;

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
		s.wait();
		var curruntString:String = s.seqString;
		if (s.getString().length > 0 )
		{
			direct(new Seq(Math.floor(position.x), Math.floor(position.y), curruntString.charAt(0)),GlovalVars.UP);
			s.setString(curruntString.substring(1, curruntString.length));
		}
		else
		{
			s.kill();
		}	
	}
}