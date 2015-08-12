package ;
import seq.*;
import level.*;
import flixel.util.FlxPoint;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxRect;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
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
	private static var helpNextButton:FlxButton;
	private static var curruntHint:Int = 0;
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
		
		helpText = new FlxText(0,0,200).setFormat(null, 16 , 0xffffff,"center");
		FlxG.state.add(helpText);

		helpNextButton = new FlxButton(0, 0, "next",showNextTip);
		FlxG.state.add(helpNextButton);
	}
	public static function showHelpPanel(s:FlxSprite,text:String)
	{
		helpText.text = text;
		helpPanel.makeGraphic(Math.floor(helpText.width),Math.floor(((1+Math.floor(text.length/25))*24) + helpNextButton.height + 4),0xff000000);

		helpText.reset(s.x+s.width,s.y + s.height);
		helpPanel.reset(s.x+s.width,s.y + s.height);
		helpNextButton.reset(s.x+s.width + Math.floor((helpPanel.width-helpNextButton.width)/2),s.y + s.height + helpPanel.height - 2 - helpNextButton.height);
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
	public static function showNextTip() {
		switch (curruntHint ) {
			case 0:
				TutVars.showHelpPanel(GlobalVars.gameGrid.inputBlock,"this is the input block  ");
			case 1:
				TutVars.showHelpPanel(GlobalVars.gameGrid.outputBlock,"this is the output block  ");
		}
		curruntHint ++;
	}
}