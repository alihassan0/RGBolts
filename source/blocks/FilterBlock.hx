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
	public var availableColors:Array<Color>;
	public function new(x:Float,y:Float) 
	{
		super(x, y);
		loadGraphic("assets/images/blocks/grid/pinkBlock.png");
		availableColors = [Color.grey, Color.red, Color.green, Color.blue,Color.black];
		initializeArrows();
		greyArrow = getArrowByColor(Color.grey);
		redArrow = getArrowByColor(Color.red);
		greenArrow = getArrowByColor(Color.green);
		blueArrow = getArrowByColor(Color.blue);
		blackArrow = getArrowByColor(Color.black);
		/**/
	}
	private function initializeArrows()
	{
		/*for (i in 0 ... availableColors.length)
		{
			
		}*/
		new ArrowSprite(this,Direction.up,Color.grey,true);
		new ArrowSprite(this,Direction.right,Color.red,true);
		new ArrowSprite(this,Direction.down,Color.green,false);
		new ArrowSprite(this,Direction.left,Color.blue,false);
		new ArrowSprite(this,Direction.right,Color.black,false);
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new FilterCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{
		for (i in 0 ... arrowSprites.length) 
		{
			arrowSprites[i].loadDataFromArrow(customizableBlock.getArrowByColor(arrowSprites[i].rgbColor));
		}
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var firstChar:String = s.getString().charAt(0);
		//i will probably revisit this later
		//it's time to revisit it now .. it's been a while
		for (i in 0 ... availableColors.length) {
			var arrow:ArrowSprite = getArrowByColor(availableColors[i]);
			if(arrow.rgbColor == util.Color.grey)
				continue;
			if (arrow.alive && firstChar == Util.colorToString[arrow.rgbColor])
			{
				s.setDirection(Util.directionToFlxPoint[arrow.direction]);
				return ;
			}
		}
		s.setDirection(Util.directionToFlxPoint[getArrowByColor(Color.grey).direction]);
	}
	override public function getSaveString():String
	{
		var s:String ="";
		for (i in 0 ... availableColors.length) {
			var arrow:ArrowSprite = getArrowByColor(availableColors[i]); 
			s += Type.enumIndex(arrow.direction)	+ (arrow.alive?"*":" ");
		}
		return s;
	}
	override public function loadSaveString(saveString:String)
	{
		//maybe there is a better a way than this .. but this should work for now
		//i think i found a beter way because this shit 
		for (i in 0 ... availableColors.length) {
			var arrow:ArrowSprite = getArrowByColor(availableColors[i]);
			arrow.setDirection(Type.createEnumIndex(Direction,Std.parseInt(saveString.charAt(i*2+0))));
			arrow.setEnabled(saveString.charAt(i*2+1)=="*");	
		}
	}
}