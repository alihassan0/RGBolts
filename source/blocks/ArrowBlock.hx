package blocks;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class ArrowBlock extends FlxSprite
{
	var arrowcolor:Int;
	var followMouse:Bool = false;
	
	public function new(x:Float, y:Float, c:Int) 
	{
		super(x, y);
		arrowcolor = c;
		loadGraphic("assets/images/customArrow" + c + ".png", false);
		MouseEventManager.add(this, onDown, onUp, null, null);
	}
	function onDown(_) {
		followMouse = true;
		addBlockInPlace();
	}
	
	
	function onUp(_){
		followMouse = false;
		checkPosition();
	}
	function addBlockInPlace(){
		GlobalVars.customizationPanel.add(new ArrowBlock(x, y, arrowcolor));
	}
	function checkPosition() { 
		
		var boxes = GlobalVars.customizationPanel.directionBoxes;
		if (!FlxG.overlap(this, boxes, snapToDirectionBox)) {
				kill();
		}
		
	}
	function snapToDirectionBox(arrowBlock:ArrowBlock, box:FlxSprite){
		box.loadGraphicFromSprite(this);
		this.kill();
	}
	
	override public function update():Void 
	{
		super.update();
		if ((!GlobalVars.level.isRunning) && followMouse) {
			x = FlxG.mouse.x-9;
			y = FlxG.mouse.y-9;
		}
		
	}
}