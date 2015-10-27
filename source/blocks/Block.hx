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
		GlobalVars.level.gui.blocksGroup.add(this);
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
				if(checkPosInGrid() && position.x == 7 && position.y == 3)//later i need to make sure to do a check for the block type
						TutVars.checkForTutorial("directional_place");
			}
		}
		this.angle = angle;
	}
	private function getArrowByColor(color:Color):ArrowSprite
	{
		for (i in 0 ... arrowSprites.length)
		{
			if(arrowSprites[i].rgbColor == color)
				return arrowSprites[i];
		}
		return null;
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
		if(!GlobalVars.level.isRunning && GlobalVars.blocksCreatingEnabled)//it should be dragging but removed to avoid duplicating
		{
			followMouse = true;
			mouseOffset.set(FlxG.mouse.x - x,FlxG.mouse.y- y);	
		}
		if(GlobalVars.customizationEnabled)
		{
			if(level.GUI.customizationPanel.customizableBlock  == null ||
			   this != level.GUI.customizationPanel.customizableBlock.block)//don't load it again if it's already loaded
			{
				GlobalVars.level.changePanel(this);
				if (GlobalVars.selectedBlock != null){
					GlobalVars.selectedBlock.alpha = 1;//unselect the last block
				}
				alpha = 0.5;
				GlobalVars.selectedBlock = this;
			}
		}
		if(checkPosInGrid())
			TutVars.checkForTutorial("directional_customize");

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
		
	}
	public function getSaveString():String
	{
		return "";
	}
	public function loadSaveString(saveString:String)
	{
		
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
		if(level.GUI.customizationPanel.customizableBlock != null && this == level.GUI.customizationPanel.customizableBlock.block)
		{
			level.GUI.customizationPanel.customizableBlock.kill();
			level.GUI.customizationPanel.customizableBlock.destroy();
		}	
	}
	public function loadCustomBehaviour(block:CustomizableBlock)
	{
		
	}
}