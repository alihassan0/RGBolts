package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;
import seq.Seq;
/**
 * ...
 * @author ...
 */
class Block extends FlxSprite
{
	public var followMouse:Bool = false;
	public var position:FlxPoint = new FlxPoint(0, 0);
	public function new(X:Float,Y:Float)
	{
		super(X, Y);
		MouseEventManager.add(this, onDown, onUp, null, null);
		FlxG.state.add(this);
		followMouse = true;
	
	}
	override public function update():Void 
	{
		super.update();
		if (followMouse)
		{
			x = FlxG.mouse.x -width / 2;
			y = FlxG.mouse.y -width / 2;
			if(!FlxG.mouse.pressed)
			{
				followMouse = false;
				checkPosInGrid();
			}
		}
	}
	
	public function checkPosInGrid() //adds the block to the grid if possible
	{
		var bestfit:FlxPoint = GlovalVars.gameGrid.addInBestFit(this);
		if(bestfit == null)
		{
			GlovalVars.gameGrid.removeFromGrid(this);
			kill();
		}
		else
		{
			this.reset(bestfit.x, bestfit.y);
			this.position = GlovalVars.gameGrid.getposOfBlock(this);
		}
	}
	public function reset_state()
	{
		
	}
	public function onDown(Sprite:FlxSprite)
	{
		followMouse = true;
		angle += 90;
	}
	public function onUp(Sprite:FlxSprite)
	{
		
	}
	public function affectSeq(s:Seq)
	{
		
	}
	public function direct(s:Seq,direction:Int)
	{
		switch((angle % 360) / 90)
		{
			case 0:
				switch(direction)
				{
					case GlovalVars.UP: s.set_direction(new FlxPoint(0,-1));
					case GlovalVars.DOWN: s.set_direction(new FlxPoint(0,1));
					case GlovalVars.LEFT: s.set_direction(new FlxPoint(-1,0));
					case GlovalVars.RIGHT: s.set_direction(new FlxPoint(1,0));
				}
			case 1:
				switch(direction)
				{
					case GlovalVars.UP: s.set_direction(new FlxPoint(1,0));
					case GlovalVars.DOWN: s.set_direction(new FlxPoint(-1,0));
					case GlovalVars.LEFT: s.set_direction(new FlxPoint(0,-1));
					case GlovalVars.RIGHT: s.set_direction(new FlxPoint(0,1));
				}
			case 2:
				switch(direction)
				{
					case GlovalVars.UP: s.set_direction(new FlxPoint(0,1));
					case GlovalVars.DOWN: s.set_direction(new FlxPoint(0,-1));
					case GlovalVars.LEFT: s.set_direction(new FlxPoint(1,0));
					case GlovalVars.RIGHT: s.set_direction(new FlxPoint(-1,0));
				}
			case 3:
				switch(direction)
				{
					case GlovalVars.UP: s.set_direction(new FlxPoint(-1,0));
					case GlovalVars.DOWN: s.set_direction(new FlxPoint(1,0));
					case GlovalVars.LEFT: s.set_direction(new FlxPoint(0,1));
					case GlovalVars.RIGHT: s.set_direction(new FlxPoint(0,-1));
				}
		}
	}
}