package ;
import seq.*;
import level.*;
import flixel.util.FlxPoint;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxRect;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import util.*;
using flixel.util.FlxSpriteUtil;
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
	private static var spriteHighlighter:FlxSprite;
	
	public static var curruntHint:Int = 0;
	public static var exists:Bool = true;
	public static var TutTimer:FlxTimer;

	public static var RunBtnSignal:Int = 4;
	public static var triggers:Map<String, Array<Int>> =
    [
      "runBtn"=>[4,9,14],
      "resetBtn"=>[6,11],
      "directional_click"=>[7],
      "directional_place"=>[8],
      "directional_rotate"=>[13],
      "first_test"=>[14]
    ];
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

		TutTimer = new FlxTimer();

		spriteHighlighter = new FlxSprite(0,0);
		FlxG.state.add(spriteHighlighter);

	}
	public static function showHelpPanelAtSprite(s:FlxSprite,text:String,direction:Direction, ?showNextBtn:Bool = false)
	{
		var panelHeight:Float = Math.floor(((1+Math.floor(text.length/25))*24)+ helpNextButton.height + 4);
		var panelwidth:Float = 200;
		switch (direction) {
			case Direction.right:
				showHelpPanelAtPos(new FlxPoint(s.x + s.width,s.y - panelHeight/2),text,showNextBtn);
			case Direction.left:
				showHelpPanelAtPos(new FlxPoint(s.x - panelwidth,s.y - panelHeight/2),text,showNextBtn);
			case Direction.down:
				showHelpPanelAtPos(new FlxPoint(s.x + s.width/2 - panelwidth/2,s.y +s.height),text,showNextBtn);
			case Direction.up:
				showHelpPanelAtPos(new FlxPoint(s.x + s.width/2 - panelwidth/2,s.y - panelHeight),text,showNextBtn);
		}

		var lineStyle = { color: FlxColor.GRAY, thickness: 8.0 };
		var fillStyle = { color: FlxColor.TRANSPARENT, alpha: 0.0 };
		spriteHighlighter.makeGraphic(Math.floor(s.width),Math.floor(s.height),FlxColor.TRANSPARENT);
		spriteHighlighter.drawRoundRect(0, 0, s.width, s.height, 4, 4, 0x00000000,lineStyle,fillStyle);
		spriteHighlighter.reset(s.x,s.y);

		spriteHighlighter.scale.set(2,2);
		FlxTween.tween(spriteHighlighter.scale, {x:1.2,y:1.2}, .66, {ease:FlxEase.circOut});
		
	}
	public static function showHelpPanelAtPos(p:FlxPoint,text:String,showNextBtn:Bool)
	{
		helpText.text = text;
		helpPanel.makeGraphic(Math.floor(helpText.width),Math.floor(((1+Math.floor(text.length/25))*24) + helpNextButton.height + 4),0xff000000);

		helpText.reset(p.x , p.y);
		helpPanel.reset(p.x , p.y);
		spriteHighlighter.reset(FlxG.width,FlxG.height);
		if(showNextBtn)
			helpNextButton.reset(p.x + Math.floor((helpPanel.width-helpNextButton.width)/2),p.y+ helpPanel.height - 2 - helpNextButton.height);
		else
			helpNextButton.visible = false;
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
	public static function showNextTip():Void {
		switch (curruntHint ) {
			case 0:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.inputBlock,"this is the input block  ",Direction.right,true);
			case 1:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.outputBlock,"this is the output block  ",Direction.left,true);
			case 2: 
				TutVars.showHelpPanelAtPos(new FlxPoint(130,130),"your job is to direct bolts from the input block to the output block       ", true);
			case 3: 
				TutVars.showHelpPanelAtSprite(GlobalVars.level.runBtn, "now press the run runBtn  ",Direction.down,false);
			case 4:
				TutVars.showHelpPanelAtPos(new FlxPoint(FlxG.width,FlxG.height),"", true);
				TutTimer.start(4, showNextTipTimed , 1); 
			case 5:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.resetBtn,"now press the resetBtn", Direction.down,true);
			case 6:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.blockSourcesGroup.members[0],"now drag this block", Direction.left,false);
			case 7:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.getGrid()[7][3],"into here ", Direction.up,false);
			case 8:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.runBtn, "now press runBtn  ",Direction.down,false);
			case 9:
				TutVars.showHelpPanelAtPos(new FlxPoint(FlxG.width,FlxG.height),"", true);
				TutTimer.start(10, showNextTipTimed , 1); 
			case 10:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.resetBtn, "press reset button again",Direction.down,false);
			case 11:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.getGrid()[7][3], "now rotate the block by clicking on it ",Direction.down,false);
				TutTimer.start(3, showNextTipTimed , 1);
			case 12:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.getGrid()[7][3], "make sure it is facing downwards",Direction.down,false);
			case 13:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.runBtn, "now press the run btn one more time", Direction.down,false);
			case 14:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.speedUp,  "press this to speed up", Direction.right,false);
		}
		curruntHint ++;
	}
	public static function showNextTipTimed(?timer:FlxTimer):Void {
		showNextTip();	
	}
}