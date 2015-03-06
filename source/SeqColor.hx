package ;
import flixel.FlxG;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class SeqColor extends FlxSprite
{
	public function new(X:Int , Y:Int, C:Int)
	{
		super(X, Y, "assets/images/color.png");
		color = C;
		//replaceColor(0xFF000000,C);
	}	
}