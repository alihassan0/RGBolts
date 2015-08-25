package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
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

	public function new(X:Float=0, Y:Float=0 ,id :Int, inputString:String , outputString:String) 
	{
		super(X, Y);
		makeGraphic(100,80,0x00000000,true);
		this.inputString = inputString;
		this.id = id;
		drawRoundRect(0, 0, 100, 80, 15, 15, FlxColor.WHEAT);
		GlobalVars.level.panelsGroup.add(this);
		text = new FlxText(x , y ,width, "")
							.setFormat(null, 10 , 0x9C9F84,"center");
		text.text = "i : "+inputString+" \n\n o : "+outputString+" \n\n s : 'untested' \n\n";
		GlobalVars.level.panelsGroup.add(text);
		
		MouseEventManager.add(this, onDown, null, null, null,true);
	}
	public function onDown(Sprite:FlxSprite) 
	{
		if(!GlobalVars.level.isRunning)
		{
			selected = true;
			showSelection();
		}
	}
	public function setState(state:Int)
	{
		//TODO chage the state text to the new State
		this.state = state;
		switch (state) {
			case 0: color = FlxColor.WHEAT;//untested
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
			lineStyle = { color: FlxColor.WHEAT, thickness:  4.0 };
			alpha = 1;
		}
		drawRoundRect(0, 0, 100, 80, 15, 15, FlxColor.TRANSPARENT,lineStyle);
	}
}