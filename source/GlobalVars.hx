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
	
	public static var moveDuration : Float = 0;


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
		
		//--------------------------------level 6 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output rest of the element after the second blue", getElementsAfterSecondBlueElement,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,4));

		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output rest of the element after the second blue", groupAllElementsBeforeBlue,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));

		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getFirstTwoElementsReversed", getFirstTwoElementsReversed,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getFirstFourElementsEvenThenOdd", getFirstFourElementsEvenThenOdd,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getFirstElementTwice", getFirstElementTwice,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getFirstTwoElementsTwice", getFirstTwoElementsTwice,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"duplicateAllElementsExceptTheLastOne", duplicateAllElementsExceptTheLastOne,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"reverseAllElementsExceptTheLastOne", reverseAllElementsExceptTheLastOne,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getEvenElementsOnly", getEvenElementsOnly,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		







		/*

groupAllElementsBeforeBlue
getFirstTwoElementsReversed
getFirstFourElementsEvenThenOdd
getFirstElementTwice
getFirstTwoElementsTwice
duplicateAllElementsExceptTheLastOne
reverseAllElementsExceptTheLastOne*/
		

		//#3 output the black block;

		//--------------------------------level 4 :  ---------------------------------------------------
		/*levels.push(new LevelInfo(levels.length +1,
			"output the black element only", getTheBlackElement,
			["ggbg","rbrr","grgb","rbgr","rrbgrr"]));
		
		levels.push(new LevelInfo(levels.length +1,
			"output the last element before black", getElementBeforeLast,
			["r","ggr","grg","gggb","gggggb"]));*/


		//made directional signals
		

		

		
 

		//change background in play mode .. add tutrial for each level
		//.. allow to add more private tests
		// add a title for each level containg it's name 
		//in gamegrid make the seq tween between states
		//fix the sprite of signal source ..
		//add major UI improvements
		//show more suitable stats after each level

	
		//before sorting we should do some fitering to introduce the remove first block and the 
		//iteration ideas .
		//insert the blue elemnt;

		/*levels.push(new LevelInfo(levels.length +1,
			"output the yellow color", getTheYellowElement));
		
		levels.push(new LevelInfo(levels.length +1, 
			"sort red first then green then black", sortRedThenGreen));
		
		levels.push(new LevelInfo(levels.length +1,
			"dublicate string", duplicateString));*/

		//known bugs
		//trigger affect seq after it reach it's distination
		//reset disabled blocks every replay
		//if all seqs are gone .. this should be a valid answer
		//if all seqs are gone .. don't recreate new one's 
		//sets
		//filtering
		//colors
		//checking 
		//insertion
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
	static function getElementsAfterSecondBlueElement(inputString:String):String	
	{
		return inputString.substring(inputString.indexOf
				('b',inputString.indexOf('b')+1)+1,inputString.length);
	}
	static function groupAllElementsBeforeBlue(inputString:String):String	
	{
		return inputString.substring(0,inputString.indexOf('b'));
	}
	static function getFirstTwoElementsReversed(inputString:String):String	
	{
		return inputString.charAt(1)+inputString.charAt(0)+"";
	}
	static function getFirstFourElementsEvenThenOdd(inputString:String):String	
	{
		return inputString.charAt(0)+inputString.charAt(2)+inputString.charAt(1)+inputString.charAt(3)+"";
	}
	static function getFirstElementTwice(inputString:String):String	
	{
		return inputString.charAt(0)+inputString.charAt(0)+"";
	}
	static function getFirstTwoElementsTwice(inputString:String):String	
	{
		return inputString.charAt(0)+inputString.charAt(0)+"";
	}
	static function duplicateAllElementsExceptTheLastOne(inputString:String):String	
	{
		var res:String = "";
		for (i in 0 ... inputString.length-1) 
		{
			res += inputString.charAt(i);
			res += inputString.charAt(i);
		}
		return res;
	}
	static function reverseAllElementsExceptTheLastOne(inputString:String):String	
	{
		var res:String = "";
		for (i in 0 ... inputString.length) 
		{
			res += inputString.charAt(inputString.length -2 - i);
		}
		return res;
	}
	static function getEvenElementsOnly(inputString:String):String	
	{
		var res:String = "";
		for (i in 0 ... inputString.length) 
		{
			if(i%2 == 0)
			res += inputString.charAt(i);
		}
		return res;
	}

}