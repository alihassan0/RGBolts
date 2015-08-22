package blocks;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
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
	var block:FlxSprite;
	var directionsBoxUp:FlxSprite;
	var directionsBoxDown:FlxSprite;
	var directionsBoxLeft:FlxSprite;
	var directionsBoxRight:FlxSprite;
	var choices :Array<FlxSprite>;
	var okBtn:FlxButton;
	var cancelBtn:FlxButton;
	var height:Float;
	var width:Float;
	var posX:Float;
	var posY:Float;
	var selection:Int;

	
	public function new(?z:FilterBlock) 
	{
		super();
		posX = 400;
		posY = 210;
		var offset = 50 - 10;
		
		//background
		background = new FlxSprite(posX-(75-8), posY-50);
		//background.makeGraphic(Math.floor(posX), Math.floor(posY), FlxColor.TRANSPARENT);
		//background.drawRoundRect(0, 0, 150, 150, 30, 30, FlxColor.GRAY);
		background.loadGraphic("assets/images/Container.png", false);
		add(background);
		
		//block
		block = new FlxSprite(posX-8, posY-8);
		block.loadGraphicFromSprite(z);
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
		
		
		choices = new Array<FlxSprite>();
		for (i in 0...5){
			var spr = new FlxSprite(posX + i * 20, posY+offset+20);
			spr.makeGraphic(18, 18, FlxColor.BLACK);
			add(spr);

		}
		
		
	}
	
}	