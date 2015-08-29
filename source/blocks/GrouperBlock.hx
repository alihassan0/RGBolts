package blocks ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import seq.Seq;
import customizationPanel.*;
/**
 * ...
 * @author ...
 */
class GrouperBlock extends Block
{
	private var curruntSeq:Seq;
	public function new(X:Int,Y:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/grouper.png");
	}
	override public function affectSeq(s:Seq) 
	{
		super.affectSeq(s);
		if (curruntSeq == null)
		{
			curruntSeq = s;
			curruntSeq.wait();
			trace("aaa");
		}
		else if(s.alive)
		{
			if(curruntSeq != s)
			{
				var newString:String = curruntSeq.getString()+s.getString();
				curruntSeq.kill();
				s.kill();
				s.setString("");
				curruntSeq.setString("");
				trace("merge [ "+curruntSeq.getString()+" , "+s.getString()+ " ]");
				trace("@ pos [ "+curruntSeq.position.x+" , "+curruntSeq.position.y+ " ]");

				curruntSeq = new Seq(Math.floor(curruntSeq.position.x),Math.floor(curruntSeq.position.y),newString);
				curruntSeq.wait();
				trace("bbb");
			}
			else
			{
				curruntSeq.wait();
				trace("ccc");
			}
		}
	}
	override public function toggleEnabled(?s:Seq)
	{
		super.toggleEnabled();
		
		if(s!=null && curruntSeq != null)
		{
			curruntSeq.setDirection(s.get_direction());
			curruntSeq.canMove = false;
		}
		if(!enabled)
			curruntSeq = null;
	}
	override public function reset_state() 
	{
		super.reset_state();
		curruntSeq = null;
	}
	override public function addCustomizableBlock(x:Float , y:Float,block:Block):CustomizableBlock
	{
		return new GrouperCustomizableBlock(x,y,block);
	}
	override public function loadCustomBehaviour(customizableBlock:CustomizableBlock)
	{

	}
}