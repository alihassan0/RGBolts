package level;

import blocks.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import haxe.Constraints.Function;
import flixel.util.FlxTimer;
import flixel.util.FlxPoint;
import seq.Seq;

/**
 * A FlxState which can be used for the game's menu.
 */
using flixel.util.FlxSpriteUtil;
class Level extends FlxState
{
	private var backToMenuBtn:FlxButton;
	
	private var status_txt:FlxText;
	private var title_txt:FlxText;
	private var runBtn:FlxButton;
	private var resetBtn:FlxButton;
	private var helpBtn:FlxButton;
	private var speedUp:FlxButton;
	private var speedDown:FlxButton;
	private var nextLevel:FlxButton;
	private var helpPanel:FlxSprite;
	private var helpPanelText:FlxText;
	
	public var levelInfo:LevelInfo;

	private var speed:Int;
	private var timer:FlxTimer;
	private var speedText:FlxText;
	public var isRunning:Bool;
	public var isPaused:Bool;
	
	private var inputTests:Array<InputTest>;
	public var selectedInputTest:InputTest;
	override public function create():Void
	{
		levelInfo = GlobalVars.levelInfo;
		this.timer = new FlxTimer();
		this.isRunning = false;
		GlobalVars.level = this;
		

		addInputTests();

		FlxG.watch.addMouse();
		
		bgColor = FlxColor.WHEAT;
		new GameGrid();
		GlobalVars.Seqs = new Array<Seq>();
		FlxG.watch.add(GlobalVars.Seqs, "length");

		
		addBlockSources();
		addUI();
		addDiscription();
		addHelpPanel();
		TutVars.initSprites();
		TutVars.focusOn(GlobalVars.gameGrid.inputBlock);
		TutVars.initHelpPanel();
		TutVars.showHelpPanel(GlobalVars.gameGrid.inputBlock,"this is a test ... let's hope it works");
	}

	private function addBlockSources()
	{
		var dBlockSource:BlockSource;
        var allowedBlocks:Array<Int>;
        var temp:Int = GlobalVars.levelInfo.allowedBlocksType;

        var discription:FlxSprite = new FlxSprite(480,50).makeGraphic(155,200,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		add(discription);
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
    			add(dBlockSource);
        	}
        	else
        	{
				var placeHolder:FlxSprite = new FlxSprite(490 + 45 * (i%3), 60 + 45 * Math.floor(i/3));
        		placeHolder.makeGraphic(40,40,0xFF9C9F84);
        		add(placeHolder);
        	}
		}
	}
	private function addUI()
	{
		backToMenuBtn = new FlxButton(400, 1, "Back", switchBack);
		backToMenuBtn.scale.set(0.7, 1.2);
		backToMenuBtn.updateHitbox();
		add(backToMenuBtn);
		
		runBtn = new FlxButton(460, 1, "run", runGame);
		runBtn.scale.set(0.7, 1.2);
		runBtn.updateHitbox();
		add(runBtn);
		
		resetBtn = new FlxButton(520, 1, "reset", resetGame);
		resetBtn.scale.set(0.7, 1.2);
		resetBtn.updateHitbox();
		add(resetBtn);

		helpBtn = new FlxButton(580, 10, "", toggleHelpPanel);
		helpBtn.loadGraphic("assets/images/question.png");
		add(helpBtn);
		
		speed = 0;
		speedText = new FlxText(410 , 40, 100, "Speed: " + speed, 10);
		speedText.color = 0xAA5C755E;
		add(speedText);
		addSpeed();
		
		speedUp = new FlxButton(420, 50, "Up", speedUpF);
		speedUp.scale.set(0.4,0.6);
		speedUp.updateHitbox();
		add(speedUp);
		
		speedDown = new FlxButton(420, 63, "Down", speedDownF);
		speedDown.scale.set(0.4,0.6);
		speedDown.updateHitbox();
		add(speedDown);

		nextLevel = new FlxButton(490-60, 235, "next level", nextLevelF);
		nextLevel.scale.set(2,2);
		nextLevel.updateHitbox();
		nextLevel.visible = false;
		add(nextLevel);

		status_txt = new FlxText(500,25,80," ").setFormat(null, 12 , 0x9C9F84,"center");
		add(status_txt);

		title_txt = new FlxText(0,5,FlxG.width, "Level : " +GlobalVars.levelInfo.id).setFormat(null, 16 , 0x9C9F84,"center");
		add(title_txt);
	}
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(350,265).makeGraphic(280,90,0x00000000);
		discription.drawRoundRect(0, 0, discription.width, discription.height, 15, 15, 0xFFA97D5D);
		var offset:Int = 4;
		discription.drawRoundRect(offset, offset, discription.width -2*offset, discription.height - 2*offset, 15, 15, FlxColor.WHEAT);
		add(discription);
		
		var text:FlxText = new FlxText(discription.x + offset , discription.y + offset, discription.width - 2*offset, levelInfo.description, 12);
		text.color = 0xAA5C755E;
		add(text);
	}
	function addHelpPanel()
	{
		var width:Int = 450;
		var height:Int = 300;
		
		var center:FlxPoint = new FlxPoint(320,240);
		helpPanel = new FlxSprite(center.x-width/2,center.y - height/2).makeGraphic(width,height,0x00000000);
		helpPanel.drawRoundRect(0, 0, helpPanel.width, helpPanel.height, 15, 15, 0xFF000000);
		helpPanel.visible = false;
		add(helpPanel);
		var offset:FlxPoint = new FlxPoint(10,10);
 		
		helpPanelText = new FlxText(helpPanel.x + offset.x , helpPanel.y + offset.y ,width-offset.x*2," ")
						.setFormat(null, 12 , 0x9C9F84,"center");
		helpPanelText.text = levelInfo.levelIntro;
		helpPanelText.visible  =false;
		add(helpPanelText);
	}
	function intermedita(timer:FlxTimer)
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
		addSpeed();
	}
	function speedDownF()
	{
		if (speed > 0)
		speed--;
        speedText.text = "Speed: " + speed;
		addSpeed();
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
		add(discription);

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
	function addSpeed()
	{
		if (speed == 0)
		{
		   timer.cancel();
		 	GlobalVars.moveDuration = 0;
		}
		if (speed == 1)
		{
		   timer.start(1, intermedita , 0);
		   GlobalVars.moveDuration = 1;
		}
		if (speed == 2)
		{
		   timer.start(0.5, intermedita,0);
		   GlobalVars.moveDuration = .5;
		}
		if (speed == 3)
		{
		   timer.start(0.25, intermedita,0);
			GlobalVars.moveDuration = .25;
		}

	}
	function resetGame() 
	{
		isRunning =  false;
		bgColor = FlxColor.WHEAT;
		resetSeqs();
		resetTestCases();
		
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
		else
		{
			if(speed == 0)
			runGridOnce();
		}
	}
	public function runGridOnce():Void 
	{
		if (GlobalVars.Seqs.length == 0)//temp starter
		{
			GlobalVars.gameGrid.inputBlock.started = true;
			status_change(3);
		}
		
		GlobalVars.turn ++;
		GlobalVars.Seqs = Lambda.array(Lambda.filter(GlobalVars.Seqs, function(v) { return (v.alive == true); } ));
		for (i in 0...GlobalVars.Seqs.length)
        {
        	if(GlobalVars.Seqs[i] != null && GlobalVars.Seqs[i].canMove)
			GlobalVars.Seqs[i].move();
        }
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