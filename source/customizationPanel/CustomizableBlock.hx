package customizationPanel ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
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

	/**
	 * Constructor for the customizable Block
	 * 
	 * @param	X				The initial X position of the block.
	 * @param	Y				The initial Y position of the block.
	 */
	public function new(X:Float , Y:Float)
	{
		super(X, Y, "assets/images/greenBlock.png");
		FlxG.state.add(this);
		addArrows();
	}
	/**
	* initialize the arrows array .. should be overriden by each block to add it's own arrows
	*/
	public function addArrows()
	{
		arrows = new Array<Arrow>();
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
		FlxG.state.add(arrow);
		arrows.push(arrow);
	}
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