package util ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;

class BitmapText extends FlxBitmapText
{
	public function new(font:FlxBitmapFont,scaleValue:Float = .3)
	{
		super(GlobalVars.font);
		useTextColor = false;
		color = 0xFFFFFF;
		multiLine = true;

		scale.set(scaleValue,scaleValue);

		autoSize = false;
		fieldWidth = Math.floor(FlxG.width*1.6);
	}
	public function changeText(text:String):Void
	{
		if(this.text != text)
		{
			this.text = text;
			offset.y = height * (1-scale.y) *.5;
			offset.x = width * (1-scale.x) *.5;
			width = FlxG.width*scale.x;
		}
	}
}