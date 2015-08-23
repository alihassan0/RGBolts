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
		super.affectSeq(s);
		var curruntString:String = s.seqString;
		if (s.getString().length > 0 )
		{
			var newSeq = new Seq(Math.floor(position.x), Math.floor(position.y),curruntString.charAt(0)); 
				if ("b" == directionBoxDown){
					direct(newSeq, GlobalVars.DOWN);
				}
				if ("b" == directionBoxUp){
					direct(newSeq, GlobalVars.UP);
				}
				if ("b" == directionBoxLeft){
					direct(newSeq, GlobalVars.LEFT);
				}
				if ("b" == directionBoxRight){
					direct(newSeq, GlobalVars.RIGHT);
				}			
			s.removeFirst();
			if(s.getString().length > 1)
			{
				s.setString(curruntString.substring(1, curruntString.length));
				if ("k" == directionBoxDown){
					direct(s, GlobalVars.DOWN);
				}
				if ("k" == directionBoxUp){
					direct(s, GlobalVars.UP);
				}
				if ("k" == directionBoxLeft){
					direct(s, GlobalVars.LEFT);
				}
				if ("k" == directionBoxRight){
					direct(s, GlobalVars.RIGHT);
				}			
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