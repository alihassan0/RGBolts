package blocks ;
import seq.Seq;
import customizationPanel.*;
import util.*;

/**
 * ...
 * @author ...
 */
class RemoveFirstBlock extends Block
{
	public var firstElementArrow:ArrowSprite;
	public var lastElementArrow:ArrowSprite;
	public var otherElementsArrow:ArrowSprite;
	
	public function new(x:Int,y:Int) 
	{
		super(x, y);
		loadGraphic("assets/images/cyanBlock.png");
		otherElementsArrow = new ArrowSprite(x,y,Direction.up,Color.black);
		firstElementArrow = new ArrowSprite(x,y,Direction.right,Color.grey);
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var curruntString:String = s.seqString;
		if (s.getString().length > 0)
		{
			var newSeq = new Seq(Math.floor(position.x), Math.floor(position.y),curruntString.charAt(0));
			newSeq.setDirection(Util.directionToFlxPoint[firstElementArrow.direction]);
			if(s.getString().length > 1)
			{
				s.setString(curruntString.substring(1, curruntString.length));		
				s.removeFirst();
				s.setDirection(Util.directionToFlxPoint[otherElementsArrow.direction]);
			}
			else
			s.kill();
		}
		else
		{
			s.kill();
		}
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new RemoveFirstCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		otherElementsArrow.setDirection(customizableBlock.arrows[0].getDirection());
		firstElementArrow.setDirection(customizableBlock.arrows[1].getDirection());
		//angle = Util.directionToAngle[direction];
	}
	override public function reset (x:Float, y:Float)
	{
		super.reset(x,y);
		firstElementArrow.reset(x,y);
		otherElementsArrow.reset(x,y);
	}
	override public function kill()
	{
		super.kill();
		firstElementArrow.kill();
		otherElementsArrow.kill();
	}
}