package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	public class Registry 
	{
		public static var screenWidth:Int = 600;
		public static var screenHeight:Int = 300;
		public static var map:FlxTilemap;
		public static var crumbleRockMap:FlxTilemap;
		public static var crumbleRocks:CrumbleRocks;
		public static var levelExit:FlxPoint;
		public static var player:Player;
		public static var bots:Bots;
		public static var bots2:Bots2;
		public static var borgs:Borgs;
		public static var rock:Rock;
		public static var level2:Level2;
		public static var hasFlower:Bool //= true;
		public static var hasUmbrella:Bool = false;
		public static var meetingAdjourned:Bool //= true;
		//public static var musix:FlxSound;
		public static var musix:Class;
		public static var gameLevel:GameLevel;
		public static var stageCount:Int = 0;
		public static var checkpointFlag:Bool = false;
		public static var checkpoint:Checkpoint;
		public static var ezchkpt:FlxPoint;
		public static var deathMessageFlag:Bool = false;
		public static var levelDeathMessage:String;
		public static var musixFlag:Bool = false;
		public static var gameStart:Bool = true;
		public static var deathCount:Int = 1; // used for three different deathSFX
		public static var deaths:Int = 0;     // used to count the overall amount of deaths
		public static var totalDeaths:Int = 0;
		public static var torchesOn:Bool = false;
		public static var torchesCheckpoint:Bool;
		public static var totalChkptsUsed: Int = 0;
		public static var chkptsUsed:Int = 0;
		public static var easyMode:Bool = false; //in easy mode, you can place a checkpoint wherever, otherwise they are predetermined
		public static var hmodeChkpt:Int; //in not easy mode, where you have to cross to activate the checkpoint
		public static var character:String = "girl";
		public static var swap:Bool = false; //used to indicate whether there has been a character change
		public static var swapX:Int;
		public static var swapY:Int;
		public static var swapVelX:Int;
		public static var swapVelY:Int;
		public static var mode:String = "high";
		public static var nmlTimescale:Float;
		public static var playtime:Float = 0;
		public static var totalPlaytime:Float;
		public static var footage:String;
		public static var pauseSounds:Bool = false;
		public static var letterSequence:Bool = false;;
		public static var thdPlace:Int;
		public static var sndPlace:Int;
		public static var fstPlace:Int;
		public static var fx:Fx = new Fx;
		public static var firstLevel1:Bool = true;
		public static var firstLevel4:Bool = true;
		
		
		public function Registry() 
		{
		}
		
	}

}