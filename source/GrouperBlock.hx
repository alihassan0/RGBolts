package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
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
			s.wait();
		}
		else if(s.alive)
		{
			if(curruntSeq != s)
			{
				curruntSeq.setString(curruntSeq.getString() + s.getString());
				s.kill();
				if (s.getString().charAt(0) != 'b')
				{
					curruntSeq.wait();
					s.wait();
					FlxG.log.add("i am the end sec 'b' at " + GlovalVars.turn + "with location " +  s.get_position);
				}
				else
				{
					curruntSeq.set_direction(s.get_direction());
					curruntSeq.unwait();
				}
			}
			else
			{
				curruntSeq.wait();
				FlxG.log.add("i am the currnet sec at " + GlovalVars.turn);
			}
		}
	}
	override public function reset_state() 
	{
		super.reset_state();
		curruntSeq = null;
	}
}