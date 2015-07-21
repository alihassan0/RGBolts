package seq ;
import blocks.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxPoint;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.tweens.FlxEase;
/**
 * ...
 * @author ...
 */
class Seq extends FlxSprite
{
	private var position(get, null):FlxPoint;
	public var direction:FlxPoint ;
	public var seqString:String = "";
	public var seqRepresenter:SeqRepresenter;
	public var canMove:Bool = true;
	private var tween:FlxTween;
	private var seqElements:Array<SeqElem>;
	private var MoveReady:Bool;
	private var elemIndex:Int;
	private var MoveTimer:FlxTimer;
	private var actionTimer:FlxTimer;
	private var distinationPoint:FlxPoint;
	public function new(posX:Int,posY:Int, initialString:String) 
	{
		position = new FlxPoint(posX, posY);
		var spritePos:FlxPoint = GlobalVars.gameGrid.getCoordinatesOfPosition(position);
		super(spritePos.x, spritePos.y);
		loadGraphic("assets/images/seq.png");
		visible = false;
		FlxG.state.add(this);
		GlobalVars.Seqs.push(this);
		direction = new FlxPoint(1, 0);
		seqRepresenter = new SeqRepresenter();
		seqRepresenter.seqParent = this;
		setString(initialString);
		MouseEventManager.add(this, null, null, onOver, onOut);
		seqElements = new Array<SeqElem>();
		var index:Int;
		var numOfElements:Int = Math.floor(Math.min(3,initialString.length));
		for (i in 0 ... numOfElements) {
			index = numOfElements-1-i;
			var color = (index<initialString.length)?getColor(initialString.charAt(index)):0xffffffff;
			var elem:SeqElem = new SeqElem(x,y,color);
			FlxG.state.add(elem);
			seqElements.unshift(elem);
		}
		actionTimer = new FlxTimer();
		
	}
	
	public function getString():String
	{
		return seqString;
	}
	public function setString(newString:String) 
	{
		this.seqString = newString;
		color = getColor(seqString.charAt(0));
		seqRepresenter.set_seqString(newString);
	}
	public function getColor(c:String):Int
	{
		var color:Int ;
		switch(c)
		{
			case 'r': color = 0xFFFF0000;
			case 'g': color = 0xFF00FF00;
			case 'b': color = 0xFF0000FF;
			default : color = 0xFF000000;
		}
		return color;
	}
	function onOver(Sprite:FlxSprite) 
	{
		seqRepresenter.show(true);
		//FlxG.log.add("over");
	}
	function onOut(Sprite:FlxSprite) 
	{
		seqRepresenter.show(false);
		//FlxG.log.add("out");
	}
	function moveTween(p:FlxPoint) 
	{
		var options:TweenOptions = { type: FlxTween.ONESHOT}
		distinationPoint = p;
		
		if (tween != null) {
			tween.cancel();
		}
		var offset:Int;
		if(MoveTimer == null)
			MoveTimer = new FlxTimer();

		elemIndex = 0;
		MoveTimer.start(.1,moveNextElem,1);
		for (i in 0 ... seqElements.length) {
			tween = FlxTween.tween(this, { x: p.x, y: p.y}, GlobalVars.moveDuration, options);		
		}
		tween = FlxTween.tween(this, { x: p.x, y: p.y}, GlobalVars.moveDuration, options);		
	}
	public function moveNextElem(t:FlxTimer)
	{
		trace(elemIndex);
		var options:TweenOptions = { type: FlxTween.ONESHOT}
		if (seqElements[elemIndex].tween != null) {
			seqElements[elemIndex].tween.cancel();
		}
		seqElements[elemIndex].tween = FlxTween.tween(seqElements[elemIndex], { x: distinationPoint.x, y: distinationPoint.y}, GlobalVars.moveDuration, options);
		elemIndex ++;
		if(elemIndex < seqElements.length)
			MoveTimer.start(.1,moveNextElem,1);
	}
	public function move()
	{
		position.addPoint(direction);
		if (!(position.x < GlobalVars.gameGrid.get_gridWidth() && position.x >= 0 && position.y < GlobalVars.gameGrid.get_gridHeight() && position.y >= 0))
		{
			position.subtractPoint(direction);
			kill();
		}
		else
		{
			var spritePos:FlxPoint = GlobalVars.gameGrid.getCoordinatesOfPosition(position);
			if(GlobalVars.moveDuration != 0)
			moveTween(spritePos);
			else
			reset(spritePos.x, spritePos.y);
		}
		if (GlobalVars.gameGrid.getBlockOfPos(position) != null)
		{
			if(!actionTimer.finished)
				trace("not finished yet "+ position);
			actionTimer.start(GlobalVars.moveDuration*.9,action,1);
		}
	}
	public function action(t:FlxTimer)
	{
		canMove = true;
		trace("action made @"+position);
		var currBLock:Block = GlobalVars.gameGrid.getBlockOfPos(position);		
		if(currBLock.enabled && (!Std.is(this, Signal)||Std.is(currBLock, DirectionalBlock)))
		{
			currBLock.affectSeq(this);
			affectBlock(currBLock);
		}
		if (seqRepresenter != null)
		seqRepresenter.represent();

	}
	override public function kill():Void 
	{
		super.kill();
		alpha = .3;
		FlxG.watch.remove(this);
		seqRepresenter.kill();
	}
	public function wait() 
	{
		canMove = false;
	}
	public function unwait() 
	{
		canMove = true;
	}
	public function showSeq():Void
	{
		
	}
	public function affectBlock(b:Block)
	{
		
	}
	
	public function set_direction(value:FlxPoint):FlxPoint 
	{
		return direction = value;
	}
	
	public function get_direction():FlxPoint 
	{
		return direction;
	}
	
	public function get_position():FlxPoint 
	{
		return position;
	}
}