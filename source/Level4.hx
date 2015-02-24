package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class Level4 extends GameLevel
	{
		[Embed(source="../map/mapCSV_Level4_Background.csv", mimeType="application/octet-stream")] public var backgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level4_Back_Background.csv", mimeType="application/octet-stream")] public var backbackgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level4_Foreground.csv", mimeType="application/octet-stream")] public var foregroundCSV:Class;
		[Embed(source="../map/mapCSV_Level4_Fore-Foreground.csv", mimeType="application/octet-stream")] public var foreforegroundCSV:Class;
		[Embed(source = "../map/mapCSV_Level4_Checkpoint.csv", mimeType = "application/octet-stream")] public var checkpointCSV:Class;
		[Embed(source="../map/forecave(red).png")] public var backgroundTilesPNG:Class;
		[Embed(source="../map/underground(grey).png")] public var backbackgroundTilesPNG:Class;
		//[Embed(source="../map/forecave(red).png")] public var backbackgroundTilesPNG:Class;
		[Embed(source = "../map/forest_tiles(red).png")] public var foregroundTilesPNG:Class;
		[Embed(source = "../map/forest_tiles_foregroud(2).png")] public var foreforegroundTilesPNG:Class;
		[Embed(source = "../map/botlet(2).png")] public var botletPNG:Class;
		[Embed(source = "../map/star.png")] public var nomNomPNG:Class;
		[Embed(source="../map/mapCSV_Level4_Bots.csv", mimeType="application/octet-stream")] public var botsCSV:Class;
		[Embed(source = "../map/mapCSV_Level4_Bots(2).csv", mimeType = "application/octet-stream")] public var bots2CSV:Class;
		[Embed(source = "../map/mapCSV_Level4_NPC.csv", mimeType = "application/octet-stream")] public var NPCCSV:Class;
		[Embed(source="../map/mapCSV_Level4_Rocks.csv", mimeType="application/octet-stream")] public var rocksCSV:Class;
		[Embed(source = "../map/mapCSV_Level4_CrumbleRocks.csv", mimeType = "application/octet-stream")] public var crumbleRocksCSV:Class;
		[Embed(source = "../map/mapCSV_Level4_Torch.csv", mimeType = "application/octet-stream")] public var torchesCSV:Class;
		[Embed(source = "../map/rock.png")] public var rockPNG:Class;
		[Embed(source = "../map/crumbleRock.png")] public var crumbleRockPNG:Class;
		[Embed(source = "../assets/torch.png")] public var torchPNG:Class;
		[Embed(source = "../map/mapCSV_Level4_NomNoms.csv", mimeType = "application/octet-stream")] public var nomNomsCSV:Class;
		[Embed(source = "../assets/stream.png")] public var streamPNG:Class;
		[Embed(source = "../map/mapCSV_Level4_Streams.csv", mimeType = "application/octet-stream")] public var streamsCSV:Class;
		[Embed(source = "../map/mapCSV_Level4_Reinforcements.csv", mimeType = "application/octet-stream")] public var reinforcementsCSV:Class;
		[Embed(source = "../assets/letter(level4).png")] private var letterPNG:Class;
		
		[Embed(source="../assets/river.mp3")] private var water:Class;
		
		public var rockMap:FlxTilemap;	
		public var crumbleRockMap:FlxTilemap;
		
		public function new() 
		{
			super();
			
			
			letter = new FlxSprite(0, 0);
			letter.loadGraphic(letterPNG, false, false, 600, 300);
			letter.scrollFactor.y = 0;
			letter.visible = false;
			
			Registry.fstPlace = 120;
			Registry.sndPlace = 220;
			Registry.thdPlace = 420;
			
			Registry.hasFlower = true;
			Registry.meetingAdjourned = true;
			
			backbackground = new FlxTilemap;
			backbackground.loadMap(new backbackgroundCSV, backbackgroundTilesPNG, 256, 600);
			backbackground.setTileProperties(1, FlxObject.NONE);
			backbackground.scrollFactor.x = .2; 
			
			background = new FlxTilemap;
			background.loadMap(new backgroundCSV, backgroundTilesPNG, 256, 600);
			background.setTileProperties(1, FlxObject.NONE);
			background.scrollFactor.x = .6;
			background.scrollFactor.y = 1;
			background.y = -100; 
			
			foreground = new FlxTilemap;
			foreground.loadMap(new foregroundCSV, foregroundTilesPNG, 16, 16, 0, 0, 1, 24);
			
			//	Makes these tiles non collidable)
			foreground.setTileProperties(57, FlxObject.NONE, null, null, 6);
			foreground.setTileProperties(27, FlxObject.ANY, null, null, 0);
			
			Registry.map = foreground;
			
			width = foreground.width;
			height = foreground.height;
			
			if(Registry.firstLevel4) mail = new Mail(160, 430);
			
			canopy.visible = false;
			
			///////////////////////////////////////////////////////
			//					 CHECKPOINT						 //
			///////////////////////////////////////////////////////
			Registry.hmodeChkpt = 1820;
			
			if (Registry.easyMode)
			{
				if (Registry.checkpointFlag) 
				{
					player = new Player(Registry.ezchkpt.x, Registry.ezchkpt.y);
					Registry.torchesOn = Registry.torchesCheckpoint;
				}
				else 
				{
					player = new Player(40, 150);
					Registry.torchesOn = false;
				}
			}
			else
			{
				if (Registry.checkpointFlag) 
				{
					player = new Player(Registry.checkpoint.x + 5, Registry.checkpoint.y - 5);
					Registry.torchesOn = true;
				}
				else 
				{
					player = new Player(40, 150);
					Registry.torchesOn = true;
				}
			}
			
			Registry.player = player;
			
			not_a_flower = new NotAFlower(260, height - 48, player);
			
			//sign = new Sign(135, 300,"DON'T TOUCH TORCHES", player, 105, 386);		
			
			parseBots(player);
			parseBots2(player);
			parseReinforcements();
			parseTorches();
			parseRocks(player);
			parseCrumbleRocks(player);
			parseNomNoms();
			parseStreams();
			parseCheckpoint();
			
			Registry.crumbleRockMap = crumbleRockMap;
			Registry.crumbleRocks = crumbleRocks;
			
			spring = new Spring(2696, 426, 700);
			spring2 = new Spring(1340, 378, 800);
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
		
		private function parseReinforcements():Void
		{			
			reinforcementMap = new FlxTilemap();
			
			reinforcementMap.loadMap(new reinforcementsCSV, rockPNG, 16, 16);
			
			reinforcements = new Reinforcements;
			
			var ty:Float = reinforcementMap.heightInTiles;
			while(ty > 0)
			{
				var tx:Int = reinforcementMap.widthInTiles;
				while (tx > 0)
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
		
		private function parseTorches():Void
		{
			var torchMap:FlxTilemap = new FlxTilemap();
			
			torchMap.loadMap(new torchesCSV, torchPNG, 16, 16);
			
			torches = new Torches();
			
			for (ty in 0...torchMap.heightInTiles)
			{
				for (tx in 0...torchMap.widthInTiles)
				{
					if (torchMap.getTile(tx, ty) == 1)
					{
						torches.add(new Torch(tx, ty, 1));
					}
					else if (torchMap.getTile(tx, ty) == 2)
					{
						torches.add(new Torch(tx, ty, 2));
					}
					else if (torchMap.getTile(tx, ty) == 3)
					{
						torches.add(new Torch(tx, ty, 3));
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
		
		private function parseStreams():Void
		{
			var streamMap:FlxTilemap = new FlxTilemap();
			
			streamMap.loadMap(new streamsCSV, streamPNG, 16, 16);
			
			streams = new FlxGroup();
			
			for (ty in 0...streamMap.heightInTiles)
			{
				for (tx in 0...streamMap.widthInTiles)
				{
					if (streamMap.getTile(tx, ty) == 1)
					{
						streams.add(new Stream(tx, ty, true, "normal"));
					}
					else if(streamMap.getTile(tx, ty) == 2)
					{
						streams.add(new Stream(tx, ty, false, "normal"));
					}
					else if (streamMap.getTile(tx, ty) == 3)
					{
						streams.add(new Stream(tx, ty, false, "fast"));
					}
					else if (streamMap.getTile(tx, ty) == 4)
					{
						streams.add(new Stream(tx, ty, false, "fall"));
					}
					else if (streamMap.getTile(tx, ty) == 5)
					{
						streams.add(new Stream(tx, ty, false, "drop"));
					}
					else if (streamMap.getTile(tx, ty) == 10)
					{
						streams.add(new Stream(tx, ty, true, "crash"));
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
			Registry.bots = bots;
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
						bots2.addBot2(tx, ty, player, FlxObject.RIGHT, 80);
					}
				}
			}
			Registry.bots2 = bots2;
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
					else if (rockMap.getTile(tx, ty) == 2)
					{
						rocks.addRock(tx, ty, player, 2);
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
		
	}
}