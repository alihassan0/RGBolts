package blocks ;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import seq.Seq;
import customizationPanel.*;
import util.*;
/**
 * ...
 * @author ...
 */
class DirectionalBlock extends Block
{
	public var direction:Direction;
	public function new(X:Int,Y:Int)
	{	
		super(X, Y);
		loadGraphic("assets/images/directionalUp.png");
		direction = Direction.up;
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		s.setDirection(Util.directionToFlxPoint[direction]);
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new DirectionalCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		setDirection(customizableBlock.arrows[0].getDirection());	
	}
	override public function getSaveString():String
	{
		return Type.enumIndex(direction)+"";
	}
	override public function loadSaveString(saveString:String)
	{
		setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(0))));
	}
	public function setDirection(direction:Direction)
	{
		this.direction = direction;
		angle = Util.directionToAngle[direction];
	}
}

