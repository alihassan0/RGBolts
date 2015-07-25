package ;
import seq.*;
import level.*;
import flixel.util.FlxPoint;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxRect;
import flixel.text.FlxText;

import flixel.plugin.MouseEventManager;
/**
 * ...
 * @author ...
 */
class TutVars
{
	private static var sprites:Array<FlxSprite>;
	private static var spriteColor:Int = 0xCC888888;
	private static var helpPanel:FlxSprite;
	private static var helpText:FlxText;
	public static function initSprites()
	{
		sprites = new Array<FlxSprite>();
		var sprite:FlxSprite;
		for (i in 0 ... 4) {
			sprite = new FlxSprite(0,0);
			GlobalVars.level.tutGroup.add(sprite);
			sprites.push(sprite);
			MouseEventManager.add(sprite, onDown, null, null, null);
		}
	}
	public static function initHelpPanel()
	{
		helpPanel = new FlxSprite();
		FlxG.state.add(helpPanel);
		
		helpText = new FlxText(0,0,200,"",8);
		FlxG.state.add(helpText);
	}
	public static function showHelpPanel(s:FlxSprite,text:String)
	{
		helpText.text = text;
		helpPanel.makeGraphic(Math.floor(helpText.width),Math.floor(helpText.height),0xff00ff00);
		trace(helpText.textField.height);
	}
	public static function focusOn(rect:FlxSprite)
	{
		//up
		/*sprites[0].makeGraphic(FlxG.width,FlxG.height,spriteColor);
		sprites[0].reset(0,0);
		GlobalVars.level.blocksGroup.remove(rect,true);
		GlobalVars.level.tutGroup.add(rect);*/
		//up
		sprites[0].makeGraphic(FlxG.width,Math.floor(rect.y),spriteColor);
		sprites[0].reset(0,0);
		//down
		sprites[1].makeGraphic(FlxG.width,FlxG.height-Math.floor(rect.height+rect.y),spriteColor);
		sprites[1].reset(0,rect.height+rect.y);
		
		//right
		sprites[2].makeGraphic(Math.floor(rect.x),Math.floor(rect.height),spriteColor);
		sprites[2].reset(0,rect.y);
		
		//left
		sprites[3].makeGraphic(FlxG.width - Math.floor(rect.x+rect.width),Math.floor(rect.height),spriteColor);
		sprites[3].reset(rect.width+rect.x,rect.y);
	}
	static function onDown(Sprite:FlxSprite) 
	{
		trace("clicked on me ");
	}
}