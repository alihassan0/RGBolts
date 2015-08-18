package ;
import blocks.*;
import seq.Seq;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
// coordinates refer to actual x , y coordinates 
// position refers to position in grid
class GameGrid extends FlxSprite
{
	public var grid:Array<Array<FlxSprite>>;
	private var blocksGrid:Array<Array<Block>>;
	
	private var gridWidth(get, null):Int = 8;
	
	private var gridHeight(get, null):Int = 8;
	
	private var gridX:Int = 36;
	private var gridY:Int = 36;
	
	private var tileSize:Int = 40;
	private var tileActuallSize:Int = 36;
	
	public var inputBlock:InputBlock ;
	public var outputBlock:OutputBlock ;
	private var testFunction:String->String;
	private var inputString:String;
	public function new() 
	{
		grid = new Array<Array<FlxSprite>>();
		blocksGrid = new Array<Array<Block>>();
		super(gridX, gridY);
		makeGraphic(gridWidth * tileSize, gridHeight * tileSize,0x00ff00ff);
		resetGrid();
		GlobalVars.gameGrid = this;
		GlobalVars.Seqs = new Array<Seq>();
		this.testFunction = GlobalVars.level.levelInfo.testFunction;
		addIOBlocks();
	}
	
	public function addIOBlocks() 
	{
		var pos :FlxPoint = GlobalVars.level.levelInfo.inputPos;
		if(pos == null)
			inputBlock = new InputBlock(0, 2);
		else
			inputBlock = new InputBlock(Std.int(pos.x), Std.int(pos.y));

		var pos :FlxPoint = GlobalVars.level.levelInfo.outputPos;
		if(pos == null)
			outputBlock = new OutputBlock(gridWidth - 1, 2);
		else
			outputBlock = new OutputBlock(Std.int(pos.x), Std.int(pos.y));
			
		inputBlock.checkPosInGrid();
		outputBlock.checkPosInGrid();
	}
	public function resetGrid() 
	{
		for (x in 0...gridWidth)
        {
            grid[x] = new Array<FlxSprite>();
            for (y in 0...gridHeight)
            {
                grid[x][y] = new FlxSprite( gridX + tileSize * x, gridY + tileSize * y).makeGraphic(tileActuallSize, tileActuallSize, 0xAA5C755E);
				GlobalVars.level.gridGroup.add(grid[x][y]);
            }
        }
		for (x in 0...gridWidth)
        {
            blocksGrid[x] = new Array<Block>();
            for (y in 0...gridHeight)
            {
                blocksGrid[x][y] = null;
            }
        }
	}
	public function addInBestFit(block:Block):FlxPoint 
	{
		var blockPos:FlxPoint = new FlxPoint(block.x + block.width/2 , block.y + block.height/2);//the block center point
		
		var res:FlxPoint = new FlxPoint(0, 0); 
		res.x = ((Math.floor((blockPos.x - gridX) / tileSize)) * tileSize) + gridX ;
		res.y = ((Math.floor((blockPos.y - gridY) / tileSize)) * tileSize) + gridY+5;
		
		var posPoint = new FlxPoint();
		posPoint.x = Math.floor((blockPos.x - gridX) / tileSize);
		posPoint.y = Math.floor((blockPos.y - gridY) / tileSize);
	
		if(!inBounds(posPoint) || (blocksGrid[Std.int(posPoint.x)][Std.int(posPoint.y)] != null
			&& blocksGrid[Std.int(posPoint.x)][Std.int(posPoint.y)] != block))
		{
			return null;
		}
		else
		{
			removeFromGrid(block); // remove any occurunces of the same block in the grid if it there
			blocksGrid[Std.int(posPoint.x)][Std.int(posPoint.y)] = block;
			block.position = getposOfBlock(block);
			return res;
		}
	}
	public function inBounds(p:FlxPoint):Bool
	{
		if(p.x < 0 || p.x >= gridWidth || p.y < 0 || p.y > gridHeight)
			return false;
		else
			return true;
	}
	public function getCoordinatesOfPosition(p:FlxPoint):FlxPoint 
	{
		var res:FlxPoint = new FlxPoint(0, 0);
		res.x =  gridX + p.x * tileSize; 
		res.y =  gridY + p.y * tileSize;
		return res;
	}
	public function getposOfBlock(b:Block):FlxPoint 
	{
		for (x in 0...gridWidth)
        {
            for (y in 0...gridHeight)
            {
               if (b == blocksGrid[x][y])
			   return new FlxPoint(x, y);
            }
        }
		return null;
	}
	public function getBlockOfPos(p:FlxPoint):Block
	{
		return blocksGrid[Math.floor(p.x)][Math.floor(p.y)];
	}
	public function removeFromGrid(b:Block)
	{
		for (x in 0...gridWidth)
        {
            for (y in 0...gridHeight)
            {
               if (b == blocksGrid[x][y])
			    blocksGrid[x][y] = null;
            }
        }
	}
	

	public function get_gridWidth():Int 
	{
		return gridWidth;
	}
	public function get_gridHeight():Int 
	{
		return gridHeight;
	}
	public function resetBlocks() 
	{
		for (x in 0...gridWidth)
        {
            for (y in 0...gridHeight)
            {
				if( blocksGrid[x][y] != null)
                {
                	blocksGrid[x][y].reset_state();
                }
            }
        }
	}
}