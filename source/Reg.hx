package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.util.FlxColor;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static var backgroundColor:Int = 0xFFFFF3B6;
	public static var testingBackgroundColor:Int = 0xFFF2C968;
	public static var gridColor:Int = 0xAA5C755E;
	//public static var redColor:Int = 0XFFC65F54;
	public static var logoBackground:Int = 0xFFF3F5DD;

	public static var helpTextColor:Int = 0xFFFFFFFF;
	public static var highlighterLineColor:Int = 0xFF333333;
	public static var helpPanelColor:Int = 0xFF000000;


	public static var panelBackgroundColor:Int = 0xFFA97D5D;

	public static var font:String = "assets/fonts/Fridays.ttf";
	public static var titleFont:String = "assets/fonts/GCRANK.TTF";
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];

	public static function switchState(state:FlxState)
	{
		FlxG.camera.fade(FlxColor.WHITE,.8, false, function() {
			FlxG.switchState(state);
		});
	}
}