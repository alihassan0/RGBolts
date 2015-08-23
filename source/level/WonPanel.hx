package level;

import flixel.group.FlxTypedGroup;
import flixel.FlxSprite;

class WonPanel extends FlxTypedGroup<FlxSprite>
{
	var bg:FlxSprite;
	var congratsTxt:FlxSprite;
	public function new() 
	{
		super();
		add(bg  = new FlxSprite(170,165).makeGraphic(300,150,0xff000000));
		add(congratsTxt = new flixel.text.FlxText(bg.x + 30,bg.y + 10,bg.width - 60, "congratulation").setFormat(null, 16 , 0xffffff,"center"));
	}
}