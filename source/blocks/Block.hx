package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.effects.FlxFlicker;
import level.Level;
import seq.Seq;
import customizationPanel.*;
import util.*;
/**
 * ...
 * @author ...
 */
class Block extends FlxSprite
{
	public var followMouse:Bool = false;
	public var position:FlxPoint = new FlxPoint(0, 0);
	public var mouseOffset:FlxPoint;
	public var enabled:Bool = true;
	public var arrowSprites:Array<ArrowSprite>;
	public function new(X:Float,Y:Float)
	{
		super(X, Y);
		MouseEventManager.add(this, onDown, null, null, null);
		GlobalVars.level.blocksGroup.add(this);
		followMouse = true;
		arrowSprites = new Array<ArrowSprite>();
		if(mouseOffset == null)
			mouseOffset = new FlxPoint(width/2, height/2);
		
	}
	override public function update():Void 
	{
		super.update();
		if (followMouse)
		{
			reset(FlxG.mouse.x - mouseOffset.x,FlxG.mouse.y - mouseOffset.y);
			if(!FlxG.mouse.pressed)
			{
				followMouse = false;
				if(checkPosInGrid())//later i need to make sure to do a check for the block type
						GlobalVars.level.checkForTutorial("directional_place");
			}
		}
		this.angle = angle;
	
	
	}
	public function checkPosInGrid() //adds the block to the grid if possible
	{
		var bestfit:FlxPoint = GlobalVars.gameGrid.addInBestFit(this);
		if(bestfit == null)
		{
			GlobalVars.gameGrid.removeFromGrid(this);
			kill();
			return false;
		}
		else
		{
			this.reset(bestfit.x, bestfit.y);
			this.position = GlobalVars.gameGrid.getposOfBlock(this);
			return true;
		}
	}
	public function toggleEnabled(?s:Seq)
	{
		enabled = !enabled;
		if(!enabled)
		{
			alpha = .6;
		}
		else
		{
			alpha = 1;
		}
	}
	public function reset_state()
	{
		if(!enabled)
		toggleEnabled();
	}
	public function onDown(Sprite:FlxSprite)
	{
		if(!GlobalVars.level.isRunning)
		{
			followMouse = true;
			mouseOffset.set(FlxG.mouse.x - x,FlxG.mouse.y- y);
			Level.level.changePanel(this);
			if (GlobalVars.selectedBlock != null){
				GlobalVars.selectedBlock.alpha = 1;
			}
			alpha = 0.5;
			GlobalVars.selectedBlock = this;
		}
		if(checkPosInGrid())//later i need to make sure to do a check for the block type :"|
			GlobalVars.level.checkForTutorial("directional_rotate");

	}
	public function addCustomizableBlock(X:Float , Y:Float,block:Block):CustomizableBlock
	{
		return null;
	}
	public function affectSeq(s:Seq)
	{
		FlxFlicker.flicker(this, .5, 0.04);
		FlxG.sound.play("assets/sounds/powerup.wav", .5);
	}
	public function direct(s:Seq,direction:Direction)
	{
		/*var dir:Int = Math.floor((angle % 360) / 90);
		switch(dir)
		{
			case 0:
				switch(direction)
				{
					case GlobalVars.UP: s.setDirection();
					case GlobalVars.DOWN: s.setDirection(new FlxPoint(0,1));
					case GlobalVars.LEFT: s.setDirection(new FlxPoint(-1,0));
					case GlobalVars.RIGHT: s.setDirection(new FlxPoint(1,0));
				}
			case 1:
				switch(direction)
				{
					case GlobalVars.UP: s.setDirection(new FlxPoint(1,0));
					case GlobalVars.DOWN: s.setDirection(new FlxPoint(-1,0));
					case GlobalVars.LEFT: s.setDirection(new FlxPoint(0,-1));
					case GlobalVars.RIGHT: s.setDirection(new FlxPoint(0,1));
				}
			case 2:
				switch(direction)
				{
					case GlobalVars.UP: s.setDirection(new FlxPoint(0,1));
					case GlobalVars.DOWN: s.setDirection(new FlxPoint(0,-1));
					case GlobalVars.LEFT: s.setDirection(new FlxPoint(1,0));
					case GlobalVars.RIGHT: s.setDirection(new FlxPoint(-1,0));
				}
			case 3:
				switch(direction)
				{
					case GlobalVars.UP: s.setDirection(new FlxPoint(-1,0));
					case GlobalVars.DOWN: s.setDirection(new FlxPoint(1,0));
					case GlobalVars.LEFT: s.setDirection(new FlxPoint(0,1));
					case GlobalVars.RIGHT: s.setDirection(new FlxPoint(0,-1));
				}
		}*/
	}
	override public function reset (x:Float, y:Float)
	{
		super.reset(x,y);
		for (i in 0 ... arrowSprites.length) {
			arrowSprites[i].setPosition(x,y);
		}
	}
	override public function kill()
	{
		super.kill();
		for (i in 0 ... arrowSprites.length) {
			arrowSprites[i].kill();
		}
	}
	public function loadCustomBehaviour(block:CustomizableBlock)
	{
		
	}
}