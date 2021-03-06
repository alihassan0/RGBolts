package seq ;
import blocks.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.math.FlxPoint;
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
	public var position:FlxPoint;
	private var initialPosition:FlxPoint;
	public var direction:FlxPoint ;
	public var lastDirection:FlxPoint ;
	public var seqString:String = "";
	
	public var canMove:Bool = true;
	private var tween:FlxTween;
	public  var seqElements:Array<SeqElem>;
	private var MoveReady:Bool;
	private var elemIndex:Int =0;
	private var normalOfst:Int = 12;
	private var ofst:Int;
	private var MoveTimer:FlxTimer;
	private var actionTimer:FlxTimer;
	private var distinationPoint:FlxPoint;
	private var firstElemPositions:Array<FlxPoint>;

	public function new(posX:Int,posY:Int, initialString:String) 
	{
		position = new FlxPoint(posX, posY);
		initialPosition = GlobalVars.gameGrid.getCoordinatesOfPosition(position);
		super(initialPosition.x, initialPosition.y);

		loadGraphic("assets/images/seq/seq.png");
		visible = false;
		
		GlobalVars.level.gui.seqGroup.add(this);
		GlobalVars.Seqs.push(this);
		direction = new FlxPoint(0, 0);
		lastDirection = new FlxPoint(0, 0);
		
		
		setString(initialString);
		FlxMouseEventManager.add(this, null, null, onOver, onOut);
		seqElements = new Array<SeqElem>();

		var index:Int;
		var numOfElements:Int = initialString.length;
		for (i in 0 ... numOfElements) {
			index = numOfElements-1-i;
			var color = (index<initialString.length)?getColor(initialString.charAt(index)):0xffffffff;
			var elem:SeqElem = new SeqElem(x,y,color,this);
			/*if(i>GlobalVars.maxVisibleElemesInSeq)
				elem.visible = false;*/
			GlobalVars.level.gui.seqGroup.add(elem);
			seqElements.unshift(elem);
		}
		actionTimer = new FlxTimer();
		firstElemPositions = new Array<FlxPoint>();
		ofst = normalOfst;
		//FlxG.watch.add(this,"x");
	}
	override public function update(elapsed:Float) 
	{
		super.update(elapsed);
		moveElementsOneByOne();
	}
	public function moveElementsOneByOne()
	{
		if(elemIndex == seqElements.length)
			return;
		seqElements[0].direction = direction;
		firstElemPositions.unshift(FlxPoint.get(seqElements[0].x, seqElements[0].y));
		if (firstElemPositions.length >= seqElements.length*ofst)
		{
			firstElemPositions.pop();
		}
		for (i in 1 ... seqElements.length) {
			if(i*ofst < firstElemPositions.length)
				seqElements[i].reset(firstElemPositions[i*ofst].x,firstElemPositions[i*ofst].y);
		}
	}
	public function moveNextElem(t:FlxTimer)
	{
		flixel.FlxG.log.add(elemIndex);
		if(elemIndex >= seqElements.length)
			return;
		elemIndex ++;
		if(elemIndex < seqElements.length)
			MoveTimer.start(.1,moveNextElem,1);
	}
	public function getString():String
	{
		return seqString;
	}
	public function setString(newString:String) 
	{
		this.seqString = newString;
		color = getColor(seqString.charAt(0));
		
	}
	public function getColor(c:String):Int
	{
		var color:Int ;
		switch(c)
		{
			case 'r': color = 0xFFFF0000;
			case 'g': color = 0xFF00FF00;
			case 'b': color = 0xFF0000FF;
			case 'k': color = 0xFF000000;
			default : color = 0xFF000000;
		}
		return color;
	}
	public function onOver(Sprite:FlxSprite) 
	{
		
		//FlxG.log.add("over");
	}
	public function onOut(Sprite:FlxSprite) 
	{
		
		//FlxG.log.add("out");
	}
	public function action()
	{
		if(canMove)
			move();
		canMove = true;
		if (GlobalVars.gameGrid.getBlockOfPos(position) != null && alive)
		{
			affect();
		}
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
			initialPosition = GlobalVars.gameGrid.getCoordinatesOfPosition(position);
			reset(initialPosition.x,initialPosition.y);
			elemIndex = 0;
			ofst = Math.floor(normalOfst*GlobalVars.moveDuration);
			//seqElements[0].direction = direction;
		}
	}
	public function affect()
	{
		var currBLock:Block = GlobalVars.gameGrid.getBlockOfPos(position);		
		if(currBLock.enabled )
		{
			currBLock.affectSeq(this);
		}
		affectBlock(currBLock);
		
			
	}
	public function removeFirst()
	{
		if(seqElements.length>1)
		{
			seqElements[1].reset(seqElements[0].x,seqElements[0].y);
			seqElements.shift().kill();
			flixel.FlxG.log.add("a");
		}
		else
		{
			kill();
			flixel.FlxG.log.add("b");
		}
	}
	public function insertLast(s:Seq)
	{
		/*seq.initialPosition += s.getString();
		for (i in 0 ... s.getString().length) {
			var color = getColor(s.charAt(i));
			var elem:SeqElem = new SeqElem(x,y,color,this);
			GlobalVars.level.seqGroup.add(elem);
			seqElements.push(elem);
		}*/
	}
	public function insertFirst(se:SeqElem)
	{
		seqElements.push(se);
	}
	public function wait() 
	{
		direction = new FlxPoint(0,0);
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
	public function setDirection(value:FlxPoint):FlxPoint 
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
	override public function kill():Void 
	{
		while (seqElements.length != 0)
		{
			seqElements[0].alpha = 0;
			seqElements.shift().kill();	
		}
		//FlxG.watch.remove(this);
		
		super.kill();
	}
}