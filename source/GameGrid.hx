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
	public var blocksGrid:Array<Array<Block>>;
	
	public var gridWidth(get, null):Int = 8;
	
	public var gridHeight(get, null):Int = 8;
	
	private var gridX:Int = 61;
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
		
		GlobalVars.gameGrid = this;
		GlobalVars.Seqs = new Array<Seq>();
		if (GlobalVars.save.data.levels!= null && GlobalVars.save.data.levels[GlobalVars.levelInfo.id] == true)
		{
			trace("save found");
			loadGrid();
		}
		else
		{
			trace("no save found");
			resetGrid();
		}
		this.testFunction = GlobalVars.level.levelInfo.testFunction;
	}
	
	public function addIOBlocks() 
	{
		var pos :FlxPoint = GlobalVars.level.levelInfo.inputPos;
		if(pos == null)
			pos = new FlxPoint(0,2);
		
		var p:FlxPoint = getCoordinatesOfPosition(FlxPoint.get(pos.x,pos.y));
            		
		new InputBlock(Std.int(p.x), Std.int(p.y));

		pos = GlobalVars.level.levelInfo.outputPos;
		if(pos == null)
			pos =new FlxPoint(gridWidth - 1, 2);
		p = getCoordinatesOfPosition(FlxPoint.get(pos.x,pos.y));
        
		new OutputBlock(Std.int(p.x), Std.int(p.y));
			
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
        addIOBlocks();
	}
	public function loadGrid() 
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
        for (x in 0...gridWidth)
        {
            for (y in 0...gridHeight)
            {
            	var blockId:Array<Int> = GlobalVars.save.data.levelBlocksGrid[GlobalVars.levelInfo.id][x][y];
            	if(blockId != null)
            	{
            		var p:FlxPoint = getCoordinatesOfPosition(FlxPoint.get(x,y));
            		var d = Type.createInstance( GlobalVars.blocksMap[blockId[0]], [Math.floor(p.x),Math.floor(p.y)] );
            		d.followMouse = false;
            		d.checkPosInGrid();
            		d.angle += blockId[1];
            		d.angle %= 360;
            		d.draw();
            		trace("loaded Block @ " + x +" , " +  y + " position @" + p.x + "  " + p.y + "with angle of " + blockId[1]);
            		trace(d.position);
            	}
            }
        }
	}
	public function addInBestFit(block:Block):FlxPoint 
	{
		var blockPos:FlxPoint = new FlxPoint(block.x + block.width/2 , block.y + block.height/2);//the block center point
		
		var res:FlxPoint = new FlxPoint(0, 0); 
		res.x = ((Math.floor((blockPos.x - gridX) / tileSize)) * tileSize) + gridX ;
		res.y = ((Math.floor((blockPos.y - gridY) / tileSize)) * tileSize) + gridY;
		
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