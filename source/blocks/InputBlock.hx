package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroupIterator;
import flixel.util.FlxPoint;
import seq.Seq;
import util.*;
class InputBlock extends Block
{
	private var direction:FlxPoint ;
	public var inputString:String ;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/blocks/grid/input.png");
		followMouse = false;
		GlobalVars.gameGrid.inputBlock = this;
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		s.setDirection(Util.directionToFlxPoint[Direction.right]);
	}
	override public function checkPosInGrid():Bool
	{
		var bestfit:FlxPoint = GlobalVars.gameGrid.addInBestFit(this);
		if(bestfit == null)
		{
			var p :FlxPoint = GlobalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(p.x, p.y);
			return false;
		}
		else
		{
			this.reset(bestfit.x, bestfit.y);
			this.position = GlobalVars.gameGrid.getposOfBlock(this);
			return true;
		}
	}
	public function sendInitialSequence() 
	{
		var seq :Seq = new Seq(Math.floor(position.x),Math.floor(position.y),inputString);
	}
	override public function onDown(Sprite:FlxSprite) 
	{
		if(!GlobalVars.level.isRunning && GlobalVars.mainBlocksDraggingEnabled)
		{
			followMouse = true;
		}
	}	
}