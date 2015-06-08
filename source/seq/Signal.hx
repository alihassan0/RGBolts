package seq.Signal;

import flixel.FlxSprite;

class Signal extends flixel.FlxSprite{
	
	private var position(get, null):FlxPoint;
	public var direction:FlxPoint ;
	
	public function new ()
	{
		position = new FlxPoint(posX, posY);
		var spritePos:FlxPoint = GlovalVars.gameGrid.getCoordinatesOfPosition(position);
		super(spritePos.x, spritePos.y);
		loadGraphic("assets/images/signal.png");
		FlxG.state.add(this);
		//GlovalVars.Signals.push(this);
	}
}