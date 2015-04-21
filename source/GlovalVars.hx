package ;
import seq.Seq;
import level.*;

/**
 * ...
 * @author ...
 */
class GlovalVars
{
	public static var gameGrid:GameGrid;
	public static var level:Level;
	public static var Seqs:Array<Seq>;
	public static var levels:Array<LevelInfo>;
	public static var turn:Int = 0;
	
	public static var UP:Int = 0;
	public static var DOWN:Int = 1;
	public static var LEFT:Int = 2;
	public static var RIGHT:Int = 3;
	
	
	public static function loadLevels()
	{
		levels = new Array<LevelInfo>();
		
		//just a mere intrdouction to the level lauout and the directional block
		levels.push(new LevelInfo(levels.length +1,  "r" ,"direct the seq to the output block", checkSame));	

		levels.push(new LevelInfo(levels.length +1,  "rgrgb" ,"sort red first then green then black", sortRedThenGreen));
		
		levels.push(new LevelInfo(levels.length +1,  "rrgrggrb" ,"dublicate string", duplicateString));
	}
	static function sortRedThenGreen(inputString:String, outputString:String):Bool
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
	static function duplicateString (inputString:String, outputString:String):Bool
	{
		var s :String = inputString.substring(0, inputString.length - 1);
		return (s + s + "b") == outputString ;  
	}
	static function checkSame (inputString:String, outputString:String):Bool
	{
		return inputString == outputString;
	}

	
}