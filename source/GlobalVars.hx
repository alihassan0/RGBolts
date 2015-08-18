package ;
import seq.*;
import level.*;
import flixel.util.FlxPoint;
import flixel.text.FlxBitmapTextField;
import flixel.text.pxText.PxBitmapFont;
import flixel.text.pxText.PxTextAlign;
import openfl.Assets;
import flixel.util.FlxSave;
import blocks.*;
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

	public static var font:PxBitmapFont; 
	public static var stepDuration:Float = 0;//same as moveDuration but only at the beginnning of any move .. i couldn't come up with a better name :"|
	public static var maxVisibleElemesInSeq : Int = 3;

	public static var save:FlxSave;

	public static var blocksMap:Map<Int, Class<Dynamic>> =
    [
   		   	0=> DirectionalBlock,
   		   	1=> IteratorBlock,
			2=> GrouperBlock,
			3=> FilterBlock,
			4=> FilterBlock,
			5=> FilterBlock,
			6=> WaiterBlock,
			7=> DuplicatorBlock,
			8=> SignalBlock,
			9=> InputBlock,
			10=> OutputBlock
    ];
	public static function loadLevels()
	{
		xml = Xml.parse(openfl.Assets.getText("assets/data/queries.xml"));
	    
		levels = new Array<LevelInfo>();

		loadFonts();
		//********************************ali' levels***************************************************
		//-------------------------------level 1: -------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"direct the seq to the output block", checkSame,
			["rgb","rrr","grg","rgr","rrgrr"],
			new FlxPoint(0,3),new FlxPoint(7,6),0));

		//--------------------------------level 2 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the third element only", getTheThirdElement,
			["ggg","rrr","grg","rgr","rrgrr"],null,null,1));

		//--------------------------------level 3 :  ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"output the red element in the sequence", getTheRedElement,
			["r","ggr","grg","gggr","gggggggr"],null,null,2));

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
			"output rest of the element after the first  green and red elements", getElementsAfterFirstRedAndGreen,
			["rgbbb","rbgbgr","gbrrbgg","brgrgrg","gggrrrbbb"],null,null,6));

		//********************************sayegh levels***************************************************
		//--------------------------------level 8 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"moveBlueToEnd", moveBlueToEnd,
			["bgbg","bgg","gbrr","bgbg","rbrgr"],new FlxPoint(0,3),new FlxPoint(7,6),6, "Right here"));
		
		//--------------------------------level 9 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"Only 3 Blues", OutputThreeBluesOnly,
			["bgbbr", "bgbgrb", "gbbbbgg", "bgbbgb", "bgbrbb"], null, null, 6));
			
		//--------------------------------level 10 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"Reverse", reverse,
			["bgbgr","bgbgrg","gbrbgg","bgbggb","rgbrgr"],null,null,6));
			
		//--------------------------------level 11 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"Green then blue No red", greenThenBlueNoRed,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		//--------------------------------level 12 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"Remove al first characters", removeFirstCharacter,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
			
		
			
		
		
		//--------------------------------level 7 : ---------------------------------------------------
		/*levels.push(new LevelInfo(levels.length +1,
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

			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
			//--------------------------------level 8 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getFirstTwoElementsReversed", getFirstTwoElementsReversed,
			["bgbgr","bggbgrg","gbrrbgg","bgbggb","rgbrgbrgr"],null,null,6));
		
		//--------------------------------level 7 : ---------------------------------------------------
		levels.push(new LevelInfo(levels.length +1,
			"getFirstFourElementsEvenThenOdd", getFirstFourElementsEvenThenOdd,
			["bgbgr", "bggbgrg", "gbrrbgg", "bgbggb", "rgbrgbrgr"], null, null, 6));
			*/
		
			

		/*groupAllElementsBeforeBlue
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
		

		//---------------------------changelog------------------------
		//fix the remove first block
		//only be able to change speed at the start of each move
		//maintain the same offset through all speed
		//fix all operation for seqs
		//add seq highlighting
		
		
 
		//-------------------------improvements------------------------------
		//change background in play mode .. add tutrial for each level
		//.. allow to add more private tests
		// add a title for each level containg it's name 
		//in gamegrid make the seq tween between states
		//fix the sprite of signal source ..
		//add major UI improvements
		//show more suitable stats after each level
		//make a block flicker when there it affect a seq
	
		//before sorting we should do some fitering to introduce the remove first block and the 
		//iteration ideas .
		//insert the blue elemnt;

		/*levels.push(new LevelInfo(levels.length +1,
			"output the yellow color", getTheYellowElement));
		
		levels.push(new LevelInfo(levels.length +1, 
			"sort red first then green then black", sortRedThenGreen));
		
		levels.push(new LevelInfo(levels.length +1,
			"dublicate string", duplicateString));

		switch each two elememts*/
		
		//-----------------------------------known bugs-----------------------------------
		// fix text offset
		//## handle changing speed .. it screws everything up .
		//trigger affect seq after it reach it's distination (done .. but i am not confident of the currunt implementation )
		//reset disabled blocks every replay
		//if all seqs are gone .. this should be a valid answer ??
		//if all seqs are gone .. don't recreate new one's (make new one's)
		//don't declare a winner when there are still some seqs on the grid
		//-------------------------------------sets----------------------------------------
		//filtering
		//colors
		//checking 
		//insertion
	}
	private static function loadFonts()
	{
		var textBytes = Assets.getText("assets/fonts/font.fnt");
		var XMLData = Xml.parse(textBytes);
		font = new PxBitmapFont().loadAngelCode(Assets.getBitmapData("assets/fonts/font.png"), XMLData);
	}
	public static function getLevelIntro(index:Int):String
	{
		var i:Int = 0;
		for(child in xml.elements() ) {
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
	static function getElementsAfterFirstRedAndGreen(inputString:String):String
	{
        var i:Int = Std.int(Math.max(inputString.indexOf("r"),inputString.indexOf("g")));
        return inputString.substring(i+1,inputString.length);
    }
	
	 static function moveBlueToEnd(inputString:String):String
	{
		if (inputString.length == 0)
			return "";
		
		if (inputString.charAt(0) == "b"){
			return  moveBlueToEnd(inputString.substring(1)) + "b";
		}else{
			return inputString.charAt(0) +	moveBlueToEnd(inputString.substring(1));
		}
	}
	static function OutputThreeBluesOnly(_):String
	{
		return "bbb";	
	}
	
	static function reverse(inputString:String):String
	{
		if (inputString.length == 0)
			return "";
		return reverse(inputString.substring(1)) + inputString.charAt(0);
		
	}
	
	static function greenThenBlueNoRed(inputString:String):String
	{
		if (inputString.length == 0)
			return "";
		
		if (inputString.charAt(0) == "b"){
			return  moveBlueToEnd(inputString.substring(1) + "b");
		}	
		if (inputString.charAt(0) == "g"){
			return "g" + moveBlueToEnd(inputString.substring(1));
		}
		if (inputString.charAt(0) == "r"){
			return moveBlueToEnd(inputString.substring(1));
		}
		
		return null;
	}
	
	static function removeFirstCharacter(input:String):String
	{
		var firstCharacter = input.charAt(0);
		var solution = "";
		for (i in 0 ... input.length)
		{
			if(input.charAt(i)==firstCharacter){
				continue;
			}else{
				solution += input.charAt(i);
			}
		}
		
		return solution;
	}

}