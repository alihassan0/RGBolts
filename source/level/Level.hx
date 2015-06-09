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
	private var speedUp:FlxButton;
	private var speedDown:FlxButton;
	private var nextLevel:FlxButton;
	
	private var levelInfo:LevelInfo;

	private var speed:Int;
	private var timer:FlxTimer;
	private var speedText:FlxText;
	private var isRunned:Bool;
	public function new(levelInfo:LevelInfo) 
	{
		super();
		this.levelInfo = levelInfo;
		this.timer = new FlxTimer();
		this.isRunned = false;
	}
	override public function create():Void
	{
		super.create();
		FlxG.watch.addMouse();
		
		bgColor = FlxColor.WHEAT;
		new GameGrid(levelInfo.inputString,levelInfo.testFunction);
		GlovalVars.Seqs = new Array<Seq>();
		GlovalVars.level = this;
		FlxG.watch.add(GlovalVars.Seqs, "length");
		
		addUI();

		addDiscription();
		
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
	}
	function addUI()
	{
		backToMenuBtn = new FlxButton (420, 10, "Back", switchBack);
		backToMenuBtn.scale.set(0.6, 0.6);
		backToMenuBtn.updateHitbox();
		add(backToMenuBtn);
		
		runBtn = new FlxButton(470, 10, "run", runGame);
		runBtn.scale.set(0.6, 0.6);
		runBtn.updateHitbox();
		add(runBtn);
		
		resetBtn = new FlxButton(520, 10, "reset", resetGame);
		resetBtn.scale.set(0.6, 0.6);
		resetBtn.updateHitbox();
		add(resetBtn);
		
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
	function intermedita(timer:FlxTimer)
	{
		if (isRunned)
		runGame();
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
		FlxG.switchState(new Level(GlovalVars.levels[levelInfo.id]));
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
			case 0: status_txt.text = "great job";nextLevel.visible = true;//success
			case 1: status_txt.text = "try again";//fail
			case 2: status_txt.text = "         ";//wait
			case 3: status_txt.text = " testing ";//testing
		}
	}
	
	function addDiscription() 
	{
		var discription:FlxSprite = new FlxSprite(0,420).makeGraphic(640,50,0x00000000);
		var lineStyle = { color: FlxColor.RED, thickness: 1 };
		var fillStyle = { color: FlxColor.RED, alpha: 0.5 };
		discription.drawRoundRect(20, 0, 600, 50, 15, 15, 0xFFA97D5D);
		add(discription);
		
		//var text:FlxText = new FlxText(40 , 430, 450, " sort red first then green then black", 20);
		var text:FlxText = new FlxText(40 , 430, 450, levelInfo.description, 20);
		text.color = 0xAA5C755E;
		add(text);
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
		isRunned =  false;
		speed = 0;
		speedText.text =  "Speed: " + speed;
		addSpeed();
		status_change(2);
		while (GlovalVars.Seqs.length != 0)
		{
			GlovalVars.Seqs.shift().kill();
		}
		GlovalVars.gameGrid.resetBlocks();
	}
	
	
	public function runGame():Void 
	{
	isRunned = true;	
		if (GlovalVars.Seqs.length == 0)//temp starter
		{
			GlovalVars.gameGrid.inputBlock.started = true;
			status_change(3);
		}
		
		GlovalVars.turn ++;
		GlovalVars.Seqs = Lambda.array(Lambda.filter(GlovalVars.Seqs, function(v) { return (v.alive == true); } ));
		for (i in 0...GlovalVars.Seqs.length)
        {
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