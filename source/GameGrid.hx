package ;
import blocks.*;
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
	private var grid:Array<Array<FlxSprite>>;
	private var blocksGrid:Array<Array<Block>>;
	
	private var gridWidth(get, null):Int = 10;
	
	private var gridHeight(get, null):Int = 10;
	
	private var gridX:Int = 10;
	private var gridY:Int = 10;
	
	private var tileSize:Int = 40;
	private var tileActuallSize:Int = 36;
	
	private var offsetPos:Int = 2;
	
	public var inputBlock:InputBlock ;
	public var outputBlock:OutputBlock ;
	private var testFunction:String->String->Bool;
	private var inputString:String;
	public function new(inputString:String, testFunction:String->String->Bool) 
	{
		grid = new Array<Array<FlxSprite>>();
		blocksGrid = new Array<Array<Block>>();
		super(gridX, gridY);
		makeGraphic(gridWidth * tileSize, gridHeight * tileSize,0x00ff00ff);
		resetGrid();
		GlovalVars.gameGrid = this;
		this.testFunction = testFunction;
		this.inputString = inputString;
		addIOBlocks();
	}
	
	public function addIOBlocks() 
	{
		inputBlock = new InputBlock(0, 2,inputString);
		blocksGrid[0][2] = inputBlock;
		outputBlock = new OutputBlock(gridWidth - 1, 2,inputString,testFunction);
		blocksGrid[gridWidth - 1][2] = outputBlock;
	}
	public function resetGrid() 
	{
		for (x in 0...gridWidth)
        {
            grid[x] = new Array<FlxSprite>();
            for (y in 0...gridHeight)
            {
                grid[x][y] = new FlxSprite( gridX +offsetPos + tileSize * x, gridY + offsetPos + tileSize * y).makeGraphic(tileActuallSize, tileActuallSize, 0xAA5C755E);
				FlxG.state.add(grid[x][y]);
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
	public function addInBestFit(p:FlxPoint,block:Block):FlxPoint 
	{
		var res:FlxPoint = new FlxPoint(0, 0);
		res.x = offsetPos + ((Math.floor((p.x - gridX) / tileSize)) * tileSize) + gridX;
		res.y = offsetPos + ((Math.floor((p.y - gridY) / tileSize)) * tileSize) + gridY;
		removeFromGrid(block);
		blocksGrid[(Math.floor((p.x - gridX) / tileSize))][(Math.floor((p.y - gridY) / tileSize))] = block;
		return res;
	}
	public function getCoordinatesOfPosition(p:FlxPoint):FlxPoint 
	{
		var res:FlxPoint = new FlxPoint(0, 0);
		res.x = offsetPos + gridX + p.x * tileSize; 
		res.y = offsetPos + gridY + p.y * tileSize;
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
                blocksGrid[x][y].reset_state();
            }
        }
	}
}