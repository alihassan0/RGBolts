package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
/**
 * ...
 * @author ...
 */
class WaiterBlock extends Block
{
	private var curruntSeqs:Array<Seq>;
	public var waiting:Bool = false;
	public var lastTurn:Int = 0;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/waiter.png");
		curruntSeqs = new Array<Seq>();
		FlxG.watch.add(this, "waiting");
		FlxG.watch.add(this, "lastTurn");
		FlxG.watch.add(this, "curruntSeqs.length");
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if (curruntSeqs.indexOf(s) == -1)
			curruntSeqs.push(s);
		if (curruntSeqs.length > 0 && s == curruntSeqs[0] && GlovalVars.turn != lastTurn)
		{
			lastTurn = GlovalVars.turn;
			if (waiting)
			{
				direct(curruntSeqs.splice(0, 1)[0],GlovalVars.UP);
				waiting = false;
			}
			else
			{
				waiting = true;
			}
		}
		for (i in 0...curruntSeqs.length)
		{
			curruntSeqs[i].wait();
		}
		
	}
	override public function reset_state() 
	{
		super.reset_state();
		curruntSeqs = new Array<Seq>();
		waiting= false;
		lastTurn = 0;
	}
}