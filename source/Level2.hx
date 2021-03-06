package;
	import flash.display.Sprite;
	import flixel.*;
	import flixel.plugin.photonstorm.*;

	class Level2 extends GameLevel
	{
		[Embed(source="../map/mapCSV_Level2_Background.csv", mimeType="application/octet-stream")] public var backgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level2_Back_Background.csv", mimeType="application/octet-stream")] public var backbackgroundCSV:Class;
		[Embed(source="../map/mapCSV_Level2_Foreground.csv", mimeType="application/octet-stream")] public var foregroundCSV:Class;
		[Embed(source="../map/mapCSV_Level2_Fore-Foreground.csv", mimeType="application/octet-stream")] public var foreforegroundCSV:Class;
		[Embed(source = "../map/woody2(green).png")] public var backgroundTilesPNG:Class;
		[Embed(source="../map/woody_back_background2.png")] public var backbackgroundTilesPNG:Class;
		[Embed(source = "../map/forest_tiles.png")] public var foregroundTilesPNG:Class;
		[Embed(source = "../map/forest_tiles_foregroud.png")] public var foreforegroundTilesPNG:Class;
		[Embed(source = "../map/botlet(2).png")] public var botletPNG:Class;
		[Embed(source = "../map/star.png")] public var nomNomPNG:Class;
		[Embed(source="../map/mapCSV_Level2_Bots.csv", mimeType="application/octet-stream")] public var botsCSV:Class;
		[Embed(source="../map/mapCSV_Level2_Rocks.csv", mimeType="application/octet-stream")] public var rocksCSV:Class;
		[Embed(source="../map/mapCSV_Level2_CrumbleRocks.csv", mimeType="application/octet-stream")] public var crumbleRocksCSV:Class;
		[Embed(source="../map/mapCSV_Level2_Reinforcements.csv", mimeType="application/octet-stream")] public var reinforcementsCSV:Class;
		[Embed(source = "../map/mapCSV_Level2_NPCs.csv", mimeType = "application/octet-stream")] public var npcsCSV:Class;
		[Embed(source = "../map/rock.png")] public var rockPNG:Class;
		[Embed(source = "../map/crumbleRock.png")] public var crumbleRockPNG:Class;
		[Embed(source = "../map/mapCSV_Level2_NomNoms.csv", mimeType = "application/octet-stream")] public var nomNomsCSV:Class;
		[Embed(source = "../map/mapCSV_Level2_Supports.csv", mimeType = "application/octet-stream")] public var supportsCSV:Class;
		[Embed(source = "../map/mapCSV_Level2_Checkpoint.csv", mimeType = "application/octet-stream")] public var checkpointCSV:Class;
	
		//[Embed(source = "../assets/13_Dwarf_Dance.mp3")] public var dwarfDance:Class;
		[Embed(source = "../assets/forestsounds.mp3")] public var dwarfDance:Class;
		//[Embed(source = "../assets/beat1.mp3")] public var beat1:Class;
		//[Embed(source="../assets/Traffic_2 (with piano ending).mp3")] public var dwarfDance:Class;
		//[Embed(source="../assets/Fucked Up Forest.mp3")] public var dwarfDance:Class;
		//[Embed(source="../assets/jazzy track.mp3")] public var dwarfDance:Class;
		//[Embed(source = "../assets/Ethan Fischer_s flash game possible athletic music.mp3")] public var dwarfDance:Class;
		//[Embed(source="../assets/piglatin.mp3")] public var dwarfDance:Class;
		//[Embed(source="../assets/forestsounds.mp3")] public var dwarfDance:Class;
		
		public var rockMap:FlxTilemap;	
		public var crumbleRockMap:FlxTilemap;
		
		public function new() 
		{
			super();
		
			Registry.hmodeChkpt = 999999999999999999999999999;
			
			Registry.fstPlace = 60;
			Registry.sndPlace = 180;
			Registry.thdPlace = 320;
			
			backbackground = new FlxTilemap;
			backbackground.loadMap(new backbackgroundCSV, backbackgroundTilesPNG, 256, 300);
			backbackground.setTileProperties(1, FlxObject.NONE);
			backbackground.scrollFactor.x = .2;
			
			background = new FlxTilemap;
			background.loadMap(new backgroundCSV, backgroundTilesPNG, 256, 300);
			background.setTileProperties(1, FlxObject.NONE);
			background.scrollFactor.x = .7;
			
			foreground = new FlxTilemap;
			foreground.loadMap(new foregroundCSV, foregroundTilesPNG, 16, 16, 0, 0, 1, 24);
			
			foreforeground = new FlxTilemap;
			foreforeground.loadMap(new foreforegroundCSV, foreforegroundTilesPNG, 16, 16, 0, 0, 1, 64);
			foreforeground.scrollFactor.x = 1;
			
			//	Makes these tiles non collidable)
			foreground.setTileProperties(57, FlxObject.NONE, null, null, 6);
			
			
			Registry.map = foreground;
			
			///////////////////////////////////////////////////////
			//					 CHECKPOINT						 //
			///////////////////////////////////////////////////////
			Registry.hmodeChkpt = 99999;
			
			if (Registry.easyMode)
			{
				if (Registry.checkpointFlag) player = new Player(Registry.ezchkpt.x, Registry.ezchkpt.y);
				else player = new Player(30, 220);
			}
			else
			{
				if(Registry.checkpointFlag) player = new Player(Registry.checkpoint.x + 5, Registry.checkpoint.y - 5);
				else player = new Player(30, 220);
			}
			
			width = foreground.width;
			height = foreground.height;
			
			not_a_flower = new NotAFlower(259, height - 45, player);
			
			parseBots(player);
			parseRocks(player);
			parseReinforcements();
			parseCrumbleRocks(player);
			parseCheckpoint();
			parseSupports();
			parseNomNoms();
			parseNPCs();
			
			Registry.crumbleRockMap = crumbleRockMap;
			Registry.crumbleRocks = crumbleRocks;
			
			Registry.player = player;
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
			Registry.bots = bots;
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
						end.x -=8;
						end.y -=8;
						add(end);
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
		
		private function parseNPCs():Void
		{			
			var NPCMap:FlxTilemap = new FlxTilemap();
			
			NPCMap.loadMap(new npcsCSV, botletPNG, 16, 16);
			
			for (ty in 0...NPCMap.heightInTiles)
			{
				for (tx in 0...NPCMap.widthInTiles)
				{
					if (NPCMap.getTile(tx, ty) == 1)
					{
						npc = new NPC(tx, ty, FlxObject.LEFT);
						npc.y -= 4;
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
			while(ty > 0)
			{
				var tx:Int = rockMap.widthInTiles;
				while(tx > 0)
				{
					if (rockMap.getTile(tx, ty) == 1)
					{
						rocks.addRock(tx, ty, player, 1);
					}
					else if (rockMap.getTile(tx, ty) == 2)
					{
						rocks.addRock(tx, ty, player, 2);
					}
					tx--;
				}
				ty--;
			}
		}
		
		private function parseReinforcements():Void
		{			
			reinforcementMap = new FlxTilemap();
			
			reinforcementMap.loadMap(new reinforcementsCSV, rockPNG, 16, 16);
			
			reinforcements = new Reinforcements;
			
			var ty:Float = reinforcementMap.heightInTiles
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