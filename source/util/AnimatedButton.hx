package util ;
import flixel.FlxG;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class AnimatedButton extends FlxSprite
{
	private var buttonsPath:String = "assets/images/GUI/buttons/";
	public function new(X:Int , Y:Int, spriteName:String)
	{
		super(X, Y);
		loadGraphic(buttonsPath+spriteName,true,175,185);
		scale.set(.3,.3);
		updateHitbox();
		animation.add("change",[0,1,2,3],2,true);
		animation.play("change");
	}	
}