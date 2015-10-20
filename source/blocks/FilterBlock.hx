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
		loadGraphic("assets/images/blocks/grid/pinkBlock.png");
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
	override public function getSaveString():String
	{
		var s:String ="";
		s += Type.enumIndex(greyArrow.direction)	+ (greyArrow.alive?"*":" ");
		s += Type.enumIndex(redArrow.direction)		+ (redArrow.alive?"*":" ");
		s += Type.enumIndex(greenArrow.direction)	+ (greenArrow.alive?"*":" ");
		s += Type.enumIndex(blueArrow.direction)	+ (blueArrow.alive?"*":" ");
		s += Type.enumIndex(blackArrow.direction)	+ (blackArrow.alive?"*":" ");
		return s;
	}
	override public function loadSaveString(saveString:String)
	{//maybe there is a better a way than this .. but this should work for now
		greyArrow.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(0))));
		greyArrow.setEnabled(saveString.charAt(1)=="*");
		redArrow.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(2))));
		redArrow.setEnabled(saveString.charAt(3)=="*");
		greenArrow.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(4))));
		greenArrow.setEnabled(saveString.charAt(5)=="*");
		blueArrow.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(6))));
		blueArrow.setEnabled(saveString.charAt(7)=="*");
		blackArrow.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(8))));
		blackArrow.setEnabled(saveString.charAt(9)=="*");
	}
}