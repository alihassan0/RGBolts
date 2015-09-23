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
      "runBtn"=>[4,9,14,17],
      "resetBtn"=>[6,11],
      "directional_click"=>[7],
      "directional_place"=>[8],
      "directional_customize"=>[13],
      "arrow_down"=>[16],
      "test_passed"=>[18],
      "speeedBtn"=>[20]
    ];
	public static function initHelpPanel()
	{
		helpPanel = new FlxSprite();
		GlobalVars.level.gui.tutGroup.add(helpPanel);
		
		helpText = new FlxText(0,0,200).setFormat(null, 16 , 0xffffff,"center");
		GlobalVars.level.gui.tutGroup.add(helpText);

		helpNextButton = new FlxButton(0, 0, "next",showNextTip);
		GlobalVars.level.gui.tutGroup.add(helpNextButton);

		TutTimer = new FlxTimer();

		spriteHighlighter = new FlxSprite(0,0);
		GlobalVars.level.gui.tutGroup.add(spriteHighlighter);

	}
	public static function showHelpPanelAtSprite(s:FlxSprite,text:String,direction:Direction, ?showNextBtn:Bool = false)
	{
		helpText.text = text;
		helpText.drawFrame(true);

		var panelHeight:Float = helpText.height + helpNextButton.height + 4;
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

		var lineStyle = { color: 0xFF333333, thickness: 8.0 };
		var fillStyle = { color: 0x00000000};
		spriteHighlighter.makeGraphic(Math.floor(s.width),Math.floor(s.height),FlxColor.TRANSPARENT,true);
		spriteHighlighter.drawRoundRect(0, 0, s.width, s.height, 10, 10, 0x00000000,lineStyle,fillStyle);
		spriteHighlighter.reset(s.x,s.y);

		spriteHighlighter.scale.set(2,2);
		FlxTween.tween(spriteHighlighter.scale, {x:1.2,y:1.2}, .66, {ease:FlxEase.circOut});
	}
	public static function showHelpPanelAtPos(p:FlxPoint,text:String,showNextBtn:Bool)
	{
		helpText.text = text;
		helpText.drawFrame(true);
		var panelHeight:Float = helpText.height + helpNextButton.height + 4;
		helpPanel.makeGraphic(Math.floor(helpText.width),Math.floor(panelHeight),0xff000000);

		helpText.reset(p.x , p.y);
		helpPanel.reset(p.x , p.y);
		spriteHighlighter.reset(FlxG.width,FlxG.height);
		if(showNextBtn)
		{
			helpNextButton.reset(p.x + Math.floor((helpPanel.width-helpNextButton.width)/2),p.y+ helpPanel.height - 2 - helpNextButton.height);
			helpNextButton.visible = true;
		}
		else
			helpNextButton.visible = false;
	}
	public static function checkForTutorial(key:String)
	{
		trace(key + "    " + curruntHint);
		if(TutVars.exists && TutVars.triggers[key].indexOf(TutVars.curruntHint)!= -1)
			TutVars.showNextTip();
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
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.runBtn, "now press the run runBtn  ",Direction.down,false);
				GlobalVars.runButttonEnabled = true;
			case 4:
				TutVars.showHelpPanelAtPos(new FlxPoint(FlxG.width,FlxG.height),"", true);
				TutTimer.start(2, showNextTipTimed , 1); 
				GlobalVars.runButttonEnabled = false;
			case 5:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.resetBtn,"now press the resetBtn", Direction.down,false);
				GlobalVars.resetButttonEnabled = true;
			case 6:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.blockSourcesGroup.members[0],"now drag this block", Direction.right,false);
				GlobalVars.resetButttonEnabled = false;
				GlobalVars.blocksCreatingEnabled = true;
			case 7:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.getGrid()[7][3],"into here ", Direction.up,false);
			case 8:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.runBtn, "now press runBtn  ",Direction.down,false);
				GlobalVars.runButttonEnabled = true;
				GlobalVars.blocksCreatingEnabled = false;
			case 9:
				TutVars.showHelpPanelAtPos(new FlxPoint(FlxG.width,FlxG.height),"", true);
				TutTimer.start(2, showNextTipTimed , 1);
				GlobalVars.runButttonEnabled = false;
			case 10:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.resetBtn, "press reset button again",Direction.down,false);
				GlobalVars.resetButttonEnabled = true;
			case 11:
				TutVars.showHelpPanelAtPos(new FlxPoint(130,130), "the block now directs the seq upwards \n we need to change that ",true);
			case 12:
				TutVars.showHelpPanelAtSprite(GlobalVars.gameGrid.getGrid()[7][3], "now click on the block again",Direction.up,false);
				GlobalVars.customizationEnabled = true;
			case 13:
				TutVars.showHelpPanelAtSprite(GlobalVars.customizationPanel.background, " this is called the customization panel",Direction.left,true);
			case 14:
				TutVars.showHelpPanelAtSprite(GlobalVars.customizationPanel.customizableBlock, "you can use this to customize any block you add ",Direction.left,true);
			case 15:
				TutVars.showHelpPanelAtSprite(GlobalVars.customizationPanel.customizableBlock.arrows[0], "so now drag this arrow to point down",Direction.left,false);
				GlobalVars.arrowDraggingEnabled = true;
			case 16:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.runBtn, "now press runBtn for the final time ",Direction.down,false);
				GlobalVars.runButttonEnabled = true;
				GlobalVars.arrowDraggingEnabled = false;
			case 17:
				TutVars.showHelpPanelAtPos(new FlxPoint(FlxG.width,FlxG.height),"", true);
				GlobalVars.runButttonEnabled = false;
			case 18:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.inputTests[0], "congrats you passed the first test",Direction.right,true);
			case 19:
				TutVars.showHelpPanelAtSprite(GlobalVars.level.gui.speedUp, "you can use the speedBtn to speed the seqs up",Direction.left,false);
			case 20:
				TutVars.showHelpPanelAtPos(new FlxPoint(FlxG.width,FlxG.height),"", true);
				
		}
		curruntHint ++;
	}
	public static function showNextTipTimed(?timer:FlxTimer):Void {
		showNextTip();	
	}
}