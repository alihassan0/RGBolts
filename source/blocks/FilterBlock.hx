package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;
import seq.Seq;
import level.Level;
import customizationPanel.*;
import util.*;
/**
 * ...
 * @author ...
 */
class FilterBlock extends Block
{
	public var greyArrow:ArrowSprite;
	public var redArrow:ArrowSprite;
	public var greenArrow:ArrowSprite;
	public var blueArrow:ArrowSprite;
	public var blackArrow:ArrowSprite;
	public var otherElementsArrow:ArrowSprite;
	public function new(x:Float,y:Float) 
	{
		super(x, y);
		loadGraphic("assets/images/pinkBlock.png");
		greyArrow = new ArrowSprite(this,Direction.up,Color.grey,true);
		redArrow = new ArrowSprite(this,Direction.right,Color.red,true);
		greenArrow = new ArrowSprite(this,Direction.down,Color.green,false);
		blueArrow = new ArrowSprite(this,Direction.left,Color.blue,false);
		blackArrow = new ArrowSprite(this,Direction.right,Color.black,false);
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new FilterCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		greyArrow.loadDataFromArrow(customizableBlock.arrows[0]);
		redArrow.loadDataFromArrow(customizableBlock.arrows[1]);
		greenArrow.loadDataFromArrow(customizableBlock.arrows[2]);
		blueArrow.loadDataFromArrow(customizableBlock.arrows[3]);
		blackArrow.loadDataFromArrow(customizableBlock.arrows[4]);
	}	
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var firstChar:String = s.getString().charAt(0);
		
			if (redArrow.alive && firstChar == "r")
				s.setDirection(Util.directionToFlxPoint[redArrow.direction]);
			else if (greenArrow.alive && firstChar == "g")
				s.setDirection(Util.directionToFlxPoint[greenArrow.direction]);
			else if (blueArrow.alive && firstChar == "b")
				s.setDirection(Util.directionToFlxPoint[blueArrow.direction]);
			else if (blackArrow.alive && firstChar == "k")
				s.setDirection(Util.directionToFlxPoint[blackArrow.direction]);
			else
				s.setDirection(Util.directionToFlxPoint[greyArrow.direction]);
			
	}
}