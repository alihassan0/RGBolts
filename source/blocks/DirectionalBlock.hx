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
			if ("k" == directionBoxDown){
			direct(s, GlobalVars.DOWN);
			}
			if ("k" == directionBoxUp){
				direct(s, GlobalVars.UP);
			}
			if ("k" == directionBoxLeft){
				direct(s, GlobalVars.LEFT);
			}
			if ("k" == directionBoxRight){
				direct(s, GlobalVars.RIGHT);
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

