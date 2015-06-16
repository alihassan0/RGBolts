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
	
	public static var xml : Xml;
	public static function loadLevels()
	{
		xml = Xml.parse(openfl.Assets.getText("assets/data/queries.xml"));
	    
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
			["r","ggr","grg","gggr","gggggr"],null,null,2));

		//--------------------------------level 4 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the blue element in the sequence", getTheBlueElement,
			["b","ggb","gbg","gggb","gggggb"],null,null,3));

		//--------------------------------level 5 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output rest of the element after the first blue", getElementsAfterBlueElement,
			["bgb","ggbgrg","gbrrgg","bgggb","rgrgbrgr"],null,null,4));


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




		

		
 

		//change background in play mode .. add tutrial for each level
		//.. allow to add more private tests
		// add a title for each level containg it's name 
		//in gamegrid make the seq tween between states
		//fix the sprite of signal source ..
		//add major UI improvements

		// a GREAT design question .. should i be able to redirect signal blocks or not.

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
	public static function getLevelIntro(index:Int):String
	{
		var i:Int = 0;
		for(child in xml.elements() ) {
	    	/*trace(child);
	    	trace("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");*/
	    	if(index != i)
	    	i++;
	    	else
	    	{
	    		return child.firstChild().nodeValue;
	    	}
		}
		return null;
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
	static function getElementsAfterBlueElement(inputString:String):String
	{
		return inputString.substring(inputString.indexOf('b')+1,inputString.length);
	}	
}