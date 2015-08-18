package blocks ;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import seq.Seq;

/**
 * ...
 * @author ...
 */
class DirectionalBlock extends Block
{
	
	public function new(X:Int,Y:Int) 
	{
		
		super(X, Y);
		loadGraphic("assets/images/directionalUp.png");
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		var dir:Int = Math.floor((angle % 360) / 90);
		switch(dir)
		{
			case 0: s.set_direction(new FlxPoint(0,-1));
			case 1: s.set_direction(new FlxPoint(1,0));
			case 2: s.set_direction(new FlxPoint(0,1));
			case 3: s.set_direction(new FlxPoint(-1,0));
		}
	}
	/*override public function update():Void 
	{
		
		
				switch(dirctn){
					case 0:loadGraphic("assets/images/directionalUp.png");
					case 1:loadGraphic("assets/images/directionalRight.png");
					case 2:loadGraphic("assets/images/directionalDown.png");
					case 3:loadGraphic("assets/images/directionalLeft.png");
				}
		super.update();
		}*/
		
	}

