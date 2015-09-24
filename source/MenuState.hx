package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import openfl.Assets;
import flixel.util.FlxColor;
import openfl.Assets.AssetLibrary;

class MenuState extends FlxState
{
	
	override public function create():Void
	{
	//bgColor = FlxColor.PINK;
	   super.create();
	Assets.loadLibrary("test", swfAssetsLoaded);
	}

	private function swfAssetsLoaded(_):Void 
    {
        var horse = Assets.getMovieClip("test:splash");
        FlxG.addChildBelowMouse(horse, -1);
		//FlxG.camera.bgColor = FlxColor.TRANSPARENT;
        horse.x = 0;
        horse.y = 0;
		horse.width = horse.width;
		horse.height = horse.height;
    }
	
	override public function destroy():Void
	{
		super.destroy();
	}

	
	override public function update():Void
	{
		super.update();
		
	}	
}
