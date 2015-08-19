package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import seq.Seq;
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
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if (s.direction.x != 0 || s.direction.y != 0)
		{
			s.lastDirection.set(s.direction.x,s.direction.y);
			s.direction.set(0,0);
		}
		else
			s.direction.set(s.lastDirection.x,s.lastDirection.y);
	}
	override public function reset_state() 
	{
		super.reset_state();
		curruntSeqs = new Array<Seq>();
		waiting= false;
		lastTurn = 0;
	}
}