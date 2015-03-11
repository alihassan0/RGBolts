package level;
import haxe.Constraints.Function;

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
	
	public function new(id:Int ,inputString:String, description:String , testFunction:String->String->Bool) 
	{
		this.id = id;
		this.description = description;
		this.testFunction = testFunction;
		this.inputString = inputString;
	}	
}