package level;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;
import openfl.Assets;

import util.BitmapText;

using flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author ...
 */
class LevelSelector extends FlxState
{
	public var textDiscription:BitmapText;
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
		
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(50, 350, "assets/images/levelSelector/discreptionPanel.png");
		add(discription);
		
		var offset:Int = 20;
		textDiscription = new BitmapText(GlobalVars.font);
		textDiscription.setPosition(discription.x +offset, discription.y +offset );
		
		textDiscription.changeText("level descreption");
		add(textDiscription);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}	
	
}