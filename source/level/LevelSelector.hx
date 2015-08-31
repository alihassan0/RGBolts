package level;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxBitmapTextField;
import flixel.text.pxText.PxBitmapFont;
import flixel.text.pxText.PxTextAlign;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxPoint;
import openfl.Assets;

using flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author ...
 */
class LevelSelector extends FlxState
{
	public var textDiscription:FlxBitmapTextField;
	public static var icons :Array<LevelIcon>;
	public static var selectedLevel:Int;
	public static var moveLeft:FlxButton;
	public static var moveRight:FlxButton;
	override public function create():Void 
	{
		GlobalVars.levelselector = this;
		FlxG.camera.antialiasing = true;		
		moveLeft = new FlxButton(0, 0, "Left", Left);
		moveRight = new FlxButton(FlxG.width-100, 0, "Right", Right);
		add(moveLeft);
		add(moveRight);
		selectedLevel = 0;
		var sprite:FlxSprite = new FlxSprite(150,0,"assets/images/Levels.png");
		sprite.scale.set(.5,.5);
		//add(sprite);
		bgColor = 0xffafe4e5;
		GlobalVars.loadLevels();
		addDiscription();
		icons = new Array<LevelIcon>();
		for (i in 0...GlobalVars.levels.length)
		{
			icons.push(new LevelIcon(0, 0, i+1,textDiscription));
		}
		for (i in 0...icons.length)
		{
			
			if (i == 2)
				icons[i].color = FlxColor.AZURE;
			if (i == 3)
				icons[i].color = FlxColor.YELLOW;
			if (i == 1)
				icons[i].color = FlxColor.GREEN;
			if (i == 0)
				icons[i].color = FlxColor.RED;
				
			if (i < selectedLevel)
				icons[i].unfocusLeft(true);
			if (i == selectedLevel)
				icons[i].focus(true);
			if (i > selectedLevel)
			icons[i].unfocusRight(true);
		}
		FlxG.state.members.remove(icons[selectedLevel + 1]);
		FlxG.state.members.push(icons[selectedLevel + 1]);
		FlxG.state.members.remove(icons[selectedLevel]);
		FlxG.state.members.push(icons[selectedLevel]);
		var t:FlxBitmapTextField = new FlxBitmapTextField(GlobalVars.font);
		t.text = "hello text";
		//add(t);
	}
	
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(150, 350, "assets/images/discreptionPanel.png");
		discription.scale.set(1.5,1.5);
		/*new FlxSprite(0,420).makeGraphic(640,50,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		discription.drawRoundRect(offset, offset, discription.width -2*offset, discription.height - 2*offset, 15, 15, FlxColor.WHEAT);*/
		var offset:Int = -100;
		add(discription);
		
		textDiscription = new FlxBitmapTextField(GlobalVars.font);
		textDiscription.reset(discription.x + offset , discription.y );
		textDiscription.useTextColor = false;
		textDiscription.color = 0xFFFFFF;
		textDiscription.fontScale = .5;
		textDiscription.text = "blah..blah";
		add(textDiscription);
	}
	
	public function updateDescription():Void
	{
		textDiscription.text = selectedLevel + 1 + " " +GlobalVars.levels[selectedLevel].description;
	}
	function Left():Void
	{
		if (selectedLevel == 0)
			return;
			
		
		icons[selectedLevel].unfocusRight(false);
		selectedLevel--;
		FlxG.state.members.remove(icons[selectedLevel + 1]);
		FlxG.state.members.push(icons[selectedLevel + 1]);
		FlxG.state.members.remove(icons[selectedLevel]);
		FlxG.state.members.push(icons[selectedLevel]);
		icons[selectedLevel].focus(false);
		updateDescription();
	}
	function Right():Void
	{
		if (selectedLevel == icons.length-1)
			return;
			
			
		icons[selectedLevel].unfocusLeft(false);
		selectedLevel++;
		if (selectedLevel < icons.length - 1)
		{
		FlxG.state.members.remove(icons[selectedLevel + 1]);
		FlxG.state.members.push(icons[selectedLevel + 1]);
		FlxG.state.members.remove(icons[selectedLevel]);
		FlxG.state.members.push(icons[selectedLevel]);
		}
		icons[selectedLevel].focus(false);
		updateDescription();
	}
	
}