package seq ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.tweens.FlxEase;
/**
 * ...
 * @author ...
 */
class SeqElem extends FlxSprite
{
	public var tween:FlxTween;
	
	public function new(X:Float , Y:Float, C:Int)
	{
		super(X, Y, "assets/images/bolt.png");
		color = C;
	}
	function moveTween(p:FlxPoint) 
	{
		var options:TweenOptions = { type: FlxTween.ONESHOT}
		
		if (tween != null) {
			tween.cancel();
		}
		tween = FlxTween.tween(this, { x: p.x, y: p.y}, GlobalVars.moveDuration, options);		
	}	
}