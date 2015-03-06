package ;
import flixel.FlxSprite;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class DirectionalBlock extends Block
{
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/directional.png");
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		switch((angle % 360) / 90)
		{
			case 0: s.set_direction(new FlxPoint(0,-1));
			case 1: s.set_direction(new FlxPoint(1,0));
			case 2: s.set_direction(new FlxPoint(0,1));
			case 3: s.set_direction(new FlxPoint(-1,0));
		}
	}
	
}