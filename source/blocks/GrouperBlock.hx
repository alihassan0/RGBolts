package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import seq.Seq;
/**
 * ...
 * @author ...
 */
class GrouperBlock extends Block
{
	private var curruntSeq:Seq;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/grouper.png");
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if (curruntSeq == null)
		{
			curruntSeq = s;
			curruntSeq.wait();
			trace("aaa");
		}
		else if(s.alive)
		{
			if(curruntSeq != s)
			{
				curruntSeq.setString(curruntSeq.getString() + s.getString());
				s.kill();
				curruntSeq.wait();
				s.wait();
				trace("bbb");
			}
			else
			{
				curruntSeq.wait();
				FlxG.log.add("i am the currnet sec at " + GlobalVars.turn);
				trace("ccc");
			}
		}
	}
	override public function toggleEnabled(?s:Seq)
	{
		super.toggleEnabled();
		curruntSeq.canMove = true;
		if(s!=null)
		curruntSeq.set_direction(s.get_direction());
	}
	override public function reset_state() 
	{
		super.reset_state();
		curruntSeq = null;
	}
}