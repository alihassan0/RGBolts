package ;
import seq.*;
import level.*;

/**
 * ...
 * @author ...
 */
class GlovalVars
{
	public static var gameGrid:GameGrid;
	public static var level:Level;
	public static var levelInfo:LevelInfo;
	public static var Seqs:Array<Seq>;
	public static var Signals:Array<Signal>;
	public static var levels:Array<LevelInfo>;
	public static var turn:Int = 0;
	
	public static var UP:Int = 0;
	public static var DOWN:Int = 1;
	public static var LEFT:Int = 2;
	public static var RIGHT:Int = 3;
	
	public static function loadLevels()
	{
		levels = new Array<LevelInfo>();

		//********************************set 1 ***************************************************
		//--------------------------------level 1 ---------------------------------------------------
		//just a mere intrdouction to the level lauout and the directional block
		//we can change the initial position of inputs and outputs block to make sure in this level 
		//the player knows how to use direction good enough
		levels.push(new LevelInfo(levels.length +1,
			"direct the seq to the output block", checkSame));

		//--------------------------------level 2 ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the last element before black", getElementBeforeLast));

		levels.push(new LevelInfo(levels.length +1,
			"output the yellow color", getTheYellowElement));
		
		

		//---------------------introducing more than one element in the sequence---------------------
		//before sorting we should do some fitering to introduce the remove first block and the 
		//iteration ideas .

		levels.push(new LevelInfo(levels.length +1, 
			"sort red first then green then black", sortRedThenGreen));
		
		levels.push(new LevelInfo(levels.length +1,
			"dublicate string", duplicateString));
	}
	static function sortRedThenGreen(inputString:String):String
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
		return redChars + greenChars + blackChars;
	}
	static function duplicateString (inputString:String):String
	{
		var s :String = inputString.substring(0, inputString.length - 1);
		return (s + s + "b");  
	}
	static function checkSame (inputString:String):String
	{
		return inputString;
	}
	static function getElementBeforeLast(inputString:String):String
	{
		return inputString.charAt(inputString.length-2);
	}
	static function getTheYellowElement(inputString:String):String
	{
		return "y";
	}
	

	
}