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
	public var testFunction:String->String;
	public var inputPos:FlxPoint;
	public var outputPos:FlxPoint;
	public var publicInputTests:Array<String>;
	public var privateInputTests:Array<String>;
	
	public function new(id:Int , description:String , testFunction:String->String ,
						 ?publicInputTests:Array<String> , ?inputPos:FlxPoint,?outputPos:FlxPoint)
	{
		this.id = id;
		this.description = description;
		this.testFunction = testFunction;
		this.publicInputTests = publicInputTests;
		this.inputPos = inputPos;
		this.outputPos = outputPos;
	}
}