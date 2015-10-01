package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import openfl.Assets;
import flixel.util.FlxColor;
import openfl.Assets.AssetLibrary;
import flash.display.MovieClip;
import format.SWF;

class MenuState extends FlxState
{
	
	override public function create():Void
	{
		/*var mSwf:SWF = new SWF(Assets.getBytes("assets/splash.swf"));
		var movieClip:MovieClip = mSwf.createMovieClip();
		FlxG.stage.addChild(movieClip);*/
		FlxG.log.add("horse.totalFrames");
		//Assets.loadLibrary ("assets/LD27.swf", function (_) { var clip = Assets.getMovieClip ("library:stage"); FlxG.stage.addChild (clip); }); 
		Assets.loadLibrary("test", swfAssetsLoaded);

		var clip:MovieClip = Assets.getMovieClip ("layout:Layout");
		FlxG.stage.addChild (clip);
	}

	private function swfAssetsLoaded(_):Void 
    {
        var horse = Assets.getMovieClip("splash:");
        FlxG.stage.addChild(horse);
        FlxG.log.add(horse.totalFrames);
		add(new FlxSprite(0,0).makeGraphic(30,30));
		/*FlxG.camera.bgColor = FlxColor.TRANSPARENT;
        horse.x = 0;
        horse.y = 0;
		horse.width = horse.width;
		horse.height = horse.height;*/
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
