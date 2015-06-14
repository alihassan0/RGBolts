package ;
import seq.*;
import level.*;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class GlobalVars
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
		//-------------------------------level 1: -------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"direct the seq to the output block", checkSame,
			["ggg","rrr","grg","rgr","rrgrr"],
			new FlxPoint(0,3),new FlxPoint(7,6),0));

		//--------------------------------level 2 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the third element only", getTheThirdElement,
			["ggg","rrr","grg","rgr","rrgrr"],null,null,1));

		//--------------------------------level 3 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the red element in the sequence", getTheRedElement,
			["r","ggr","grg","gggr","gggggr"]));

		//--------------------------------level 4 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"filter the red elements", getTheBlueElement,
			["b","ggb","gbg","gggb","gggggb"]));

		//--------------------------------level 4 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the last element before black", getTheBlueElement,
			["b","ggb","gbg","gggb","gggggb"]));


		//#3 output the black block;
		levels.push(new LevelInfo(levels.length +1,
			"output the black element only", getTheBlackElement,
			["ggbg","rbrr","grgb","rbgr","rrbgrr"]));

		//#4 introduce blue seq and ask the player to filter them using filtering red and greeen

		//#5 introduce the black block and that it is not read nor green or blue

		//#6 introduce the grouper to filter all but a certain element

		//#7 return all seqs after a certain element

		//--------------------------------level 4 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the last element before black", getElementBeforeLast,
			["r","ggr","grg","gggb","gggggb"]));


		"hello and welcomr to nawwar's Color Box\n
		let's get you started with the basics \n 
		in this level you have to direct the 
		input seq(Sequence) from the input block
		to the output block using the directionl block
		only the directional block doesn't affect the seq
		internally .. it changes it's direction only ."

		"good job \n now le'ts add another useful block
		the removefirst block .. to understand it first 
		you understand what seq is . seq is a container
		that list of one or more colors .. you can preview
		any seq by clicking on it .. .. the removeFirst block 
		devids the currunt seq into two seq .. one containing
		the first color only .. and the second contains the 
		rest of the colors"

		"nice .. now let's make sure you understand those 
		two previous blocks good enoug .. as well as 
		introduce a new more block .. this new block is 
		the red-filter block .. it will look on the first
		color of the block and will leave it if it's not 
		rid .. and will redirect it if it was red ... 
		can you solve it in three blocks only ? "

		

		


		//change background in play mode .. add tutrial for each level
		//.. allow to add more private tests
		// add a title for each level containg it's name 
		//in gamegrid make the seq tween between states
		//fix the sprite of signal source ..
		//add major UI improvements



		//before sorting we should do some fitering to introduce the remove first block and the 
		//iteration ideas .
		//insert the blue elemnt;

		/*levels.push(new LevelInfo(levels.length +1,
			"output the yellow color", getTheYellowElement));
		
		levels.push(new LevelInfo(levels.length +1, 
			"sort red first then green then black", sortRedThenGreen));
		
		levels.push(new LevelInfo(levels.length +1,
			"dublicate string", duplicateString));*/
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
	static function getTheThirdElement(inputString:String):String
	{
		return inputString.charAt(2);
	}
	static function getTheBlackElement(inputString:String):String
	{
		return "k";
	}
	static function getTheBlueElement(inputString:String):String
	{
		return "b";
	}
	static function getTheRedElement(inputString:String):String
	{
		return "r";
	}
	

	
}