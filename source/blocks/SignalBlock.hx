package blocks ;
import flixel.math.FlxPoint;
import seq.*;
import customizationPanel.*;
import util.*;
/**
 * ...
 * @author ...
 */
class SignalBlock extends Block
{
	public var direction:Direction;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/blocks/grid/signal.png");
		direction = Direction.up;
	}
	override public function affectSeq(s:Seq) 
	{
		var sig :Signal = new Signal(Math.floor(position.x), Math.floor(position.y));
		sig.setDirection(Util.directionToFlxPoint[direction]);
		s.kill();
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new SignalCustomizableBlock(x,y,block);
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
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		direction = customizableBlock.arrows[0].getDirection();
		angle = Util.directionToAngle[direction];
	}
}