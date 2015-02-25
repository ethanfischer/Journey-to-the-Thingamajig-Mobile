import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/alphabet.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/applause.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/aww.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/bah.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/bahfade.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/black.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/blade.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/blade2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/blagh(Dylan).mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/blue.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/Bobby _Aww_ 2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Bobby _Aww_.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/boing.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/boot.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/borgDeathSFX.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/bot2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/botKillSFX.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/botKillSFX2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/boulder.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/bouldlet.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/bouldletmini.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/boxGlove.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/boxGlove2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/bracket.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/BUZZER.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/BUZZER.WAV");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/caleb_awman.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/caleb_dangit.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/canopy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/canopy6.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/checkpoint.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/cheerin.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/chomp.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/claps.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/clinkclankspin.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/cone.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/congrats.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/cream.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/cream.rli");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/cream1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/cream2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/cream3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/crowd-groan.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/cutscene.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/cutscene6.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/Dats Dat Kuuuush.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/deathSFX.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/deathSFX2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/distant_thunder.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Drawer.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/drawerslide.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/dropMug.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/drumfill.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/drumroll.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/dylan_noooo.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/dylan_ohshit.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/dylan_ooo.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/egg(2).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/egg.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/eject.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/elevator.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/ending.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/envelope.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/fadein_chord.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/fas.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/faststep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/foldpaper(openletter).mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/foldpaper.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/footstep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/forestsounds.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/forestsounds2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/forest_2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_4.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_5.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(19).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(2).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(20).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(21).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(22).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(23).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(24).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(25).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(3).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(4).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles(b+w).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/forest_tiles_night.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/gasp_x.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/gong(supposedly).mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Gucci.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Hayden _Aww_ 2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Hayden _Aww_.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/here.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/hitbox.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/hurtSFX(bot).mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/hurtSFX.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/I pray arong.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/I Said Bitch.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/icecream.rli");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/jamesnoise1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/jamesnoise2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/jamesnoise3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/julesnoise1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/julesnoise2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/jumpSFX.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/jumpSFX2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/jumpSFX2.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/jumpSFX3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/kick.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Kyle _aww_ 2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Kyle _Aww_.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Kyle _decent_.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/l1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/l2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/land.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/letter(j).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/letter(level4).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/letter.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/levels.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/lilguy.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/mail.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/mainmenu.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/mainmenu2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/mapCSV_Level1_Background.csv");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/mapCSV_Level1_Back_Background.csv");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/mapCSV_Level1_Back_Back_Background.csv");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/mapCSV_Level1_Bots.csv");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/mapCSV_Level1_Fore-Foreground.csv");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/mapCSV_Level1_Foreground.csv");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/menu trees.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/menu.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/menuBox.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/menulake.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/mute.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/NomNomcollect.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/not_a_flower(withGuides).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/not_a_flower.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/not_a_flower2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/nowhere.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/npcNoise2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/nut.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/OOH3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pageflip.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/particle.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/party_pop.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pig.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pig_borg.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pixel.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/player_40x40(letter).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/player_40x40(parachute).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/player_hurt.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/poof.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/poof.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/poof2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pop.aup");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/pop.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000033.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000394.au");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/pop_data/e00/d00/e00004d3.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e00005c4.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e000083d.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000993.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000a0d.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000a83.au");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000b02.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000b2c.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000b60.au");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000c09.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000c9d.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000ce4.au");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000df9.au");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000e93.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/pop_data/e00/d00/e0000eb6.au");
		types.push (AssetType.BINARY);
		
		
		urls.push ("assets/punch.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/punch2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/pwrdown.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/quack.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Quaid.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/quest.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/quest2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/replay.fgr");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/river.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/rockBust.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/rockBust2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/rumble.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/satire.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/satire2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/selectthing.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/slide.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/slidewhistle.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/smoke(template).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/smoke.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/smoke1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/smokelet.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/splat.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/splat.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/spring.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/squirrel.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/stars.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/start.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/StartPage.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/step.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/stream.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/swing&aMiss.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/textmsg1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/the.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/theriver.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/title.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/titlepage.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/to .png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/Tom _aww_.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/Tom _aww_2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/torch.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/tox.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/treeshadows.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/trumpetfanfare_mom.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/umbrella.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/umbrella.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/volcano eruption.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/volcano.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/walkSFX.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/water.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/woody(4)(messingwitcolor).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/woody(4).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/worm.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/Wowiwiw.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/writing.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/z_scoreappear.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (AssetType.MUSIC);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (480),
			orientation: "portrait",
			resizable: true,
			stencilBuffer: false,
			title: "Test",
			vsync: true,
			width: Std.int (640),
			
		}
		
		#if js
		#if (munit || utest)
		flash.Lib.embed (null, 640, 480, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
