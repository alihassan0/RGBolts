package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;
import seq.Seq;
import level.Level;
import customizationPanel.*;
/**
 * ...
 * @author ...
 */
class FilterBlock extends Block
{
	private var filter_string:String;
	public function new(X:Int,Y:Int,c:String) 
	{
		super(X, Y);
		filter_string = c;
		
		switch(c)
		{
			case "r":loadGraphic("assets/images/ifred.png");
			case "g":loadGraphic("assets/images/ifgreen.png");
			case "b":loadGraphic("assets/images/ifblue.png");
			case "k":loadGraphic("assets/images/ifblack.png");
			default:loadGraphic("assets/images/ifred.png");
		}

	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new FilterCustomizableBlock(x,y,block);
	}
	/*override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if(s.getString().charAt(0)==filter_string)
		{
			direct(s, GlobalVars.RIGHT);
		}
		else
		{
			direct(s, GlobalVars.UP);
		}
	}*/
	
	
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var sequence:String = s.getString().charAt(0);
		var found:Bool = false;
		
		/*if (!found) {
			if ("e" == directionBoxDown){
			direct(s, GlobalVars.DOWN);
			}
			if ("e" == directionBoxUp){
				direct(s, GlobalVars.UP);
			}
			if ("e" == directionBoxLeft){
				direct(s, GlobalVars.LEFT);
			}
			if ("e" == directionBoxRight){
				direct(s, GlobalVars.RIGHT);
			}
		}*/
		
	}
	
	
}