package level;

import blocks.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.util.FlxPoint;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxSave;
import haxe.Constraints.Function;
import seq.Seq;

/**
 * A FlxState which can be used for the game's menu.
 */
using flixel.util.FlxSpriteUtil;
using Level.ButtonExtender;

class Level extends FlxState
{
	private var backToMenuBtn:FlxButton;
	
	public var status_txt:FlxText;
	public var title_txt:FlxText;
	public var runBtn:FlxButton;
	public var resetBtn:FlxButton;
	public var helpBtn:FlxButton;
	public var speedUp:FlxButton;
	public var speedDown:FlxButton;
	public var saveButton:FlxButton;
	public var loadButton:FlxButton;
	public var nextLevel:FlxButton;
	public var helpPanel:FlxSprite;
	public var helpPanelText:FlxText;
	
	public var levelInfo:LevelInfo;

	private var speed:Int = 1;

	private var timer:FlxTimer;
	private var speedText:FlxText;
	public var isRunning:Bool;
	public var isPaused:Bool;
	
	public var gridGroup:FlxGroup;
	public var blocksBasesGroup:FlxGroup;
	public var seqGroup:FlxGroup;
	public var blocksGroup:FlxGroup;
	public var panelsGroup:FlxGroup;
	public var blockSourcesGroup:FlxTypedGroup<FlxSprite>;
	public  var guiGroup:FlxGroup;
	public var menuGroup:FlxGroup;
	public var tutGroup:FlxGroup;

	private var inputTests:Array<InputTest>;
	public var selectedInputTest:InputTest;
	
	
	override public function create():Void
	{
		levelInfo = GlobalVars.levelInfo;
		this.timer = new FlxTimer();
		this.isRunning = false;
		GlobalVars.level = this;
		
		if(GlobalVars.save == null)
		{
			GlobalVars.save = new FlxSave();
			GlobalVars.save.bind("SaveTest3");
		}
		

		FlxG.watch.addMouse();
		initGroups();

		bgColor = FlxColor.WHEAT;
		new GameGrid();
		

		addInputTests();//added to panels layer
		addHelpPanel();//added to menu layer
		addBlockSources();//added to panels layer
		addUI();//added to ui layer
		addDiscription();//added to panels layer

		if(levelInfo.id == 0)
		{
			TutVars.exists = true;
			TutVars.curruntHint = 0;
			TutVars.initHelpPanel();
			TutVars.showNextTip();
		}
		else
		{
			TutVars.exists = false;
		}            		
	}

