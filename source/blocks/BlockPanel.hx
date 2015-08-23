package blocks;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.plugin.MouseEventManager;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
using flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class BlockPanel extends FlxTypedGroup<FlxSprite>
{
	var background:FlxSprite;
	var blockImage:FlxSprite;
	public var directionsBoxUp:FlxSprite;
	public var directionsBoxDown:FlxSprite;
	public var directionsBoxLeft:FlxSprite;
	public var directionsBoxRight:FlxSprite;
	var choices :Int;
	var okBtn:FlxButton;
	var cancelBtn:FlxButton;
	var height:Float;
	var width:Float;
	var posX:Float;
	var posY:Float;
	var selection:Int;
	var offset = 40 - 10;
	public var block:Block;
	public var directionBoxes:FlxTypedGroup<FlxSprite>;

	
	public function new(z:Block) 
	{
		super();
		
		
		block = z;
		posX = 430+(75-8);
		posY = 100;
		//background
		background = new FlxSprite(posX-(75-8), posY-50);
		background.loadGraphic("assets/images/Container.png", false);
		add(background);
		
		if (block == null) {
			return;	
		}
		//block
		blockImage = new FlxSprite(posX-8, posY-8);
		blockImage.loadGraphicFromSprite(z);
		add(blockImage);
		
		
		directionBoxes = new FlxTypedGroup<FlxSprite>();
		
		directionsBoxDown = new FlxSprite(posX, posY+offset);
		directionsBoxDown.makeGraphic(18, 18, FlxColor.TRANSPARENT);
		directionsBoxDown.drawRoundRect(0, 0, 18, 18, 5, 5, FlxColor.BLACK);
		add(directionsBoxDown);
		directionBoxes.add(directionsBoxDown);
		
		directionsBoxUp = new FlxSprite(posX, posY-offset);
		directionsBoxUp.makeGraphic(18, 18, FlxColor.TRANSPARENT);
		directionsBoxUp.drawRoundRect(0, 0, 18, 18, 5, 5, FlxColor.BLACK);
		add(directionsBoxUp);
		directionBoxes.add(directionsBoxUp);
		
		directionsBoxLeft = new FlxSprite(posX-offset, posY);
		directionsBoxLeft.makeGraphic(18, 18, FlxColor.TRANSPARENT);
		directionsBoxLeft.drawRoundRect(0, 0, 18, 18, 5, 5, FlxColor.BLACK);
		add(directionsBoxLeft);
		directionBoxes.add(directionsBoxLeft);
		
		directionsBoxRight = new FlxSprite(posX+offset, posY);
		directionsBoxRight.makeGraphic(18, 18, FlxColor.TRANSPARENT);
		directionsBoxRight.drawRoundRect(0, 0, 18, 18, 5, 5, FlxColor.BLACK);
		add(directionsBoxRight);
		directionBoxes.add(directionsBoxRight);
	
		if(Std.is(block, FilterBlock))
		loadFromFilterBlock();
		
		if(Std.is(block, DirectionalBlock))
		loadFromDirectionalBlock();
		
		if(Std.is(block, DuplicatorBlock))
		loadFromDuplicatorBlock();
		
		if(Std.is(block, IteratorBlock))
		loadFromIteratorBlock();

		

		addArrows();
	}
	
	public function addArrows():Void {
		
		for (i in 0...choices){
			var spr = new ArrowBlock(posX-40 + i * 20, posY+offset+30, i);
			//spr.makeGraphic(18, 18, FlxColor.BLACK);
			//spr.drawRoundRect(0, 0, 18, 18, 5, 5, FlxColor.BLACK);
			add(spr);

		}
		
	}
	
	function loadFromFilterBlock():Void {	
		var make:Bool = false;
		var c:Int = 0;
		choices = 5;
		switch(block.directionBoxDown){
			case "k": c = 0;
			case "b": c = 1;
			case "g": c = 2;
			case "e": c = 3;
			case "r": c = 4;
			default: make = true;
		}
		if(!make)
		directionsBoxDown.loadGraphic("assets/images/customArrow" + c + ".png", false);
		
		
		make = false;
		switch(block.directionBoxUp){
			case "k": c = 0;
			case "b": c = 1;
			case "g": c = 2;
			case "e": c = 3;
			case "r": c = 4;
			default: make = true;
		}
		if(!make)
		directionsBoxUp.loadGraphic("assets/images/customArrow" + c + ".png", false);
		
		make = false;
		switch(block.directionBoxLeft){
			case "k": c = 0;
			case "b": c = 1;
			case "g": c = 2;
			case "e": c = 3;
			case "r": c = 4;
			default: make = true;
		}
		if(!make)
		directionsBoxLeft.loadGraphic("assets/images/customArrow" + c + ".png", false);
		
		make = false;
		switch(block.directionBoxRight){
			case "k": c = 0;
			case "b": c = 1;
			case "g": c = 2;
			case "e": c = 3;
			case "r": c = 4;
			default: make = true;
		}
		if(!make)
		directionsBoxRight.loadGraphic("assets/images/customArrow" + c + ".png", false);
	}
	
	function loadFromDirectionalBlock():Void {
		choices = 1;
		if (block.directionBoxDown == "k")
			directionsBoxDown.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxUp == "k")
			directionsBoxUp.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxLeft == "k")
			directionsBoxLeft.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxRight == "k")
			directionsBoxRight.loadGraphic("assets/images/customArrow0.png", false);

	}
	
	function loadFromDuplicatorBlock():Void {
		choices = 1;
		if (block.directionBoxDown == "k")
			directionsBoxDown.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxUp == "k")
			directionsBoxUp.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxLeft == "k")
			directionsBoxLeft.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxRight == "k")
			directionsBoxRight.loadGraphic("assets/images/customArrow0.png", false);

	}
	
	function loadFromIteratorBlock():Void {
	choices = 2;
		if (block.directionBoxDown == "k")
			directionsBoxDown.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxUp == "k")
			directionsBoxUp.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxLeft == "k")
			directionsBoxLeft.loadGraphic("assets/images/customArrow0.png", false);
		if (block.directionBoxRight == "k")
			directionsBoxRight.loadGraphic("assets/images/customArrow0.png", false);
			
		if (block.directionBoxDown == "b")
			directionsBoxDown.loadGraphic("assets/images/customArrow1.png", false);
		if (block.directionBoxUp == "b")
			directionsBoxUp.loadGraphic("assets/images/customArrow1.png", false);
		if (block.directionBoxLeft == "b")
			directionsBoxLeft.loadGraphic("assets/images/customArrow1.png", false);
		if (block.directionBoxRight == "b")
			directionsBoxRight.loadGraphic("assets/images/customArrow1.png", false);

	}
	
	override public function update():Void 
	{
		super.update();
		if (FlxG.mouse.justPressed) {
				var click:FlxSprite = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y);
				FlxG.overlap(click, directionBoxes, clearBox);
		}
	}
	
	
	function clearBox(_, box:FlxSprite):Void {
		box.loadGraphicFromSprite(ArrowBlock.emptyBlock);
		if (directionsBoxUp == box) {
					block.directionBoxUp = "";
		}
		if (directionsBoxDown == box) {
					block.directionBoxDown = "";
		}
		if (directionsBoxLeft == box) {
					block.directionBoxLeft = "";
		}
		if (directionsBoxRight == box) {
					block.directionBoxRight = "";
		}
			
	}
}	