package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import util.*;
import blocks.*;

/**
 * The base for all customizable blocks 
 */
class CustomizableBlock extends FlxSprite
{
	/**
	 * array to hold all Arrows 
	 */
	public var arrows:Array<Arrow>;
	/**
	 * reference to the block that this class edits 
	 */
	public var block:Block;

	private var toggleColorButtons:Array<ToggleColorButton>;
	/**
	 * Constructor for the customizable Block
	 * 
	 * @param	X				The initial X position of the block.
	 * @param	Y				The initial Y position of the block.
	 */
	public function new(X:Float , Y:Float)
	{
		super(X, Y, "assets/images/greenBlock.png");
		GlobalVars.level.gui.panelsGroup.add(this);
		addArrows();
		addToggleButtons();
		alpha = 0;
		animateIntro();
	}
	public function animateIntro()
	{
		var duration:Float = .66;
		FlxTween.tween(this, {alpha:1}, duration, {ease:FlxEase.circOut});
		FlxTween.tween(this.scale, {x:2,y:2}, duration, {ease:FlxEase.circOut,complete:updateDimentions});
		for (i in 0 ... arrows.length) {
			arrows[i].scale.set(.5,.5);
			FlxTween.tween(arrows[i].scale, {x:1,y:1}, duration, {ease:FlxEase.circOut});
		}
	}
	public function updateDimentions(tween:FlxTween)
	{
		//this.updateHitbox();
	}
	/**
	* initialize the arrows array .. should be overriden by each block to add it's own arrows
	*/
	public function addArrows()
	{
		arrows = new Array<Arrow>();
	}
	public function addToggleButtons()
	{
		toggleColorButtons = new Array<ToggleColorButton>();
	}
	/**
	* adds a new arrow to the block 
	*
	* @param color 				specify the color of the Arrow like (red , green , ....)
	* @param direction 				specify the direction of the Arrow like (up , right , ....)
	*/
	public function addArrow(color:Color,direction:Direction)
	{
		var arrow:Arrow = new Arrow(this, color , direction);
		GlobalVars.level.gui.panelsGroup.add(arrow);
		arrows.push(arrow);
	}
	public function addArrowFromArrowSprite(arrowSprite:ArrowSprite)
	{
		trace(arrowSprite.alive + " " + arrowSprite.rgbColor);
		var arrow:Arrow = new Arrow(this, arrowSprite.rgbColor , arrowSprite.direction , arrowSprite.alive);
		GlobalVars.level.gui.panelsGroup.add(arrow);
		arrows.push(arrow);
	}
	/**
	* overridable method that update the gridBlock whenever you change the direction of an arrow
	*/
	public function updateGridBlock()
	{
		
	}
	override public function kill()
	{
		super.kill();
		for (i in 0 ... arrows.length) {
			arrows[i].kill();
		}
	}
	override public function destroy()
	{
		for (i in 0 ... arrows.length) {
			arrows[i].destroy();
		}
		super.destroy();
	}
}