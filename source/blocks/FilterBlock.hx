package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;
import seq.Seq;
import level.Level;
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
			case "b":loadGraphic("assets/images/ifblue.png");
			case "k":loadGraphic("assets/images/ifblack.png");
			default:loadGraphic("assets/images/ifred.png");
		}

	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if(s.getString().charAt(0)==filter_string)
		{
			direct(s, GlobalVars.RIGHT);
		}
		else
		{
			direct(s, GlobalVars.UP);
		}
	}
}