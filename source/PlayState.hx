package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import customizationPanel.*;
import util.*;

import flash.display.DisplayObject;
import openfl.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import format.SWF;
import openfl.Assets;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display.Loader;
import flash.Lib;



/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */

	override public function create():Void
	{
		super.create();

       
        var bytes = Assets.getBytes("assets/swf/splash.swf");
		trace("Bytes " + bytes.length);

		var loader:Loader = new Loader();
		loader.loadBytes(bytes);

		loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function (_) {
	    var mc:MovieClip = cast(loader.content, MovieClip);
	    FlxG.stage.addChild(mc);
	    });

	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}	
}