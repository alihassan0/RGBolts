package level;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.text.FlxText;
import customizationPanel.*;
import blocks.*;

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
	
	private var backToMenuBtn:FlxButton;
	public var runBtn:FlxButton;
	public var resetBtn:FlxButton;
	public var helpBtn:FlxButton;
	public var speedUp:FlxButton;
	public var speedDown:FlxButton;
	public var saveButton:FlxButton;
	public var resetGridButton:FlxButton;
	public var nextLevel:FlxButton;

	public var helpPanel:FlxSprite;
	public var helpPanelText:FlxText;
	
	public var statusTxt:FlxText;
	public var titleTxt:FlxText;
	public var speedText:FlxText;
	
	private var wonPanel:WonPanel;

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
		backToMenuBtn = new FlxButton(420, 220, "Back", GlobalVars.level.switchBack);
		resetGridButton = new FlxButton(30, 1, "load", GlobalVars.level.resetGrid);
		resetGridButton.scalebtn(0.7, 1.2);
		guiGroup.add(resetGridButton);
		
		saveButton = new FlxButton(90, 1, "save", GlobalVars.level.saveLevel);
		saveButton.scalebtn(0.7, 1.2);
		guiGroup.add(saveButton);

		backToMenuBtn.scalebtn(0.7, 1.2);
		guiGroup.add(backToMenuBtn);
		
		runBtn = new FlxButton(480, 220, "run", GlobalVars.level.runGame);
		runBtn.scalebtn(0.7, 1.2);
		guiGroup.add(runBtn);
		
		resetBtn = new FlxButton(540, 220, "reset", GlobalVars.level.resetGame);
		resetBtn.scalebtn(0.7, 1.2);
		guiGroup.add(resetBtn);

		helpBtn = new FlxButton(580, 10, "", GlobalVars.level.toggleHelpPanel);
		helpBtn.loadGraphic("assets/images/question.png");
		guiGroup.add(helpBtn);
		
		
		var posX = 380;
		GlobalVars.level.speed = 1;
		speedText = new FlxText(posX , 40, 100, "Speed: " + GlobalVars.level.speed, 10);
		speedText.color = 0xAA5C755E;
		guiGroup.add(speedText);
		GlobalVars.level.changeSpeed();
		
		speedUp = new FlxButton(posX +10, 60, "", GlobalVars.level.speedUpF);
		//speedUp.scalebtn(0.4,0.6);
		speedUp.loadGraphic("assets/images/Entypo_2b(1)_24.png");
		guiGroup.add(speedUp);
		
		speedDown = new FlxButton(posX+10, 87, "", GlobalVars.level.speedDownF);
		//speedDown.scalebtn(0.4,0.6);
		speedDown.loadGraphic("assets/images/Entypo_2d(0)_24.png");
		guiGroup.add(speedDown);

		nextLevel = new FlxButton(490-60, 235, "next level", GlobalVars.level.nextLevelF);
		nextLevel.scalebtn(2,2);
		nextLevel.visible = false;
		guiGroup.add(nextLevel);

		statusTxt = new FlxText(500,25,80," ").setFormat(null, 12 , 0x9C9F84,"center");
		guiGroup.add(statusTxt);

		titleTxt = new FlxText(0,5,FlxG.width, "Level : " +GlobalVars.levelInfo.id).setFormat(null, 16 , 0x9C9F84,"center");
		guiGroup.add(titleTxt);

		wonPanel = new WonPanel();
		//guiGroup.add(wonPanel);
		
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
       // var discription:FlxSprite = new FlxSprite(410, 50);// .makeGraphic(155, 155, 0x00000000);
		
	//	discription.loadGraphic("assets/images/Container.png");
		//discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, FlxColor.AZURE);
	//	panelsGroup.add(discription);
        switch (temp) {
        	case 0:allowedBlocks = [0];
        	case 1:allowedBlocks = [0,1];
        	case 2:allowedBlocks = [0,1,3];
			//----------------------------------
        	default:allowedBlocks = [0,1,2,3,4,5,6,7];
        }
		var actualCount:Int = 0;
        for (i in 0 ... 12)
        {
        	if(allowedBlocks.indexOf(i)!=-1)
        	{
    			dBlockSource = new BlockSource(10, 35 + 36 * Math.floor(actualCount), i);
    			blockSourcesGroup.add(dBlockSource);
				actualCount++;
        	}
        	else
        	{	if (i < allowedBlocks.length-1){
				var placeHolder:FlxSprite = new FlxSprite(425 + 45 * (i%3), 65 + 45 * Math.floor(i/3));
        		placeHolder.makeGraphic(40,40,0xFF9C9F84);
        		panelsGroup.add(placeHolder);
			}
        	}
		}
	}
	
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(370,265).makeGraphic(280,90,0x00000000);
		discription.drawRoundRect(30, 0, discription.width-60, discription.height, 15, 15, 0xFFA97D5D);
		var offset:Int = 4;
		discription.drawRoundRect(30+offset, offset, discription.width-60 -2*offset, discription.height - 2*offset, 15, 15, FlxColor.RED);
		panelsGroup.add(discription);
		
		var text:FlxText = new FlxText(discription.x + offset + 30 , discription.y + offset, discription.width - 5*(offset+10), GlobalVars.levelInfo.description, 12);
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
						.setFormat(null, 12 , 0x9C9F84,"center");
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