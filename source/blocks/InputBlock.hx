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
	private var inputString:String ;
	public function new(posX:Int,posY:Int,inputString:String) 
	{
		var spritePos:FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(new FlxPoint(posX, posY));
		super(spritePos.x, spritePos.y);
		position = new FlxPoint(posX, posY);
		loadGraphic("assets/images/input.png");
		followMouse = false;
		this.inputString = inputString;
	}
	override public function checkPosInGrid() 
	{
		var bestfit:FlxPoint = GlovalVars.gameGrid.addInBestFit(this);
		if(bestfit == null)
		{
			var p :FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(p.x, p.y);
		}
		else
		{
			this.reset(bestfit.x, bestfit.y);
			this.position = GlovalVars.gameGrid.getposOfBlock(this);
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
		followMouse = true;
	}	
}