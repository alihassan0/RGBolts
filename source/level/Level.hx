package level;

import blocks.*;
import customizationPanel.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
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
 * the state that contains all playelemets
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
	public var resetGridButton:FlxButton;
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
	public static var customizePanel:CustomizationPanel;
	public static var level:Level;
	private var wonPanel:WonPanel;
	override public function create():Void
	{
		level = this;
		levelInfo = GlobalVars.levelInfo;
		FlxG.camera.antialiasing = true;
		this.timer = new FlxTimer();
		this.isRunning = false;
		GlobalVars.level = this;
		
		if(GlobalVars.save == null)
		{
			GlobalVars.save = new FlxSave();
			GlobalVars.save.bind("SaveTest5");
		}
		

		FlxG.watch.addMouse();
		initGroups();

		bgColor = FlxColor.CRIMSON;
		new GameGrid();
		
		customizePanel = new CustomizationPanel();
		
		addInputTests();//added to panels layer
		addHelpPanel();//added to menu layer
		addBlockSources();//added to panels layer
		addUI();//added to ui layer
		addDiscription();//added to panels layer

		if(levelInfo.id == 1)
		{
			TutVars.exists = true;
			TutVars.curruntHint = 0;
			TutVars.initHelpPanel();
			TutVars.showNextTip();
			setControlFlags(false);
		}
		else
		{
			TutVars.exists = false;
			setControlFlags(true);
		}            		
	}
	public function setControlFlags(b:Bool):Void
	{//this is not a good programming practice
		GlobalVars.inputTestsEnabled = b;
		GlobalVars.blocksDraggingEnabled = b;
		GlobalVars.blocksCreatingEnabled = b;
		GlobalVars.mainBlocksDraggingEnabled = b;
		GlobalVars.resetButttonEnabled = b;
		GlobalVars.startButttonEnabled = b;
	}
	public function changePanel(block:Block):Void
	{
		customizePanel.customize(block);
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
		
		
		
		//test
		
		
		
		
	}
	private function addUI()
	{
		backToMenuBtn = new FlxButton(420, 220, "Back", switchBack);
		resetGridButton = new FlxButton(30, 1, "load", resetGrid);
		resetGridButton.scalebtn(0.7, 1.2);
		guiGroup.add(resetGridButton);
		
		saveButton = new FlxButton(90, 1, "save", saveLevel);
		saveButton.scalebtn(0.7, 1.2);
		guiGroup.add(saveButton);

		backToMenuBtn.scalebtn(0.7, 1.2);
		guiGroup.add(backToMenuBtn);
		
		runBtn = new FlxButton(480, 220, "run", runGame);
		runBtn.scalebtn(0.7, 1.2);
		guiGroup.add(runBtn);
		
		resetBtn = new FlxButton(540, 220, "reset", resetGame);
		resetBtn.scalebtn(0.7, 1.2);
		guiGroup.add(resetBtn);

		helpBtn = new FlxButton(580, 10, "", toggleHelpPanel);
		helpBtn.loadGraphic("assets/images/question.png");
		guiGroup.add(helpBtn);
		
		
		var speedX = 380;
		speed = 1;
		speedText = new FlxText(speedX , 40, 100, "Speed: " + speed, 10);
		speedText.color = 0xAA5C755E;
		guiGroup.add(speedText);
		changeSpeed();
		
		speedUp = new FlxButton(speedX +10, 60, "", speedUpF);
		//speedUp.scalebtn(0.4,0.6);
		speedUp.loadGraphic("assets/images/Entypo_2b(1)_24.png");
		guiGroup.add(speedUp);
		
		speedDown = new FlxButton(speedX+10, 87, "", speedDownF);
		//speedDown.scalebtn(0.4,0.6);
		speedDown.loadGraphic("assets/images/Entypo_2d(0)_24.png");
		guiGroup.add(speedDown);

		nextLevel = new FlxButton(490-60, 235, "next level", nextLevelF);
		nextLevel.scalebtn(2,2);
		nextLevel.visible = false;
		guiGroup.add(nextLevel);

		status_txt = new FlxText(500,25,80," ").setFormat(null, 12 , 0x9C9F84,"center");
		guiGroup.add(status_txt);

		title_txt = new FlxText(0,5,FlxG.width, "Level : " +GlobalVars.levelInfo.id).setFormat(null, 16 , 0x9C9F84,"center");
		guiGroup.add(title_txt);

		wonPanel = new WonPanel();
		//guiGroup.add(wonPanel);
		
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(370,265).makeGraphic(280,90,0x00000000);
		discription.drawRoundRect(30, 0, discription.width-60, discription.height, 15, 15, 0xFFA97D5D);
		var offset:Int = 4;
		discription.drawRoundRect(30+offset, offset, discription.width-60 -2*offset, discription.height - 2*offset, 15, 15, FlxColor.RED);
		panelsGroup.add(discription);
		
		var text:FlxText = new FlxText(discription.x + offset + 30 , discription.y + offset, discription.width - 5*(offset+10), levelInfo.description, 12);
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

		FlxTween.num(1, 0, 0.1, { ease:FlxEase.circIn, complete:fadeOut }, changeColor);
		if (speed < 3)
		speed++;
	    speedText.text = "Speed: " + speed;
		changeSpeed();
	}
	function changeColor(opacity:Float){
		speedUp.alpha = opacity;
	}
	function changeColor2(opacity:Float){
		speedDown.alpha = opacity;
	}
	function fadeOut(_){
		FlxTween.num(0, 1, 0.1, { ease:FlxEase.circInOut }, changeColor);
	}
	function fadeOut2(_){
		FlxTween.num(0, 1, 0.1, { ease:FlxEase.circInOut }, changeColor2);
	}
	function speedDownF()
	{
		FlxTween.num(1, 0, 0.1, { ease:FlxEase.circIn, complete:fadeOut2 }, changeColor2);
		if (speed > 1)
		speed--;
        speedText.text = "Speed: " + speed;
		changeSpeed();
	}
	function nextLevelF()
	{
		saveLevel();
		GlobalVars.levelInfo = GlobalVars.levels[levelInfo.id];
		FlxG.switchState(new Level());
	}
	function switchBack()
	{
		FlxG.switchState(new LevelSelector());
	}
	function resetGrid()
	{
		GlobalVars.gameGrid.resetGrid();
	}
	function saveLevel()
	{
		if(GlobalVars.save.data.levels == null)
			GlobalVars.save.data.levels = new Array<Bool>();

		GlobalVars.save.data.levels[levelInfo.id] = true;

		if(GlobalVars.save.data.levelBlocksGrid == null)
			GlobalVars.save.data.levelBlocksGrid = new Array<Array<Array<Array<String>>>>();
		
		GlobalVars.save.data.levelBlocksGrid[levelInfo.id] = new Array<Array<Array<String>>>();
		for (x in 0...GlobalVars.gameGrid.gridWidth)
        {
            GlobalVars.save.data.levelBlocksGrid[levelInfo.id][x] = new Array<Array<String>>();
            for (y in 0...GlobalVars.gameGrid.gridHeight)
            {
                 GlobalVars.save.data.levelBlocksGrid[levelInfo.id][x][y] = null;
            }
        }
        for (x in 0...GlobalVars.gameGrid.gridWidth)
        {
            for (y in 0...GlobalVars.gameGrid.gridHeight)
            {
            	if(GlobalVars.gameGrid.blocksGrid[x][y] != null)
            	{
            		for (key in GlobalVars.blocksMap.keys()) {
					    if(GlobalVars.blocksMap[key] == Type.getClass(GlobalVars.gameGrid.blocksGrid[x][y]))
					    {
		               		GlobalVars.save.data.levelBlocksGrid[GlobalVars.levelInfo.id][x][y] = new Array<String>();
		               		GlobalVars.save.data.levelBlocksGrid[GlobalVars.levelInfo.id][x][y][0] = key+"";
		               		GlobalVars.save.data.levelBlocksGrid[GlobalVars.levelInfo.id][x][y][1] = GlobalVars.gameGrid.blocksGrid[x][y].getSaveString();
	    	        		trace("savedBlock with an id of "+ key +" @ " + x +" , " +  y + "with angle of " + GlobalVars.gameGrid.blocksGrid[x][y].getSaveString());		    	
					    }
					}
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
		var discription:FlxSprite = new FlxSprite(0,370).makeGraphic(640,100,0x00000000);
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
		if(GlobalVars.resetButttonEnabled)
		{
			exitPlayMode();
			resetSeqs();
			resetTestCases();
			checkForTutorial("resetBtn");
		}
	}
	function exitPlayMode() 
	{
		isRunning =  false;
		bgColor = FlxColor.WHEAT;
		GlobalVars.cycles = 0;
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
		if (isRunning || !GlobalVars.resetButttonEnabled)
			return;
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
		if (GlobalVars.Seqs.length == 0 )//temp starter
		{
			if(GlobalVars.cycles == 0)//this is the first turn 
			{
				GlobalVars.gameGrid.inputBlock.started = true;
				status_change(3);
			}
			else
			{
				resetGame();
				return;
			}
		}
		GlobalVars.cycles ++;
		GlobalVars.stepDuration = GlobalVars.moveDuration;
		GlobalVars.Seqs = Lambda.array(Lambda.filter(GlobalVars.Seqs, function(v) { return (v.alive == true); } ));
		for (i in 0...GlobalVars.Seqs.length)
        {
        	if(GlobalVars.Seqs[i] != null)
			GlobalVars.Seqs[i].action();
        }
        timer.start(GlobalVars.moveDuration, intermediate , 1);
	}
	override public function update():Void
	{
		super.update();
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;
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