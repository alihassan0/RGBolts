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
	
	public function new(posX:Int,posY:Int) 
	{
		var spritePos:FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(new FlxPoint(posX, posY));
		super(spritePos.x, spritePos.y);
		position = new FlxPoint(posX, posY);
		loadGraphic("assets/images/output.png");
		followMouse = false;
		this.testFunction = GlovalVars.level.levelInfo.testFunction;
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		FlxG.log.add(inputString +" "+ s.getString() +" "+checkOutputString("rgrgb","rrggb")+" "+" please work");
		if (checkOutputString(inputString,s.getString()))
		{
			GlovalVars.level.status_change(0);
		}
		else
		{
			GlovalVars.level.status_change(1);
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
		var bestfit:FlxPoint = GlovalVars.gameGrid.addInBestFit(this);
		if(bestfit == null)
		{
			var p :FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(p.x, p.y);
		}
		else
		{
			this.reset(bestfit.x, bestfit.y);
			this.position = GlovalVars.gameGrid.getposOfBlock(this);
		}
	}
	override public function onDown(Sprite:FlxSprite) 
	{
		if(!GlovalVars.level.isRunning)
		{
			followMouse = true;
		}
	}
}