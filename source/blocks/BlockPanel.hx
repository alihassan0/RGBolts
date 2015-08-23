package blocks;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.plugin.MouseEventManager;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
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
	
		loadFromBlock();

		choices = 5;
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
	
	function loadFromBlock():Void {	
		var make:Bool = false;
		var c:Int = 0;
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
	
	
}	