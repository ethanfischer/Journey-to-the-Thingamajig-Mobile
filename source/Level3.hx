package  
{
	import flash.display.Sprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class Level3 extends GameLevel
	{
		[Embed(source="../map/mapCSV_Level3_Background.csv", mimeType="application/octet-stream")] public var backgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level3_Back_Background.csv", mimeType="application/octet-stream")] public var backbackgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level3_Foreground.csv", mimeType="application/octet-stream")] public var foregroundCSV:Class;
		[Embed(source="../map/mapCSV_Level3_Fore-Foreground.csv", mimeType="application/octet-stream")] public var foreforegroundCSV:Class;
		[Embed(source = "../map/mapCSV_Level3_Checkpoint.csv", mimeType = "application/octet-stream")] public var checkpointCSV:Class;
		[Embed(source = "../map/woody(green).png")] public var backgroundTilesPNG:Class;
		[Embed(source="../map/woody_back_background3(lake)(green).png")] public var backbackgroundTilesPNG:Class;
		//[Embed(source="../map/woody_back_background3(river4).png")] p
		[Embed(source = "../map/forest_tiles3.png")] public var foregroundTilesPNG:Class;
		[Embed(source = "../map/forest_tiles_foreground3.png")] public var foreforegroundTilesPNG:Class;
		[Embed(source = "../map/botlet(2).png")] public var botletPNG:Class;
		[Embed(source = "../map/star.png")] public var nomNomPNG:Class;
		[Embed(source="../map/mapCSV_Level3_Bots.csv", mimeType="application/octet-stream")] public var botsCSV:Class;
		[Embed(source="../map/mapCSV_Level3_Bots(2).csv", mimeType="application/octet-stream")] public var bots2CSV:Class;
		[Embed(source="../map/mapCSV_Level3_Rocks.csv", mimeType="application/octet-stream")] public var rocksCSV:Class;
		[Embed(source = "../map/mapCSV_Level3_CrumbleRocks.csv", mimeType = "application/octet-stream")] public var crumbleRocksCSV:Class;
		[Embed(source = "../map/mapCSV_Level3_Supports.csv", mimeType = "application/octet-stream")]         public var supportsCSV:Class;
		[Embed(source="../map/mapCSV_Level3_Reinforcements.csv", mimeType="application/octet-stream")] public var reinforcementsCSV:Class;
		[Embed(source = "../map/rock.png")] public var rockPNG:Class;
		[Embed(source = "../map/crumbleRock.png")] public var crumbleRockPNG:Class;
		[Embed(source="../map/mapCSV_Level3_NomNoms.csv", mimeType="application/octet-stream")] public var nomNomsCSV:Class;
	
		//[Embed(source = "../assets/13_Dwarf_Dance.mp3")] public var dwarfDance:Class;
		//[Embed(source = "../assets/Native American video game music test.mp3")] public var dwarfDance:Class;
		[Embed(source="../assets/forestsounds.mp3")] public var dwarfDance:Class;
		//[Embed(source = "../assets/13_Dwarf_Dance.mp3")] public var dwarfDance:Class;
		
		public var rockMap:FlxTilemap;	
		public var crumbleRockMap:FlxTilemap;
		
		public function new() 
		{
			super();
			
			//Registry.musix = beats[Registry.deathCount % 2];
			Registry.musix = dwarfDance;
			//musix.loadEmbedded(dwarfDance, true, false);
			
			Registry.hasFlower = true;
			Registry.meetingAdjourned = true;

			Registry.fstPlace = 90;
			Registry.sndPlace = 270;
			Registry.thdPlace = 550;
			
			backbackground = new FlxTilemap;
			backbackground.loadMap(new backbackgroundCSV, backbackgroundTilesPNG, 256, 300);
			backbackground.setTileProperties(1, FlxObject.NONE);
			backbackground.scrollFactor.x = .2;
			
			background = new FlxTilemap;
			background.loadMap(new backgroundCSV, backgroundTilesPNG, 256, 300);
			background.setTileProperties(1, FlxObject.NONE);
			background.scrollFactor.x = .4;
			
			foreground = new FlxTilemap;
			foreground.loadMap(new foregroundCSV, foregroundTilesPNG, 16, 16, 0, 0, 1, 24);
			foreforeground = new FlxTilemap;
			foreforeground.loadMap(new foreforegroundCSV, foreforegroundTilesPNG, 16, 16, 0, 0, 1, 64);
			foreforeground.scrollFactor.x = 1;
			
			//	Makes these tiles non collidable)
			foreground.setTileProperties(57, FlxObject.NONE, null, null, 6);
			
			
			Registry.map = foreground;
			
			width = foreground.width;
			height = foreground.height;
			
			///////////////////////////////////////////////////////
			//					 CHECKPOINT						 //
			///////////////////////////////////////////////////////
			Registry.hmodeChkpt = 1372;
			
			if (Registry.easyMode)
			{
				if (Registry.checkpointFlag) player = new Player(Registry.ezchkpt.x, Registry.ezchkpt.y);
				else player = new Player(30, 160);
			}
			else
			{
				if (Registry.checkpointFlag) player = new Player(Registry.checkpoint.x + 5, Registry.checkpoint.y - 5);
				else player = new Player(30, 160);
			}
			
			Registry.player = player;
			
			not_a_flower = new NotAFlower(260, height - 48, player);
			
			sign = new Sign(135, 134, "1. PRESS DOWN TO DUCK." + "\n" + "2. RUNNING + DUCKING = SLIDING.", player, 105, 124);		
			sign2 = new Sign(1103, 50, "SLIDE INTO BAD GUYS", player, 1060, 30);
			
			parseBots(player);
			parseBots2(player);
			parseRocks(player);
			parseReinforcements();
			parseSupports();
			parseCrumbleRocks(player);
			parseNomNoms();
			parseCheckpoint();
			
			Registry.crumbleRockMap = crumbleRockMap;
			Registry.crumbleRocks = crumbleRocks;
			
			spring = new Spring(1568, 233, 600);
		}
			
		private function parseNomNoms():Void
		{
			var nomNomMap:FlxTilemap = new FlxTilemap();
			
			nomNomMap.loadMap(new nomNomsCSV, nomNomPNG, 16, 16);
			
			nomNoms = new FlxGroup();
			
			for (ty in 0...nomNomMap.heightInTiles)
			{
				for (tx in 0...nomNomMap.widthInTiles)
				{
					if (nomNomMap.getTile(tx, ty) == 1)
					{
						nomNoms.add(new NomNom(tx, ty));
					}
				}
			}
		}
		
		private function parseBots(player:Player):Void
		{			
			var botMap:FlxTilemap = new FlxTilemap();
			
			botMap.loadMap(new botsCSV, botletPNG, 16, 16);
			
			bots = new Bots;
			
			for (ty in 0...botMap.heightInTiles)
			{
				for (tx in 0...botMap.widthInTiles)
				{
					if (botMap.getTile(tx, ty) == 1)
					{
						bots.addBot(tx, ty, player, FlxObject.RIGHT);
					}
					else if (botMap.getTile(tx, ty) == 2)
					{
						bots.addBot(tx, ty, player, FlxObject.LEFT);
					}
				}
			
			}
			
		}
		
		private function parseBots2(player:Player):Void
		{			
			var bot2Map:FlxTilemap = new FlxTilemap();
			
			bot2Map.loadMap(new bots2CSV, botletPNG, 16, 16);
			
			bots2 = new Bots2;	
			
			for (ty in 0...bot2Map.heightInTiles)
			{
				for (tx in 0...bot2Map.widthInTiles)
				{
					if (bot2Map.getTile(tx, ty) == 1)
					{
						bots2.addBot2(tx, ty, player, FlxObject.LEFT, 80);
					}
					else if (bot2Map.getTile(tx, ty) == 2)
					{
						bots2.addBot2(tx, ty, player, FlxObject.RIGHT, 400);
					}
					
				}
			}
			Registry.bots2 = bots2;
		}
		
		private function parseReinforcements():Void
		{			
			reinforcementMap = new FlxTilemap();
			
			reinforcementMap.loadMap(new reinforcementsCSV, rockPNG, 16, 16);
			
			reinforcements = new Reinforcements;
			
			var ty:Float = reinforcementMap.heightInTiles;
			while(ty > 0)
			{
				var tx:Int = reinforcementMap.widthInTiles;
				while(tx > 0)
				{
					if (reinforcementMap.getTile(tx, ty) == 1)
					{
						reinforcements.addReinforcement(tx, ty);
					}
					tx--;
				}
				ty--;
			}
		}
		
		private function parseRocks(player:Player):Void
		{			
			rockMap = new FlxTilemap();
			
			rockMap.loadMap(new rocksCSV, rockPNG, 16, 16);
			
			rocks = new Rocks;
			
			for (ty in 0...rockMap.heightInTiles)
			{
				for (tx in 0...rockMap.widthInTiles)
				{
					if (rockMap.getTile(tx, ty) == 1)
					{
						rocks.addRock(tx, ty, player, 1);
					}
				}
			}
		}
		
	private function parseCheckpoint():Void
		{			
			var checkpointMap:FlxTilemap = new FlxTilemap();
			
			checkpointMap.loadMap(new checkpointCSV, botletPNG, 16, 16);
			
			for (ty in 0...checkpointMap.heightInTiles)
			{
				for (tx in 0...checkpointMap.widthInTiles)
				{
					if (checkpointMap.getTile(tx, ty) == 1)
					{
						checkpoint = new Checkpoint(tx, ty);
						Registry.checkpoint = checkpoint;
						add(checkpoint);
					}
					else if (checkpointMap.getTile(tx, ty) == 3)
					{
						end = new Checkpoint(tx, ty, true);
						end.x -8;
						end.y -8;
						add(end);
					}
				}
			}
		}
		
		private function parseCrumbleRocks(player:Player):Void
		{			
			crumbleRockMap = new FlxTilemap();
			
			crumbleRockMap.loadMap(new crumbleRocksCSV, crumbleRockPNG, 16, 16);
			
			crumbleRocks = new CrumbleRocks;
			
			for (ty in 0...crumbleRockMap.heightInTiles)
			{
				for (tx in 0...crumbleRockMap.widthInTiles)
				{
					if (crumbleRockMap.getTile(tx, ty) == 1)
					{
						crumbleRocks.addCrumbleRock(tx, ty);
					}
				}
			}
		}
		
		private function parseSupports():Void
		{			
			supportMap = new FlxTilemap();
			
			supportMap.loadMap(new supportsCSV, rockPNG, 16, 16);
			
			supports = new Supports;
			
			for (ty in 0...supportMap.heightInTiles)
			{
				for (tx in 0...supportMap.widthInTiles)
				{
					if (supportMap.getTile(tx, ty) == 1)
					{
						supports.addSupport(tx, ty);
					}
				}
			}
		}
		
	}
}