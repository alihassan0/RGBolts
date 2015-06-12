package seq ;
import blocks.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class Seq extends FlxSprite
{
	private var position(get, null):FlxPoint;
	public var direction:FlxPoint ;
	public var seqString:String = "";
	public var seqRepresenter:SeqRepresenter;
	public var canMove:Bool = true;
	public function new(posX:Int,posY:Int, initialString:String) 
	{
		position = new FlxPoint(posX, posY);
		var spritePos:FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(position);
		super(spritePos.x, spritePos.y);
		loadGraphic("assets/images/seq.png");
		FlxG.state.add(this);
		GlovalVars.Seqs.push(this);
		direction = new FlxPoint(1, 0);
		trace(this);
		seqRepresenter = new SeqRepresenter();
		seqRepresenter.seqParent = this;
		setString(initialString);
		MouseEventManager.add(this, null, null, onOver, onOut);
	}
	
	public function getString():String
	{
		return seqString;
	}
	public function setString(newString:String) 
	{
		this.seqString = newString;
		switch(seqString.charAt(0))
		{
			case 'r': color = 0xFFFF0000;
			case 'g': color = 0xFF00FF00;
			case 'b': color = 0xFF0000FF;
			default : color = 0xFF000000;
		}
		seqRepresenter.set_seqString(newString);
	}
	
	function onOver(Sprite:FlxSprite) 
	{
		seqRepresenter.show(true);
		//FlxG.log.add("over");
	}
	function onOut(Sprite:FlxSprite) 
	{
		seqRepresenter.show(false);
		//FlxG.log.add("out");
	}

	public function move()
	{
		position.addPoint(direction);
		if (!(position.x < GlovalVars.gameGrid.get_gridWidth() && position.x >= 0 && position.y < GlovalVars.gameGrid.get_gridHeight() && position.y >= 0))
		{
			position.subtractPoint(direction);
			kill();
		}
		else
		{
			var spritePos:FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(spritePos.x, spritePos.y);
		}
		canMove = true;
		var currBLock:Block = GlovalVars.gameGrid.getBlockOfPos(position);
		if (currBLock != null)
		{
			if(currBLock.enabled)
			currBLock.affectSeq(this);
			affectBlock(currBLock);
		}
		if (seqRepresenter != null)
		seqRepresenter.represent();
	}
	override public function kill():Void 
	{
		super.kill();
		alpha = .3;
		FlxG.watch.remove(this);
		seqRepresenter.kill();
	}
	public function wait() 
	{
		canMove = false;
	}
	public function unwait() 
	{
		canMove = true;
	}
	public function showSeq():Void
	{
		
	}
	public function affectBlock(b:Block)
	{
		
	}
	
	public function set_direction(value:FlxPoint):FlxPoint 
	{
		return direction = value;
	}
	
	public function get_direction():FlxPoint 
	{
		return direction;
	}
	
	public function get_position():FlxPoint 
	{
		return position;
	}
}