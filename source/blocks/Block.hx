package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;
import flixel.effects.FlxFlicker;
import seq.Seq;
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
	/*private var blockBase:FlxSprite;
	private var blockPillers:FlxSprite;
	*/public function new(X:Float,Y:Float)
	{
		super(X, Y);
		MouseEventManager.add(this, onDown, onUp, null, null);
		GlobalVars.level.blocksGroup.add(this);
		followMouse = true;
		offset.set(0,5);
		
		/*blockPillers = new FlxSprite(X,Y,"assets/images/transparent_spacer.gif");
		GlobalVars.level.blocksGroup.add(blockPillers);
		
		blockBase = new FlxSprite(X,Y,"assets/images/transparent_spacer.gif");
		GlobalVars.level.blocksBasesGroup.add(blockBase);*/
		
	}
	override public function update():Void 
	{
		super.update();
		if (followMouse)
		{
			if(mouseOffset == null)
				mouseOffset = new FlxPoint(width/2, height/2);
			x = FlxG.mouse.x - mouseOffset.x;
			y = FlxG.mouse.y - mouseOffset.y;
			if(!FlxG.mouse.pressed)
			{
				followMouse = false;
				if(checkPosInGrid())//later i need to make sure to do a check for the block type
						GlobalVars.level.checkForTutorial("directional_place");
			}
		}
		/*blockBase.reset(x,y);
		blockPillers.reset(x,y);*/
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
			angle+= 90;
		}
		if(checkPosInGrid())//later i need to make sure to do a check for the block type :"|
			GlobalVars.level.checkForTutorial("directional_rotate");

	}
	public function onUp(Sprite:FlxSprite)
	{
		
	}
	public function affectSeq(s:Seq)
	{
		//FlxFlicker.flicker(this, .5, 0.04);
		FlxG.sound.play("assets/sounds/powerup.wav", .5);
	}
	public function direct(s:Seq,direction:Int)
	{
		var dir:Int = Math.floor((angle % 360) / 90);
		switch(dir)
		{
			case 0:
				switch(direction)
				{
					case GlobalVars.UP: s.set_direction(new FlxPoint(0,-1));
					case GlobalVars.DOWN: s.set_direction(new FlxPoint(0,1));
					case GlobalVars.LEFT: s.set_direction(new FlxPoint(-1,0));
					case GlobalVars.RIGHT: s.set_direction(new FlxPoint(1,0));
				}
			case 1:
				switch(direction)
				{
					case GlobalVars.UP: s.set_direction(new FlxPoint(1,0));
					case GlobalVars.DOWN: s.set_direction(new FlxPoint(-1,0));
					case GlobalVars.LEFT: s.set_direction(new FlxPoint(0,-1));
					case GlobalVars.RIGHT: s.set_direction(new FlxPoint(0,1));
				}
			case 2:
				switch(direction)
				{
					case GlobalVars.UP: s.set_direction(new FlxPoint(0,1));
					case GlobalVars.DOWN: s.set_direction(new FlxPoint(0,-1));
					case GlobalVars.LEFT: s.set_direction(new FlxPoint(1,0));
					case GlobalVars.RIGHT: s.set_direction(new FlxPoint(-1,0));
				}
			case 3:
				switch(direction)
				{
					case GlobalVars.UP: s.set_direction(new FlxPoint(-1,0));
					case GlobalVars.DOWN: s.set_direction(new FlxPoint(1,0));
					case GlobalVars.LEFT: s.set_direction(new FlxPoint(0,1));
					case GlobalVars.RIGHT: s.set_direction(new FlxPoint(0,-1));
				}
		}
	}
	override public function kill()
	{/*
		blockBase.kill();
		blockPillers.kill();
		GlobalVars.level.blocksGroup.remove(blockPillers);
		GlobalVars.level.blocksBasesGroup.remove(blockBase);*/
		super.kill();
	}
}