package level;
import flixel.FlxState;
import flixel.text.FlxBitmapTextField;
import flixel.text.pxText.PxBitmapFont;
import flixel.text.pxText.PxTextAlign;
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
	public var textDiscription:FlxBitmapTextField;
	override public function create():Void 
	{
		var sprite:FlxSprite = new FlxSprite(150,0,"assets/images/Levels.png");
		sprite.scale.set(.5,.5);
		//add(sprite);
		bgColor = 0xffafe4e5;
		GlobalVars.loadLevels();
		addDiscription();
		for (i in 0...GlobalVars.levels.length)
		{
			new LevelIcon(30+ (i%5)*110, 30+Math.floor(i/5)*100, i+1,textDiscription);
		}
		var t:FlxBitmapTextField = new FlxBitmapTextField(GlobalVars.font);
		t.text = "hello text";
		//add(t);
		
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(240, 450, "assets/images/discreptionPanel.png");
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
	
}