package level;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;
import openfl.Assets;

using flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author ...
 */
class LevelSelector extends FlxState
{
	public var textDiscription:FlxBitmapText;
	override public function create():Void 
	{
		FlxG.camera.antialiasing = true;
		
		var sprite:FlxSprite = new FlxSprite(150,0,"assets/images/levelSelector/Levels.png");
		sprite.scale.set(.5,.5);
		//add(sprite);
		bgColor = 0xffafe4e5;
		GlobalVars.loadLevels();
		addDiscription();
		for (i in 0...7)
		{
			new LevelIcon(30+ (i%5)*110, 30+Math.floor(i/5)*100, i+1,textDiscription);
		}
		var t:FlxBitmapText = new FlxBitmapText(GlobalVars.font);
		t.text = "hello text";
		//add(t);
		
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(50, 350, "assets/images/levelSelector/discreptionPanel.png");
		//discription.scale.set(1.5,1.5);
		/*new FlxSprite(0,420).makeGraphic(640,50,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		discription.drawRoundRect(offset, offset, discription.width -2*offset, discription.height - 2*offset, 15, 15, Reg.WHEAT);*/
		var offset:Int = 20;
		add(discription);
		
		textDiscription = new FlxBitmapText(GlobalVars.font);
		textDiscription.reset(discription.x + offset , discription.y + offset );
		textDiscription.useTextColor = false;
		textDiscription.color = 0xFFFFFF;
		textDiscription.width = 300;
		textDiscription.multiLine = true;
		textDiscription.scale.set(.3,.3);
		textDiscription.text = "level descreption";
		add(textDiscription);
	}
	
}