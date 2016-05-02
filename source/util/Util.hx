package util;
/**
 * ...
 * @author ...
 */
 import flixel.math.FlxPoint;
class Util
{
	public static var directionToAngle:Map<Direction, Int> =
    [
  		Direction.up=>0,
  		Direction.right=>90,
  		Direction.down=>180,
    	Direction.left=>270
    ];
    public static var directionToFlxPoint:Map<Direction, FlxPoint> =
    [
  		Direction.up=>new FlxPoint(0,-1),
  		Direction.right=>new FlxPoint(1, 0),
  		Direction.down=>new FlxPoint(0,1),
  		Direction.left=>new FlxPoint(-1,0)
    ];
    public static var colorToValue:Map<Color, Int> =
    [
      Color.red=>0xFFFF0000,
      Color.green=>0xFF00FF00,
      Color.blue=>0xFF0000FF,
      Color.black=>0xFF000000,
      Color.grey=>0xFFAAAAAA,
      Color.yellow=>0xFFFFFF00
    ];
    public static var colorToString:Map<Color,String> =
    [
      Color.red=>"r",
      Color.green=>"g",
      Color.blue=>"b",
      Color.black=>"k",
      Color.grey=>"y",
      Color.yellow=>"z"
    ];
    public static var stringToColor:Map<String,Color> =
    [
  		"r"=>Color.red,
  		"g"=>Color.green,
  		"b"=>Color.blue,
      "k"=>Color.black,
      "y"=>Color.grey,
  		"z"=>Color.yellow
    ];
}