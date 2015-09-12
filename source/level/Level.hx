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
class Level extends FlxState
{
	
	public var gui:GUI;
	
	
	public var levelInfo:LevelInfo;

	public var speed:Int = 1;

	private var timer:FlxTimer;
	public var isRunning:Bool;
	public var isPaused:Bool;
	
	public var selectedInputTest:InputTest;
	
	override public function create():Void
	{
		GlobalVars.level = this;
		levelInfo = GlobalVars.levelInfo;
		FlxG.camera.antialiasing = true;
		if(GlobalVars.save == null)
		{
			GlobalVars.save = new FlxSave();
			GlobalVars.save.bind("SaveTest5");
		}
		new GUI();
		new GameGrid();
		timer = new FlxTimer();
		isRunning = false;
		bgColor = GlobalVars.normalBGColor;
		FlxG.watch.addMouse();

		if(levelInfo.id == 1)
		{
			setControlFlags(false);
			TutVars.exists = true;
			TutVars.curruntHint = 0;
			TutVars.initHelpPanel();
			TutVars.showNextTip();
		}
		else
		{
			TutVars.exists = false;
			setControlFlags(true);
		}
		//gui.wonPanel.show();
	}
	public function setControlFlags(b:Bool):Void
	{//this is not a good programming practice .. will probably change it later
		GlobalVars.inputTestsEnabled = b;
		GlobalVars.blocksCreatingEnabled = b;
		GlobalVars.mainBlocksDraggingEnabled = b;
		GlobalVars.resetButttonEnabled = b;
		GlobalVars.runButttonEnabled = b;
		GlobalVars.customizationEnabled = b;
		GlobalVars.arrowDraggingEnabled = b;
	}
	public function changePanel(block:Block):Void
	{
		GUI.customizationPanel.customize(block);
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
			selectedInputTest = gui.inputTests[0];
			selectedInputTest.selected  = true;
			selectedInputTest.showSelection();
		}
			
		return selectedInputTest.inputString;
	}
	public function speedUpF() 
	{
		FlxTween.num(1, 0, 0.1, { ease:FlxEase.circIn, complete:fadeOut }, changeColor);
		if (speed < 3)
		speed++;
	    gui.speedText.text = "Speed: " + speed;
		changeSpeed();
	}
	private function changeColor(opacity:Float)
	{
		gui.speedUp.alpha = opacity;
	}
	private function changeColor2(opacity:Float)
	{
		gui.speedDown.alpha = opacity;
	}
	function fadeOut(_){
		FlxTween.num(0, 1, 0.1, { ease:FlxEase.circInOut }, changeColor);
	}
	function fadeOut2(_){
		FlxTween.num(0, 1, 0.1, { ease:FlxEase.circInOut }, changeColor2);
	}
	public function speedDownF()
	{
		FlxTween.num(1, 0, 0.1, { ease:FlxEase.circIn, complete:fadeOut2 }, changeColor2);
		if (speed > 1)
		speed--;
        gui.speedText.text = "Speed: " + speed;
		changeSpeed();
	}
	public function nextLevelF()
	{
		saveLevel();
		GlobalVars.levelInfo = GlobalVars.levels[levelInfo.id];
		FlxG.switchState(new Level());
	}
	public function switchBack()
	{
		FlxG.switchState(new LevelSelector());
	}
	public function resetGrid()
	{
		GlobalVars.gameGrid.resetGrid();
	}
	public function saveLevel()
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
	public function status_change(type:Int)
	{
		switch(type)
		{
			case 0: gui.statusTxt.text = "great job";showTestResult(true);//success
			case 1: gui.statusTxt.text = "try again";showTestResult(false);//fail
			case 2: gui.statusTxt.text = "         ";//wait
			case 3: gui.statusTxt.text = " testing ";//testing
		}
	}
	function getNextInputTest():InputTest
	{
		var newId:Int = (selectedInputTest.id+1)%gui.inputTests.length;
		if(gui.inputTests[newId].state == 1)//finished
		{
			newId = -1;
			for (i in 0 ... gui.inputTests.length) {
				if(gui.inputTests[i].state == 0)
					break;
			}
			if(newId == -1)
				return null;
		}
		return gui.inputTests[newId];
	}
	function showTestResult(successful:Bool) 
	{
		if(successful)
		{
			if(selectedInputTest == gui.inputTests[0])
				checkForTutorial("test_passed");
			selectedInputTest.setState(1);
			selectedInputTest.cycles = GlobalVars.cycles;
			resetSeqs();
			if(getNextInputTest() == null)
			{
				gui.wonPanel.show();
				togglePauseGame();
			}	
			else
			{
				selectedInputTest = getNextInputTest();
				GlobalVars.gameGrid.inputBlock.inputString = getInputString();
				GlobalVars.gameGrid.inputBlock.sendInitialSequence();
				GlobalVars.gameGrid.outputBlock.inputString = getInputString();
			}
		}
		else
		{
			resetSeqs();
			selectedInputTest.setState(2);
		}
		GlobalVars.cycles = 0;
	}
	public function changeSpeed()
	{
		if (speed == 0)
		{
			timer.cancel();
		 	GlobalVars.moveDuration = 0;
		}
		GlobalVars.moveDuration = Math.pow(2,1-speed);
		//timer.start(GlobalVars.moveDuration, intermediate , 0);
	}
	public function resetGame() 
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
		bgColor = GlobalVars.normalBGColor;
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
		for (i in 0 ... gui.inputTests.length) {
			gui.inputTests[i].selected = false;
			gui.inputTests[i].cycles = 0;
			gui.inputTests[i].showSelection();
			gui.inputTests[i].setState(0);
		}
	} 
	public function toggleHelpPanel()
	{
		gui.helpPanel.visible = !gui.helpPanel.visible;
		gui.helpPanelText.visible = !gui.helpPanelText.visible;
	}
	public function togglePauseGame():Void 
	{
		isPaused = !isPaused;
	}
	public function runGame():Void 
	{
		if (isRunning)
			return;
		if(!GlobalVars.runButttonEnabled)
			return;
		if(!isRunning)
		{
			isRunning = true;
			bgColor = GlobalVars.testingBGColor;
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
				GlobalVars.gameGrid.inputBlock.sendInitialSequence();
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
        if (FlxG.keys.justPressed.C)
            trace(GlobalVars.gameGrid.getBlocksCount());
	}
}