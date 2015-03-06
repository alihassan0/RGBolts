package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroupIterator;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class OutputBlock extends Block
{
	private var inputString:String;
	public function new(posX:Int,posY:Int,inputString:String) 
	{
		var spritePos:FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(new FlxPoint(posX, posY));
		super(spritePos.x, spritePos.y);
		position = new FlxPoint(posX, posY);
		loadGraphic("assets/images/output.png");
		followMouse = false;
		this.inputString = inputString;
		
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
	
	function checkOutputString(inputString:String, outputString:String):Bool
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
	}
	override public function checkPosInGrid() 
	{
		if (!this.overlaps(GlovalVars.gameGrid))
		{
			var p :FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(p.x, p.y);
		}
		else
		{
			var bestfit:FlxPoint = GlovalVars.gameGrid.addInBestFit(new FlxPoint(x + width / 2, y + height / 2),this);
			this.reset(bestfit.x, bestfit.y); 
		}
	}
	override public function onDown(Sprite:FlxSprite) 
	{
		followMouse = true;
	}
}