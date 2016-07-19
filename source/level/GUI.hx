package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import customizationPanel.*;
import blocks.*;
import util.*;


using GUI.ButtonExtender;
using flixel.util.FlxSpriteUtil;

class GUI 
{
	public var gridGroup:FlxGroup;
	public var blocksBasesGroup:FlxGroup;
	public var seqGroup:FlxGroup;
	public var blocksGroup:FlxGroup;
	public var panelsGroup:FlxGroup;
	public var blockSourcesGroup:FlxTypedGroup<FlxSprite>;
	public var guiGroup:FlxGroup;
	public var menuGroup:FlxGroup;
	public var tutGroup:FlxGroup;

	public var inputTests:Array<InputTest>;
	public static var customizationPanel:CustomizationPanel;
	
	public var backToMenuBtn:AnimatedButton;
	public var runBtn:AnimatedButton;
	public var resetBtn:AnimatedButton;

	public var helpBtn:FlxButton;
	public var speedUp:FlxButton;
	public var speedDown:FlxButton;
	public var saveButton:FlxButton;
	public var resetGridBtn:FlxButton;
	
	public var helpPanel:FlxSprite;
	public var helpPanelText:FlxText;
	public var levelDescription:FlxSprite;
	public var statusTxt:FlxText;
	public var titleTxt:FlxText;
	public var speedText:FlxText;
	
	public var wonPanel:WonPanel;

	public function new() 
	{
		GlobalVars.level.gui = this;
		init();
	}
	private function init()
	{
		initGroups();
		customizationPanel = new CustomizationPanel();

		addInputTests();//added to panels layer
		addHelpPanel();//added to menu layer
		addBlockSources();//added to panels layer
		addUI();//added to ui layer
		addDiscription();//added to panels layer
		
	}
	private function initGroups()
	{
		gridGroup = new FlxGroup();
		GlobalVars.level.add(gridGroup);

		panelsGroup = new FlxGroup();
		GlobalVars.level.add(panelsGroup);

		blockSourcesGroup = new FlxTypedGroup<FlxSprite>();
		GlobalVars.level.add(blockSourcesGroup);

		blocksBasesGroup = new FlxGroup();
		GlobalVars.level.add(blocksBasesGroup);

		seqGroup = new FlxGroup();
		GlobalVars.level.add(seqGroup);
		
		blocksGroup = new FlxGroup();
		GlobalVars.level.add(blocksGroup);
		guiGroup = new FlxGroup();
		GlobalVars.level.add(guiGroup);
		menuGroup = new FlxGroup();
		GlobalVars.level.add(menuGroup);
		tutGroup = new FlxGroup();
		GlobalVars.level.add(tutGroup);
	}
	private function addUI()
	{
		resetGridBtn = new FlxButton(30, 1, "load", GlobalVars.level.resetGrid);
		resetGridBtn.scalebtn(0.7, 1.2);
		//guiGroup.add(resetGridBtn);
		
		saveButton = new FlxButton(90, 1, "save", GlobalVars.level.saveLevel);
		saveButton.scalebtn(0.7, 1.2);
		//guiGroup.add(saveButton);

		//FlxG.state.add(new AnimatedButton(540,0,"reset.png"));
		//FlxG.state.add(new AnimatedButton(480,0,"run.png"));
		//FlxG.state.add(new AnimatedButton(420,0,"home.png"));

		backToMenuBtn = new AnimatedButton(420, 220, "home.png", GlobalVars.level.switchBack);
		guiGroup.add(backToMenuBtn);
		
		runBtn = new AnimatedButton(480, 220, "run.png", GlobalVars.level.runGame);
		guiGroup.add(runBtn);
		
		resetBtn = new AnimatedButton(540, 220, "reset.png", GlobalVars.level.resetGame);
		guiGroup.add(resetBtn);

		helpBtn = new FlxButton(580, 10, "", GlobalVars.level.toggleHelpPanel);
		helpBtn.loadGraphic("assets/images/GUI/buttons/question.png");
		guiGroup.add(helpBtn);
		
		
		var posX = 380;
		GlobalVars.level.speed = 1;
		speedText = new FlxText(posX , 40, 100, "Speed: " + GlobalVars.level.speed, 10);
		speedText.color = 0xAA5C755E;
		guiGroup.add(speedText);
		GlobalVars.level.changeSpeed();
		
		speedUp = new FlxButton(posX +10, 60, "", GlobalVars.level.speedUpF);
		//speedUp.scalebtn(0.4,0.6);
		speedUp.loadGraphic("assets/images/GUI/buttons/plus.png");
		guiGroup.add(speedUp);
		
		speedDown = new FlxButton(posX+10, 87, "", GlobalVars.level.speedDownF);
		//speedDown.scalebtn(0.4,0.6);
		speedDown.loadGraphic("assets/images/GUI/buttons/minus.png");
		guiGroup.add(speedDown);

		
		statusTxt = new FlxText(500,25,80," ").setFormat(Reg.font, 16 , 0x9C9F84,"center");
		guiGroup.add(statusTxt);

		titleTxt = new FlxText(0,5,FlxG.width, "Level : " +GlobalVars.levelInfo.id).setFormat(Reg.font, 16 , 0x9C9F84,"center");
		guiGroup.add(titleTxt);

		wonPanel = new WonPanel();
		guiGroup.add(wonPanel);
		
	}
	function addInputTests() 
	{
		var discription:FlxSprite = new FlxSprite(0,370).makeGraphic(640,100,0x00000000);
		discription.drawRoundRect(20, 0, 600, 100, 15, 15, 0xFFA97D5D);	
		panelsGroup.add(discription);

		inputTests = new Array<InputTest>();
		var inputTest:InputTest;
		for (i in 0 ... GlobalVars.levelInfo.publicInputTests.length) {
			inputTest = new InputTest(discription.x + i*120 + 10 + 20, discription.y + 10,i,
						GlobalVars.levelInfo.publicInputTests[i],GlobalVars.levelInfo.testFunction(GlobalVars.levelInfo.publicInputTests[i]));

			inputTests.push(inputTest);
		}
		
		/*var text:FlxText = new FlxText(40 , 430, 450, levelInfo.description, 20);
		text.color = 0xAA5C755E;
		add(text);*/
	}
	private function addBlockSources()
	{
		var dBlockSource:BlockSource;
        var allowedBlocks:Array<Int>;
        var temp:Int = GlobalVars.levelInfo.allowedBlocksType;
       	
        switch (temp) {
        	case 0:allowedBlocks = [0];
        	case 1:allowedBlocks = [0,1];
        	case 2:allowedBlocks = [0,1,21];
        	case 3:allowedBlocks = [0,1,22];
        	case 4:allowedBlocks = [0,1,23];
			//----------------------------------
        	default:allowedBlocks = [0,1,23,3,4,5,6,7];
        }
		var actualCount:Int = 0;
        for (i in 0 ... allowedBlocks.length)
        {
			dBlockSource = new BlockSource(10, 35 + 36 * Math.floor(actualCount), allowedBlocks[i]);
			blockSourcesGroup.add(dBlockSource);
			actualCount++;
        }
	}
	
