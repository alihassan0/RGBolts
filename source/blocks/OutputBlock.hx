package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroupIterator;
import flixel.util.FlxPoint;
import seq.Seq;

/**
 * ...
 * @author ...
 */
class OutputBlock extends Block
{
	public var inputString:String;
	private var testFunction:String->String;
	
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/output.png");
		followMouse = false;
		this.testFunction = GlobalVars.level.levelInfo.testFunction;
		GlobalVars.gameGrid.outputBlock =  this;
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		FlxG.log.add(inputString +" "+ s.getString() +" "+checkOutputString("rgrgb","rrggb")+" "+" please work");
		if (checkOutputString(inputString,s.getString()))
		{
			
			GlobalVars.level.status_change(0);
		}
		else
		{
			GlobalVars.level.status_change(1);
		}
		
	}
	
	/*function checkOutputString(inputString:String, outputString:String):Bool
	{
		var redChars:String= "";
		var greenChars:String= "";
		var blackChars:String= "";
		for (i in 0...inputString.length)
		{
			switch (inputString.charAt(i))
			{
				case "r": redChars += inputString.charAt(i);
				case "g": greenChars += inputString.charAt(i);
				case "b": blackChars += inputString.charAt(i);
			}
		}
		return redChars + greenChars + blackChars == outputString;
	}*/
	function checkOutputString(inputString:String, outputString:String):Bool
	{
		return testFunction(inputString) == outputString;
	}
	override public function checkPosInGrid()
	{
		var bestfit:FlxPoint = GlobalVars.gameGrid.addInBestFit(this);
		if(bestfit == null)
		{
			var p :FlxPoint = GlobalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(p.x, p.y);
			return false;//i will probably change this later
		}
		else
		{
			this.reset(bestfit.x, bestfit.y);
			this.position = GlobalVars.gameGrid.getposOfBlock(this);
			return true;
		}
	}
	override public function onDown(Sprite:FlxSprite) 
	{
		if(!GlobalVars.level.isRunning)
		{
			followMouse = true;
		}
	}
}