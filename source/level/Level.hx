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
		levelInfo = GlovalVars.levelInfo;
		trace(this.levelInfo);
		this.timer = new FlxTimer();
		this.isRunning = false;
		GlovalVars.level = this;
		

		addInputTests();

		FlxG.watch.addMouse();
		
		bgColor = FlxColor.WHEAT;
		new GameGrid();
		GlovalVars.Seqs = new Array<Seq>();
		FlxG.watch.add(GlovalVars.Seqs, "length");

		addStatus();
		var dBlockSource:BlockSource;
        for (i in 0 ... 9)
        {
			if (i < 5)
			{
				dBlockSource = new BlockSource(500, 50 + 45 * i, i); add(dBlockSource);
			}
			else
			{
				dBlockSource = new BlockSource(550, 50 + 45 * (i-5), i); add(dBlockSource);
			}
		}

		addUI();
		addHelpPanel();
	}

	private function addUI()
	{
		backToMenuBtn = new FlxButton (420, 10, "Back", switchBack);
		backToMenuBtn.scale.set(0.6, 1);
		backToMenuBtn.updateHitbox();
		add(backToMenuBtn);
		
		runBtn = new FlxButton(470, 10, "run", runGame);
		runBtn.scale.set(0.6, 1);
		runBtn.updateHitbox();
		add(runBtn);
		
		resetBtn = new FlxButton(520, 10, "reset", resetGame);
		resetBtn.scale.set(0.6, 1);
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

		nextLevel = new FlxButton(450, 300, "next level", nextLevelF);
		nextLevel.scale.set(2,2);
		nextLevel.updateHitbox();
		nextLevel.visible = false;
		add(nextLevel);
	}
	function addHelpPanel()
	{
		var width:Int = 350;
		var height:Int = 250;
		
		var center:FlxPoint = new FlxPoint(280,240);
		helpPanel = new FlxSprite(center.x-width/2,center.y - height/2).makeGraphic(width,height,0x00000000);
		helpPanel.drawRoundRect(0, 0, helpPanel.width, helpPanel.height, 15, 15, 0xFF000000);
		helpPanel.visible = false;
		add(helpPanel);
		var offset:FlxPoint = new FlxPoint(10,10);
 		
		helpPanelText = new FlxText(helpPanel.x + offset.x , helpPanel.y + offset.y ,width-offset.x*2," ")
						.setFormat(null, 12 , 0x9C9F84,"center");
		helpPanelText.text= "this is a tutorial .. [[you don't say]] \n\n\n\n"+
							" game is controld with the mouse \n\n\n\n"+
							"description : "+ levelInfo.description+"\n\n\n\n"+
							"hint: STOP looking for hints and keep trying";
		helpPanelText.visible  =false;
		add(helpPanelText);
	}
	function intermedita(timer:FlxTimer)
	{
		if (isRunning && !isPaused)
		runGame();
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
		if (speed > 1)
		speed--;
        speedText.text = "Speed: " + speed;
		addSpeed();
	}
	function nextLevelF()
	{
		GlovalVars.levelInfo = GlovalVars.levels[levelInfo.id];
		FlxG.switchState(new Level());
	}
	function switchBack()
	{
		FlxG.switchState(new LevelSelector());
	}
	function addStatus() 
	{
		status_txt = new FlxText(500,25,80," ").setFormat(null, 12 , 0x9C9F84,"center");
		add(status_txt);
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
		   timer.cancel();
		if (speed == 1)
		   timer.start(1, intermedita , 0);
		if (speed == 2)
		   timer.start(0.5, intermedita,0);
		if (speed == 3)
		   timer.start(0.25, intermedita,0);

	}
	function resetGame() 
	{
		isRunning =  false;
		resetSeqs();
		resetTestCases();
		
	}
	public function resetSeqs():Void
	{
		status_change(2);
		while (GlovalVars.Seqs.length != 0)
		{
			GlovalVars.Seqs.shift().kill();
		}
		GlovalVars.gameGrid.resetBlocks();
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
		isRunning = true;
		GlovalVars.gameGrid.inputBlock.inputString = getInputString();
		GlovalVars.gameGrid.outputBlock.inputString = getInputString();

		if (GlovalVars.Seqs.length == 0)//temp starter
		{
			GlovalVars.gameGrid.inputBlock.started = true;
			status_change(3);
		}
		
		GlovalVars.turn ++;
		GlovalVars.Seqs = Lambda.array(Lambda.filter(GlovalVars.Seqs, function(v) { return (v.alive == true); } ));
		for (i in 0...GlovalVars.Seqs.length)
        {
        	if(GlovalVars.Seqs[i] != null)
			GlovalVars.Seqs[i].move();
			//FlxG.log.add(GlovalVars.Seqs.length);
        }
		//FlxG.log.add("---------------------------------------");
	}
	override public function update():Void
	{
		super.update();
		/*if (FlxG.keys.pressed.K)
		{
			FlxG.watch.add(GlovalVars.Seqs, "length");
		}*/
	}
}