	function addDiscription() 
	{
		levelDescription = new FlxSprite(400,265).makeGraphic(220,90,0x00000000);
		levelDescription.drawRoundRect(0, 0, levelDescription.width, levelDescription.height, 15, 15, 0xFFA97D5D);
		var offset:Int = 4;
		levelDescription.drawRoundRect(0+offset, offset, levelDescription.width -2*offset, levelDescription.height - 2*offset, 15, 15, FlxColor.RED);
		panelsGroup.add(levelDescription);
		
		var text:FlxText = new FlxText(levelDescription.x + offset + 30 , levelDescription.y + offset, levelDescription.width - 5*(offset+10), GlobalVars.levelInfo.description, 12);
		text.color = 0xAA5C755E;
		panelsGroup.add(text);
	}
	function addHelpPanel()
	{
		var width:Int = 450;
		var height:Int = 300;
		
		var center:FlxPoint = new FlxPoint(320,240);
		helpPanel = new FlxSprite(center.x-width/2,center.y - height/2).makeGraphic(width,height,0x00000000);
		helpPanel.drawRoundRect(0, 0, helpPanel.width, helpPanel.height, 15, 15, 0xFF000000);
		helpPanel.visible = false;
		menuGroup.add(helpPanel);
		var offset:FlxPoint = new FlxPoint(10,10);
 		
		helpPanelText = new FlxText(helpPanel.x + offset.x , helpPanel.y + offset.y ,width-offset.x*2," ")
						.setFormat(Reg.font, 12 , 0x9C9F84,"left");
		helpPanelText.text = GlobalVars.levelInfo.levelIntro;
		helpPanelText.visible  =false;
		menuGroup.add(helpPanelText);
	}
}
class ButtonExtender 
{
  static public function scalebtn(btn:FlxButton,scaleX:Float,scaleY:Float) 
  {
    btn.scale.set(scaleX, scaleY);
	btn.updateHitbox();
	btn.label.offset.set(btn.offset.x,btn.offset.y); 
	return btn;
  }
}