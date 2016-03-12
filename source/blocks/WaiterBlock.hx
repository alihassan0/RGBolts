package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import seq.Seq;
import customizationPanel.*;
import util.*;
/**
 * ...
 * @author ...
 */
class WaiterBlock extends Block
{
	private var curruntSeqs:Array<Seq>;
	public var waiting:Bool = false;
	public var lastTurn:Int = 0;
	public var direction:Direction;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/blocks/grid/waiter.png");
		curruntSeqs = new Array<Seq>();
		direction = Direction.up;
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if (s.direction.x != 0 || s.direction.y != 0)
		{
			s.lastDirection.set(s.direction.x,s.direction.y);
			s.direction.set(0,0);
		}
		else
			s.direction.set(s.lastDirection.x,s.lastDirection.y);
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new WaiterCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		direction = customizableBlock.arrows[0].getDirection();
		angle = Util.directionToAngle[direction];
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
	override public function reset_state() 
	{
		super.reset_state();
		curruntSeqs = new Array<Seq>();
		waiting= false;
		lastTurn = 0;
	}
}