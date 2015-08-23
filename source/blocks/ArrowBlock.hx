package blocks;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxColor;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class ArrowBlock extends FlxSprite
{
	var arrowcolor:Int;
	var followMouse:Bool = false;
	var cc:String;
	var emptyBlock:FlxSprite;
	
	public function new(x:Float, y:Float, c:Int) 
	{
		//black = 0
		//blue = 1
		//green = 2
		//else = 3
		//red = 4
		super(x, y);
		arrowcolor = c;
		emptyBlock = new FlxSprite(0, 0).makeGraphic(16, 16, FlxColor.BLACK);
		
		switch(c){
			case 0: cc = "k";
			case 1: cc = "b";
			case 2: cc = "g";
			case 3: cc = "e";
			case 4: cc = "r";
		}
	
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
	
	function snapToDirectionBox(arrowBlock:ArrowBlock, box:FlxSprite) {
		var panel = GlobalVars.customizationPanel;
		
		if (panel.directionsBoxUp.cachedGraphics == this.cachedGraphics) {
				panel.directionsBoxUp.loadGraphicFromSprite(emptyBlock);
				panel.block.directionBoxUp = "";
		}
		if (panel.directionsBoxDown.cachedGraphics == this.cachedGraphics) {
				panel.directionsBoxDown.loadGraphicFromSprite(emptyBlock);
				panel.block.directionBoxDown = "";
		}
		if (panel.directionsBoxLeft.cachedGraphics == this.cachedGraphics) {
				panel.directionsBoxLeft.loadGraphicFromSprite(emptyBlock);
				panel.block.directionBoxLeft = "";
		}
		if (panel.directionsBoxRight.cachedGraphics == this.cachedGraphics) {
				panel.directionsBoxRight.loadGraphicFromSprite(emptyBlock);
				panel.block.directionBoxRight = "";
		}
	
		
		
		if (box == panel.directionsBoxDown) 
			panel.block.addDirection("down", cc);
		if (box == panel.directionsBoxUp)
			panel.block.addDirection("up", cc);
		if (box == panel.directionsBoxLeft)
			panel.block.addDirection("left", cc);
		if (box == panel.directionsBoxRight)
			panel.block.addDirection("right", cc);
		
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