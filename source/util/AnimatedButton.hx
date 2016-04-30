package util ;
import flixel.FlxG;
import flixel.FlxSprite;

import flixel.input.mouse.FlxMouseEventManager;
/**
 * ...
 * @author ...
 */
class AnimatedButton extends FlxSprite
{
	private var buttonsPath:String = "assets/images/GUI/buttons/";
	private var OnDownAction:Void->Void;

	public function new(X:Int , Y:Int, spriteName:String, ?OnDownAction:Void->Void)
	{
		super(X, Y);
		loadGraphic(buttonsPath+spriteName,true,175,185);
		this.OnDownAction = OnDownAction;
		scale.set(.3,.3);
		updateHitbox();
		FlxMouseEventManager.add(this ,onDown ,onUp ,onOver ,onOut, false, true, false);
		
	}	
	public function onDown(Sprite:FlxSprite)
	{
		animation.frameIndex = 2;
		OnDownAction();
	}
	public function onUp(Sprite:FlxSprite)
	{
		animation.frameIndex = 0;
	}
	public function onOver(Sprite:FlxSprite)
	{
		animation.frameIndex = 1;
	}
	public function onOut(Sprite:FlxSprite)
	{
		if(animation != null)
			animation.frameIndex = 0;
	}
}