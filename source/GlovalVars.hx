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
		
		//level 1
		levels.push(new LevelInfo(1,  "rgrgb" ,"sort red first then green then black", sortRedThenGreen));
		
		
		//level 2
		levels.push(new LevelInfo(1,  "rrgrggrb" ,"dublicate string", duplicateString));
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
	
}