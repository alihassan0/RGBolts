package seq ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
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
	public var direction:FlxPoint;
	public var seq:Seq;
	public function new(X:Float , Y:Float, C:Int,s:Seq)
	{
		super(X, Y, "assets/images/seq/bolt.png");
		color = C;
		this.seq = s;
		direction = new FlxPoint(0,0);
	}
	/*function moveTween(p:FlxPoint) 
	{
		var options:TweenOptions = { type: FlxTween.ONESHOT}
		
		if (tween != null) {
			tween.cancel();
		}
		tween = FlxTween.tween(this, { x: p.x, y: p.y}, GlobalVars.moveDuration, options);		
	}*/
	public function moveBySpeed()
	{
		reset(x + (40/GlobalVars.stepDuration)*FlxG.elapsed*(direction.x),
			  y + (40/GlobalVars.stepDuration)*FlxG.elapsed*(direction.y));
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		moveBySpeed();
	}
}