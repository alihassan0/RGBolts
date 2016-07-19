package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;


using flixel.util.FlxSpriteUtil;

/**
 * ...			
 * @author ...
 */
class InputTest extends FlxSprite
{
	private var levelNumbertxt:FlxText;
	public var id:Int;
	public var state:Int = 0;
	private var text:FlxText;
	public var selected:Bool;
	public var inputString:String;
	public var cycles:Int;
	public function new(X:Float=0, Y:Float=0 ,id :Int, inputString:String , outputString:String) 
	{
		super(X, Y);
		makeGraphic(100,80,FlxColor.TRANSPARENT,true);
		this.inputString = inputString;
		this.id = id;
		cycles = 0;
		drawRoundRect(0, 0, 100, 80, 15, 15, Reg.backgroundColor);
		GlobalVars.level.gui.panelsGroup.add(this);
		text = new FlxText(x , y ,width, "")
							.setFormat(Reg.font, 12 , 0x9C9F84);

		var red = new FlxTextFormat(FlxColor.RED, false, false, FlxColor.TRANSPARENT);
		var green = new FlxTextFormat(0x009933, false, false, FlxColor.TRANSPARENT);
		var blue = new FlxTextFormat(FlxColor.BLUE, false, false, FlxColor.TRANSPARENT);
		inputString = StringTools.replace(inputString,"r","*r*");
		inputString = StringTools.replace(inputString,"g","_g_");
		inputString = StringTools.replace(inputString,"b","$b$");

		outputString = StringTools.replace(outputString,"r","*r*");
		outputString = StringTools.replace(outputString,"g","_g_");
		outputString = StringTools.replace(outputString,"b","$b$");

		text.applyMarkup(" i : "+inputString+"\no : "+outputString+"\n s : 'untested' \n", [
			new FlxTextFormatMarkerPair(red, "*"),
			new FlxTextFormatMarkerPair(green, "_"),
			new FlxTextFormatMarkerPair(blue, "$")]);

		GlobalVars.level.gui.panelsGroup.add(text);	
		FlxMouseEventManager.add(this, onDown, null, null, null,true);
	}
	public function onDown(Sprite:FlxSprite) 
	{
		if(!GlobalVars.level.isRunning && GlobalVars.inputTestsEnabled)
		{
			selected = true;
			showSelection();
		}
		//trace(GlobalVars.inputTestsEnabled);
	}
	public function setState(state:Int)
	{
		//TODO chage the state text to the new State
		this.state = state;
		switch (state) {
			case 0: color = Reg.backgroundColor;//untested
			case 1: color = FlxColor.GREEN;//test passed
			case 2: color = FlxColor.RED;//test failed
		}
	} 
	public function showSelection() 
	{
		var lineStyle;
		if(selected)
		{
			GlobalVars.level.selectedInputTest = this;
			GlobalVars.level.resetTestCases();
			lineStyle = { color: FlxColor.YELLOW, thickness: 4.0 };
			alpha =.6;
		}
		else
		{
			lineStyle = { color: Reg.backgroundColor, thickness:  4.0 };
			alpha = 1;
		}
		drawRoundRect(0, 0, 100, 80, 15, 15, FlxColor.TRANSPARENT,lineStyle);
	}
}