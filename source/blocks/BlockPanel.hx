package blocks;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
using flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Ahmed El Sayegh
 */
class BlockPanel extends FlxGroup
{
	var background:FlxSprite;
	var block:FlxSprite;
	var directionsBoxUp:FlxSprite;
	var directionsBoxDown:FlxSprite;
	var directionsBoxLeft:FlxSprite;
	var directionsBoxRight:FlxSprite;
	var okBtn:FlxButton;
	var cancelBtn:FlxButton;
	var height:Float;
	var width:Float;
	var posX:Float;
	var posY:Float;
	
	public function new(?x:FilterBlock) 
	{
		super();
		
		posX = 75-8;
		posY = 45;
		var offset = 50 - 10;
		//background
		background = new FlxSprite();
		background.makeGraphic(150, 150, FlxColor.TRANSPARENT);
		background.drawRoundRect(0, 0, 150, 150, 30, 30, FlxColor.GRAY);
		add(background);
		
		//block
		block = new FlxSprite(posX-8, posY-8);
		block.loadGraphicFromSprite(x);
		add(block);
		
		directionsBoxDown = new FlxSprite(posX, posY+offset);
		directionsBoxDown.makeGraphic(18, 18, FlxColor.BLACK);
		//directionsBoxDown.drawRoundRect(0, 0, 36, 36, 30, 30, FlxColor.CYAN);
		add(directionsBoxDown);
		
		directionsBoxUp = new FlxSprite(posX, posY-offset);
		directionsBoxUp.makeGraphic(18, 18, FlxColor.BLACK);
		//directionsBoxDown.drawRoundRect(0, 0, 36, 36, 30, 30, FlxColor.CYAN);
		add(directionsBoxUp);
		
		directionsBoxLeft = new FlxSprite(posX-offset, posY);
		directionsBoxLeft.makeGraphic(18, 18, FlxColor.BLACK);
		//directionsBoxDown.drawRoundRect(0, 0, 36, 36, 30, 30, FlxColor.CYAN);
		add(directionsBoxLeft);
		
		directionsBoxRight = new FlxSprite(posX+offset, posY);
		directionsBoxRight.makeGraphic(18, 18, FlxColor.BLACK);
		//directionsBoxDown.drawRoundRect(0, 0, 36, 36, 30, 30, FlxColor.CYAN);
		add(directionsBoxRight);
		
		
	}
	
}