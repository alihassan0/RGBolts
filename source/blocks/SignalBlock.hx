package blocks ;
import seq.*;

/**
 * ...
 * @author ...
 */
class SignalBlock extends Block
{

	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/signal.png");
	}
	override public function affectSeq(s:Seq) 
	{
		var sig :Signal = new Signal(Math.floor(position.x), Math.floor(position.y));
		sig.set_direction(s.get_direction());
		s.kill();
	}
}