package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
/**
 * ...
 * @author ...
 */
class FilterBlock extends Block
{
	private var filter_string:String;
	public function new(X:Int,Y:Int,c:String) 
	{
		super(X, Y);
		filter_string = c;
		switch(c)
		{
			case "r":loadGraphic("assets/images/ifred.png");
			case "g":loadGraphic("assets/images/ifgreen.png");
			case "b":loadGraphic("assets/images/ifblack.png");
			default:loadGraphic("assets/images/ifred.png");
		}
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if(s.getString().charAt(0)==filter_string)
		{
			direct(s, GlovalVars.RIGHT);
		}
		else
		{
			direct(s, GlovalVars.UP);
		}
	}
}