package level;
import haxe.Constraints.Function;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */

class LevelInfo
{
	public var id:Int;
	public var description:String;
	public var inputString:String;
	public var testFunction:String->String->Bool;
	public var inputPosition:FlxPoint;
	public var outputPosition:FlxPoint;
	public var PublicTestCases:Array<String>;
	public var PrivateTestCases:Array<String>;
	
	public function new(id:Int ,inputString:String, description:String , testFunction:String->String->Bool) 
	{
		this.id = id;
		this.description = description;
		this.testFunction = testFunction;
		this.inputString = inputString;
	}
}