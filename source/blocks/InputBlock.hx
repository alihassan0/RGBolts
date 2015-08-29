package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroupIterator;
import flixel.util.FlxPoint;
import seq.Seq;

/**
 * ...
 * @author ...
 */
class InputBlock extends Block
{
	private var direction:FlxPoint ;
	public var started:Bool = false;
	public var inputString:String ;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/input.png");
		followMouse = false;
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
	override public function update():Void 
	{
 		super.update();
		if (started)
		{
			var seq :Seq = new Seq(Math.floor(position.x),Math.floor(position.y),inputString);
			started = false;
		}
	}
	override public function onDown(Sprite:FlxSprite) 
	{
		if(!GlobalVars.level.isRunning)
		{
			followMouse = true;
		}
	}	
}