	private function initGroups()
	{
		gridGroup = new FlxGroup();
		add(gridGroup);

		panelsGroup = new FlxGroup();
		add(panelsGroup);

		blockSourcesGroup = new FlxTypedGroup<FlxSprite>();
		add(blockSourcesGroup);
		
		blocksBasesGroup = new FlxGroup();
		add(blocksBasesGroup);

		seqGroup = new FlxGroup();
		add(seqGroup);
		
		blocksGroup = new FlxGroup();
		add(blocksGroup);
		guiGroup = new FlxGroup();
		add(guiGroup);
		menuGroup = new FlxGroup();
		add(menuGroup);
		tutGroup = new FlxGroup();
		add(tutGroup);
	}
	private function addBlockSources()
	{
		var dBlockSource:BlockSource;
        var allowedBlocks:Array<Int>;
        var temp:Int = GlobalVars.levelInfo.allowedBlocksType;
        var discription:FlxSprite = new FlxSprite(480,50).makeGraphic(155,200,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		panelsGroup.add(discription);
        switch (temp) {
        	case 0:allowedBlocks = [0];
        	case 1:allowedBlocks = [0,1];
        	case 2:allowedBlocks = [0,1,3];
        	case 3:allowedBlocks = [0,1,3,4];
        	case 4:allowedBlocks = [0,1,3,4,5,8];
        	case 5:allowedBlocks = [0,1,3,4,5,7,8];
        	case 6:allowedBlocks = [0,1,2,3,4,5,6,7,8];
        	default:allowedBlocks = [0,1,2,3,4,5,6,7,8];
        }
        for (i in 0 ... 12)
        {
        	if(allowedBlocks.indexOf(i)!=-1)
        	{
    			dBlockSource = new BlockSource(490 + 45 * (i%3), 60 + 45 * Math.floor(i/3), i);
    			blockSourcesGroup.add(dBlockSource);
        	}
        	else
        	{
				var placeHolder:FlxSprite = new FlxSprite(490 + 45 * (i%3), 60 + 45 * Math.floor(i/3));
        		placeHolder.makeGraphic(40,40,0xFF9C9F84);
        		panelsGroup.add(placeHolder);
        	}
		}
	}
	private function addUI()
	{
		loadButton = new FlxButton(30, 1, "load", loadLevel);
		loadButton.scalebtn(0.7, 1.2);
		guiGroup.add(loadButton);
		
		saveButton = new FlxButton(90, 1, "save", saveLevel);
		saveButton.scalebtn(0.7, 1.2);
		guiGroup.add(saveButton);

		backToMenuBtn = new FlxButton(400, 1, "Back", switchBack);
		backToMenuBtn.scalebtn(0.7, 1.2);
		guiGroup.add(backToMenuBtn);
		
		runBtn = new FlxButton(460, 1, "run", runGame);
		runBtn.scalebtn(0.7, 1.2);
		guiGroup.add(runBtn);
		
		resetBtn = new FlxButton(520, 1, "reset", resetGame);
		resetBtn.scalebtn(0.7, 1.2);
		guiGroup.add(resetBtn);

		helpBtn = new FlxButton(580, 10, "", toggleHelpPanel);
		helpBtn.loadGraphic("assets/images/question.png");
		guiGroup.add(helpBtn);
		
		speed = 1;
		speedText = new FlxText(410 , 40, 100, "Speed: " + speed, 10);
		speedText.color = 0xAA5C755E;
		guiGroup.add(speedText);
		changeSpeed();
		
		speedUp = new FlxButton(420, 50, "Up", speedUpF);
		speedUp.scalebtn(0.4,0.6);
		guiGroup.add(speedUp);
		
		speedDown = new FlxButton(420, 63, "Down", speedDownF);
		speedDown.scalebtn(0.4,0.6);
		guiGroup.add(speedDown);

		nextLevel = new FlxButton(490-60, 235, "next level", nextLevelF);
		nextLevel.scalebtn(2,2);
		nextLevel.visible = false;
		guiGroup.add(nextLevel);

		status_txt = new FlxText(500,25,80," ").setFormat(null, 12 , 0x9C9F84,"center");
		guiGroup.add(status_txt);

		title_txt = new FlxText(0,5,FlxG.width, "Level : " +GlobalVars.levelInfo.id).setFormat(null, 16 , 0x9C9F84,"center");
		guiGroup.add(title_txt);
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(350,265).makeGraphic(280,90,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		var offset:Int = 4;
		discription.drawRoundRect(offset, offset, discription.width -2*offset, discription.height - 2*offset, 15, 15, FlxColor.WHEAT);
		panelsGroup.add(discription);
		
		var text:FlxText = new FlxText(discription.x + offset , discription.y + offset, discription.width - 2*offset, levelInfo.description, 12);
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
		helpPanelText.text = levelInfo.levelIntro;
		helpPanelText.visible  =false;
		menuGroup.add(helpPanelText);
	}
	function intermediate(timer:FlxTimer)
	{
		if (isRunning && !isPaused)
		runGridOnce();
	}
	public function getInputString()
	{

		if(selectedInputTest == null)
		{
			selectedInputTest = inputTests[0];
			selectedInputTest.selected  = true;
			selectedInputTest.showSelection();
		}
			
		return selectedInputTest.inputString;
	}
	function speedUpF() {

		if (speed < 3)
		speed++;
	    speedText.text = "Speed: " + speed;
		changeSpeed();
	}
	function speedDownF()
	{
		if (speed > 1)
		speed--;
        speedText.text = "Speed: " + speed;
		changeSpeed();
	}
	function nextLevelF()
	{
		GlobalVars.levelInfo = GlobalVars.levels[levelInfo.id];
		FlxG.switchState(new Level());
	}
	function switchBack()
	{
		FlxG.switchState(new LevelSelector());
	}
	function loadLevel()
	{
		GlobalVars.gameGrid.loadGrid();
	}
	function saveLevel()
	{
		if(GlobalVars.save.data.levels == null)
			GlobalVars.save.data.levels = new Array<Bool>();

		GlobalVars.save.data.levels[levelInfo.id] = true;

		if(GlobalVars.save.data.levelBlocksGrid == null)
			GlobalVars.save.data.levelBlocksGrid = new Array<Array<Array<Int>>>();
		
		GlobalVars.save.data.levelBlocksGrid[levelInfo.id] = new Array<Array<Int>>();
		for (x in 0...GlobalVars.gameGrid.gridWidth)
        {
            GlobalVars.save.data.levelBlocksGrid[levelInfo.id][x] = new Array<Int>();
            for (y in 0...GlobalVars.gameGrid.gridHeight)
            {
                 GlobalVars.save.data.levelBlocksGrid[levelInfo.id][x][y] = 0;
            }
        }
        for (x in 0...GlobalVars.gameGrid.gridWidth)
        {
            for (y in 0...GlobalVars.gameGrid.gridHeight)
            {
            	if(GlobalVars.gameGrid.blocksGrid[x][y] != null)
            	{
               		GlobalVars.save.data.levelBlocksGrid[GlobalVars.levelInfo.id][x][y] = 1;
            		trace("savedBlock @ " + x +" , " +  y);
            	}
            }
        }
		GlobalVars.save.flush();
		 
	}
	function addStatus() 
	{
		
	}
	public function status_change(type:Int)
	{
		switch(type)
		{
			case 0: status_txt.text = "great job";showTestResult(true);//success
			case 1: status_txt.text = "try again";showTestResult(false);//fail
			case 2: status_txt.text = "         ";//wait
			case 3: status_txt.text = " testing ";//testing
		}
	}
	function getNextInputTest():InputTest
	{
		var newId:Int = (selectedInputTest.id+1)%inputTests.length;
		if(inputTests[newId].state == 1)//finished
		{
			newId = -1;
			for (i in 0 ... inputTests.length) {
				if(inputTests[i].state == 0)
					break;
			}
			if(newId == -1)
				return null;
		}
		return inputTests[newId];
	}
	function showTestResult(successful:Bool) 
	{
		if(successful)
		{
			selectedInputTest.setState(1);
			if(getNextInputTest() == null)
			{
				nextLevel.visible = true;
				resetSeqs();
				togglePauseGame();
			}	
			else
			{
				selectedInputTest = getNextInputTest();
				GlobalVars.gameGrid.inputBlock.inputString = getInputString();
				GlobalVars.gameGrid.outputBlock.inputString = getInputString();
				resetSeqs();
			}
		}
		else
		{
			resetSeqs();
			selectedInputTest.setState(2);
		}	
	}
	function addInputTests() 
	{
		var discription:FlxSprite = new FlxSprite(0,360).makeGraphic(640,100,0x00000000);
		discription.drawRoundRect(20, 0, 600, 100, 15, 15, 0xFFA97D5D);
		panelsGroup.add(discription);

		inputTests = new Array<InputTest>();
		var inputTest:InputTest;
		for (i in 0 ... levelInfo.publicInputTests.length) {
			inputTest = new InputTest(discription.x + i*120 + 10 + 20, discription.y + 10,i,
						levelInfo.publicInputTests[i],levelInfo.testFunction(levelInfo.publicInputTests[i]));

			inputTests.push(inputTest);
		}
		
		/*var text:FlxText = new FlxText(40 , 430, 450, levelInfo.description, 20);
		text.color = 0xAA5C755E;
		add(text);*/
	}
	function changeSpeed()
	{
		if (speed == 0)
		{
			timer.cancel();
		 	GlobalVars.moveDuration = 0;
		}
		GlobalVars.moveDuration = Math.pow(2,1-speed);
		//timer.start(GlobalVars.moveDuration, intermediate , 0);
	}
	function resetGame() 
	{
		exitPlayMode();
		resetSeqs();
		resetTestCases();
		checkForTutorial("resetBtn");
		
	}
	function exitPlayMode() 
	{
		isRunning =  false;
		bgColor = FlxColor.WHEAT;
	}
	public function resetSeqs():Void
	{
		status_change(2);
		while (GlobalVars.Seqs.length != 0)
		{
			GlobalVars.Seqs.shift().kill();
		}
		GlobalVars.gameGrid.resetBlocks();
	}
	public function resetTestCases():Void
	{
		for (i in 0 ... inputTests.length) {
			inputTests[i].selected = false;
			inputTests[i].showSelection();
			inputTests[i].setState(0);
		}
	} 
	function toggleHelpPanel()
	{
		helpPanel.visible = !helpPanel.visible;
		helpPanelText.visible = !helpPanelText.visible;
	}
	
	public function togglePauseGame():Void 
	{
		isPaused = !isPaused;
	}
	public function runGame():Void 
	{
		
		if(!isRunning)
		{
			isRunning = true;
			bgColor = 0xFFF2C968;
		
			GlobalVars.gameGrid.inputBlock.inputString = getInputString();
			GlobalVars.gameGrid.outputBlock.inputString = getInputString();
		}
		if(speed == 0)
			runGridOnce();
		else
			timer.start(GlobalVars.moveDuration, intermediate , 1);
		checkForTutorial("runBtn");
	}
	public function checkForTutorial(key:String)
	{
		if(TutVars.exists && TutVars.triggers[key].indexOf(TutVars.curruntHint)!= -1)
			TutVars.showNextTip();
	}
	public function runGridOnce():Void 
	{
		if (GlobalVars.Seqs.length == 0)//temp starter
		{
			GlobalVars.gameGrid.inputBlock.started = true;
			status_change(3);
		}
		GlobalVars.turn ++;
		GlobalVars.stepDuration = GlobalVars.moveDuration;
		GlobalVars.Seqs = Lambda.array(Lambda.filter(GlobalVars.Seqs, function(v) { return (v.alive == true); } ));
		for (i in 0...GlobalVars.Seqs.length)
        {
        	if(GlobalVars.Seqs[i] != null && GlobalVars.Seqs[i].canMove)
			GlobalVars.Seqs[i].action();
        }
        timer.start(GlobalVars.moveDuration, intermediate , 1);
	}
	override public function update():Void
	{
		super.update();
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;
		/*if (FlxG.keys.pressed.K)
		{
			FlxG.watch.add(GlobalVars.Seqs, "length");
		}*/
	}
}
class ButtonExtender {
  static public function scalebtn(btn:FlxButton,scaleX:Float,scaleY:Float) {
	    btn.scale.set(scaleX, scaleY);
		btn.updateHitbox();
		btn.label.offset.set(btn.offset.x,btn.offset.y); 
		return btn;
  }
}