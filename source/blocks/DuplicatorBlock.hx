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
class DuplicatorBlock extends Block
{
	public var firstDuplicate:ArrowSprite;
	public var secondDuplicate:ArrowSprite;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/blocks/grid/blueBlock.png");
		firstDuplicate = new ArrowSprite(this,Direction.up,Color.yellow);
		secondDuplicate = new ArrowSprite(this,Direction.down,Color.yellow);
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var newSeq:Seq = new Seq(Math.floor(position.x), Math.floor(position.y), s.getString());
		s.setDirection(Util.directionToFlxPoint[firstDuplicate.direction]);
		newSeq.setDirection(Util.directionToFlxPoint[secondDuplicate.direction]);
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new DuplicatorCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		firstDuplicate.setDirection(customizableBlock.arrows[0].getDirection());
		secondDuplicate.setDirection(customizableBlock.arrows[1].getDirection());
	}
	override public function getSaveString():String
	{
		return Type.enumIndex(firstDuplicate.direction)+""+Type.enumIndex(secondDuplicate.direction);
	}
	override public function loadSaveString(saveString:String)
	{
		firstDuplicate.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(0))));
		secondDuplicate.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(1))));
	}
}