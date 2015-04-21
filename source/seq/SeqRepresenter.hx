package seq ;
import flixel.FlxG;
import flixel.*;

/**
 * ...
 * @author ...
 */
class SeqRepresenter extends FlxSprite
{
	public var seqString:String ;
	public var seqColorArray:Array<SeqColor>;
	public var seqParent:Seq;
	
	public function new() 
	{

		super(5,5);
		//trace("working");
		super(x,y);
		seqColorArray = new Array();
		makeGraphic(1 + seqColorArray.length * 10, 10);
		FlxG.state.add(this);
		show(false);
	}	
	override public function kill():Void 
	{
		super.kill();
		while (seqColorArray.length != 0)
		{
			seqColorArray.shift().kill();
		}
	}
	public function set_seqString(value:String):Void 
	{
		seqString = value;//need to be optimized 
		seqColorArray = new Array<SeqColor>();
		var temp:SeqColor;
		for (i in 0...seqString.length)
        {
			switch(seqString.charAt(i))
			{
				case 'r': temp = new SeqColor(0, 0, 0xFFFF0000); FlxG.state.add(temp); seqColorArray.push(temp);// FlxG.log.add("r");
				case 'g': temp = new SeqColor(0, 0, 0xFF00FF00); FlxG.state.add(temp); seqColorArray.push(temp);// FlxG.log.add("g");
				default : temp = new SeqColor(0, 0, 0xFF000000); FlxG.state.add(temp); seqColorArray.push(temp);// FlxG.log.add("b");
			}
		}
		represent();
		show(false);
	}
	
	public function represent() 
	{	
		reset(seqParent.x + seqParent.width / 2 - seqColorArray.length * 5, seqParent.y -10);
		//FlxG.log.add("-_- " + seqColorArray);
		if(seqColorArray.length >0)
		makeGraphic(seqColorArray.length * 10, 10);
		else
		makeGraphic(1, 10);
		
		for (i in 0...seqColorArray.length)
		{
			seqColorArray[i].reset(x + i * 10, y);
		}
	}
	public function show(flag:Bool):Void 
	{
		visible = flag;
		for (i in 0...seqColorArray.length)
		{
			seqColorArray[i].visible = flag;
		}
	}
	
}