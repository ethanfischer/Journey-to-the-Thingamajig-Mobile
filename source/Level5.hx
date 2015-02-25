package;
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	class Level5 extends GameLevel
	{
		[Embed(source="../map/mapCSV_Level5_Background.csv", mimeType="application/octet-stream")] public var backgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level5_Back_Background.csv", mimeType="application/octet-stream")] public var backbackgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level5_Foreground.csv", mimeType="application/octet-stream")] public var foregroundCSV:Class;
		[Embed(source = "../map/mapCSV_Level5_Fore-Foreground.csv", mimeType = "application/octet-stream")] public var foreforegroundCSV:Class;
		[Embed(source = "../map/mapCSV_Level5_Checkpoint.csv", mimeType = "application/octet-stream")] public var checkpointCSV:Class
		[Embed(source = "../map/mapCSV_Level5_NPC.csv", mimeType = "application/octet-stream")] public var NPCCSV:Class;
		[Embed(source="../map/forecave(blue).png")] public var backgroundTilesPNG:Class;
		[Embed(source="../map/underground(gold).png")] public var backbackgroundTilesPNG:Class;
		//[Embed(source = "../map/mountains(dim).png")] public var backbackgroundTilesPNG:Class;
		[Embed(source = "../map/forest_tiles(red).png")] public var foregroundTilesPNG:Class; //normal mode
		//[Embed(source="../map/forest_tiles_grey.png")]public var foregroundTilesPNG:Class;      // mountain mode
		
		[Embed(source = "../map/forest_tiles_foregroud.png")] public var foreforegroundTilesPNG:Class;
		[Embed(source = "../map/botlet(2).png")] public var botletPNG:Class;
		[Embed(source = "../map/star.png")] public var nomNomPNG:Class;
		[Embed(source="../map/mapCSV_Level5_Bots.csv", mimeType="application/octet-stream")] public var botsCSV:Class;
		[Embed(source = "../map/mapCSV_Level5_Bots(2).csv", mimeType = "application/octet-stream")] public var bots2CSV:Class;
		[Embed(source = "../map/mapCSV_Level5_Bots(3).csv", mimeType = "application/octet-stream")] public var bots3CSV:Class;
		[Embed(source="../map/mapCSV_Level5_Rocks.csv", mimeType="application/octet-stream")] public var rocksCSV:Class;
		[Embed(source = "../map/mapCSV_Level5_CrumbleRocks.csv", mimeType = "application/octet-stream")] public var crumbleRocksCSV:Class;
		[Embed(source = "../map/mapCSV_Level5_Torch.csv", mimeType = "application/octet-stream")] public var torchesCSV:Class;
		[Embed(source = "../map/rock.png")] public var rockPNG:Class;
		[Embed(source = "../map/crumbleRock.png")] public var crumbleRockPNG:Class;
		[Embed(source = "../assets/torch.png")] public var torchPNG:Class;
		[Embed(source = "../map/mapCSV_Level5_NomNoms.csv", mimeType = "application/octet-stream")] public var nomNomsCSV:Class;
		[Embed(source = "../assets/stream.png")] public var streamPNG:Class;
		[Embed(source = "../map/mapCSV_Level5_Streams.csv", mimeType = "application/octet-stream")] public var streamsCSV:Class;
		
		//[Embed(source="../assets/distant_thunder.mp3")] public var dwarfDance:Class; //mountain ambience mode
		//[Embed(source = "../assets/02_Open_Eye_Signal.mp3")] public var dwarfDance:Class; //music mode
		[Embed(source = "../assets/water.mp3")] public var dwarfDance:Class;
		
		//public var waterSFX:FlxSound = new FlxSound();
		public var rockMap:FlxTilemap;	
		public var crumbleRockMap:FlxTilemap;
		
		public function new() 
		{
			super();
			
			dwarfDance
			//Registry.musix = dwarfDance;
			//musix.loadEmbedded(dwarfDance, true, false);
		
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
			
			foreforeground = new FlxTilemap;
			foreforeground.loadMap(new foreforegroundCSV, foreforegroundTilesPNG, 16, 16, 0, 0, 1, 64);
			foreforeground.scrollFactor.x = 1;
			
			//	Makes these tiles non collidable)
			foreground.setTileProperties(57, FlxObject.NONE, null, null, 6);
			
			foreground.setTileProperties(27, FlxObject.UP, null, null, 0);
			
			//waterSFX.loadEmbedded(water, true, false);
			//waterSFX.volume = 0.2;
			//waterSFX.play();
			
			Registry.map = foreground;
			
			width = foreground.width;
			height = foreground.height;
			
			canopy.visible = false;
			
			///////////////////////////////////////////////////////
			//					 CHECKPOINT						 //
			///////////////////////////////////////////////////////
			Registry.hmodeChkpt = 1825;
			
			if (Registry.easyMode)
			{
				if (Registry.checkpointFlag)
				{
					player = new Player(Registry.ezchkpt.x, Registry.ezchkpt.y);
					Registry.torchesOn = Registry.torchesCheckpoint;
				}
				else 
				{
					player = new Player(30, 400);
					Registry.torchesOn = false;
				}
			}
			else
			{
				if (Registry.checkpointFlag)
				{
					player = new Player(1795, 386);
					Registry.torchesOn = true;
				}
				else
				{
					player = new Player(15, 400);
					Registry.torchesOn = true;
				}

			}
			
			Registry.player = player;
			
			not_a_flower = new NotAFlower(260, height - 48, player);
			
			//sign = new Sign(40, 300, "Be precise with those jumps.", player, 40, 300);
			
			parseBots(player);
			parseBots2(player);
			//parseBots3(player);
			if(!Registry.hasUmbrella) parseNPCs();
			parseTorches();
			parseRocks(player);
			parseCrumbleRocks(player);
			parseNomNoms();
			parseStreams();
			parseCheckpoint();
			
			Registry.crumbleRockMap = crumbleRockMap;
			Registry.crumbleRocks = crumbleRocks;
			
			//spring = new Spring(2458, 423, 700);
			spring2 = new Spring(1080, 408, 1200);
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
		
		private function parseNPCs():Void
		{			
			var NPCMap:FlxTilemap = new FlxTilemap();
			
			NPCMap.loadMap(new NPCCSV, botletPNG, 16, 16);
			
			for (ty in 0...NPCMap.heightInTiles)
			{
				for (tx in 0...NPCMap.widthInTiles)
				{
					if (NPCMap.getTile(tx, ty) == 1)
					{
						npc = new NPC(tx, ty, FlxObject.LEFT);
						npc.y -= 3;
						add(npc);
					}
				
				}
			}
		}
		
		private function parseRocks(player:Player):Void
		{			
			rockMap = new FlxTilemap();
			
			rockMap.loadMap(new rocksCSV, rockPNG, 16, 16);
			
			rocks = new Rocks;
			
			var ty:Float = rockMap.heightInTiles;
			while (ty > 0)
			{
				var tx:Int = rockMap.widthInTiles;
				while(tx > 0)
				{
					if (rockMap.getTile(tx, ty) == 1)
					{
						rocks.addRock(tx, ty, player, 1);
					}
					tx--;
				}
				ty--;
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
		
	}