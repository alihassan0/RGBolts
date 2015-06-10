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
	public var testFunction:String->String;
	public var inputPosition:FlxPoint;
	public var outputPosition:FlxPoint;
	public var publicInputTests:Array<String>;
	public var privateInputTests:Array<String>;
	
	public function new(id:Int ,inputString:String, description:String , testFunction:String->String) 
	{
		this.id = id;
		this.description = description;
		this.testFunction = testFunction;
		this.inputString = inputString;
		this.publicInputTests = new Array<String>();
		publicInputTests.push("g");
		publicInputTests.push("rg");
		publicInputTests.push("gr");
		publicInputTests.push("rgr");
		publicInputTests.push("grg");
	}
}