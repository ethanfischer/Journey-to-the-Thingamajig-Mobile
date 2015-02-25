package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/alphabet.png", __ASSET__assets_alphabet_png);
		type.set ("assets/alphabet.png", AssetType.IMAGE);
		className.set ("assets/applause.mp3", __ASSET__assets_applause_mp3);
		type.set ("assets/applause.mp3", AssetType.MUSIC);
		className.set ("assets/aww.mp3", __ASSET__assets_aww_mp3);
		type.set ("assets/aww.mp3", AssetType.MUSIC);
		className.set ("assets/bah.mp3", __ASSET__assets_bah_mp3);
		type.set ("assets/bah.mp3", AssetType.MUSIC);
		className.set ("assets/bahfade.mp3", __ASSET__assets_bahfade_mp3);
		type.set ("assets/bahfade.mp3", AssetType.MUSIC);
		className.set ("assets/black.png", __ASSET__assets_black_png);
		type.set ("assets/black.png", AssetType.IMAGE);
		className.set ("assets/blade.png", __ASSET__assets_blade_png);
		type.set ("assets/blade.png", AssetType.IMAGE);
		className.set ("assets/blade2.png", __ASSET__assets_blade2_png);
		type.set ("assets/blade2.png", AssetType.IMAGE);
		className.set ("assets/blagh(Dylan).mp3", __ASSET__assets_blagh_dylan__mp3);
		type.set ("assets/blagh(Dylan).mp3", AssetType.MUSIC);
		className.set ("assets/blue.png", __ASSET__assets_blue_png);
		type.set ("assets/blue.png", AssetType.IMAGE);
		className.set ("assets/Bobby _Aww_ 2.mp3", __ASSET__assets_bobby__aww__2_mp3);
		type.set ("assets/Bobby _Aww_ 2.mp3", AssetType.MUSIC);
		className.set ("assets/Bobby _Aww_.mp3", __ASSET__assets_bobby__aww__mp3);
		type.set ("assets/Bobby _Aww_.mp3", AssetType.MUSIC);
		className.set ("assets/boing.mp3", __ASSET__assets_boing_mp3);
		type.set ("assets/boing.mp3", AssetType.MUSIC);
		className.set ("assets/boot.png", __ASSET__assets_boot_png);
		type.set ("assets/boot.png", AssetType.IMAGE);
		className.set ("assets/borgDeathSFX.mp3", __ASSET__assets_borgdeathsfx_mp3);
		type.set ("assets/borgDeathSFX.mp3", AssetType.MUSIC);
		className.set ("assets/bot2.png", __ASSET__assets_bot2_png);
		type.set ("assets/bot2.png", AssetType.IMAGE);
		className.set ("assets/botKillSFX.mp3", __ASSET__assets_botkillsfx_mp3);
		type.set ("assets/botKillSFX.mp3", AssetType.MUSIC);
		className.set ("assets/botKillSFX2.mp3", __ASSET__assets_botkillsfx2_mp3);
		type.set ("assets/botKillSFX2.mp3", AssetType.MUSIC);
		className.set ("assets/boulder.png", __ASSET__assets_boulder_png);
		type.set ("assets/boulder.png", AssetType.IMAGE);
		className.set ("assets/bouldlet.png", __ASSET__assets_bouldlet_png);
		type.set ("assets/bouldlet.png", AssetType.IMAGE);
		className.set ("assets/bouldletmini.png", __ASSET__assets_bouldletmini_png);
		type.set ("assets/bouldletmini.png", AssetType.IMAGE);
		className.set ("assets/boxGlove.png", __ASSET__assets_boxglove_png);
		type.set ("assets/boxGlove.png", AssetType.IMAGE);
		className.set ("assets/boxGlove2.png", __ASSET__assets_boxglove2_png);
		type.set ("assets/boxGlove2.png", AssetType.IMAGE);
		className.set ("assets/bracket.png", __ASSET__assets_bracket_png);
		type.set ("assets/bracket.png", AssetType.IMAGE);
		className.set ("assets/BUZZER.mp3", __ASSET__assets_buzzer_mp3);
		type.set ("assets/BUZZER.mp3", AssetType.MUSIC);
		className.set ("assets/BUZZER.WAV", __ASSET__assets_buzzer_wav);
		type.set ("assets/BUZZER.WAV", AssetType.SOUND);
		className.set ("assets/caleb_awman.mp3", __ASSET__assets_caleb_awman_mp3);
		type.set ("assets/caleb_awman.mp3", AssetType.MUSIC);
		className.set ("assets/caleb_dangit.mp3", __ASSET__assets_caleb_dangit_mp3);
		type.set ("assets/caleb_dangit.mp3", AssetType.MUSIC);
		className.set ("assets/canopy.png", __ASSET__assets_canopy_png);
		type.set ("assets/canopy.png", AssetType.IMAGE);
		className.set ("assets/canopy6.png", __ASSET__assets_canopy6_png);
		type.set ("assets/canopy6.png", AssetType.IMAGE);
		className.set ("assets/checkpoint.png", __ASSET__assets_checkpoint_png);
		type.set ("assets/checkpoint.png", AssetType.IMAGE);
		className.set ("assets/cheerin.mp3", __ASSET__assets_cheerin_mp3);
		type.set ("assets/cheerin.mp3", AssetType.MUSIC);
		className.set ("assets/chomp.mp3", __ASSET__assets_chomp_mp3);
		type.set ("assets/chomp.mp3", AssetType.MUSIC);
		className.set ("assets/claps.mp3", __ASSET__assets_claps_mp3);
		type.set ("assets/claps.mp3", AssetType.MUSIC);
		className.set ("assets/clinkclankspin.mp3", __ASSET__assets_clinkclankspin_mp3);
		type.set ("assets/clinkclankspin.mp3", AssetType.MUSIC);
		className.set ("assets/cone.png", __ASSET__assets_cone_png);
		type.set ("assets/cone.png", AssetType.IMAGE);
		className.set ("assets/congrats.mp3", __ASSET__assets_congrats_mp3);
		type.set ("assets/congrats.mp3", AssetType.MUSIC);
		className.set ("assets/cream.png", __ASSET__assets_cream_png);
		type.set ("assets/cream.png", AssetType.IMAGE);
		className.set ("assets/cream.rli", __ASSET__assets_cream_rli);
		type.set ("assets/cream.rli", AssetType.BINARY);
		className.set ("assets/cream1.png", __ASSET__assets_cream1_png);
		type.set ("assets/cream1.png", AssetType.IMAGE);
		className.set ("assets/cream2.png", __ASSET__assets_cream2_png);
		type.set ("assets/cream2.png", AssetType.IMAGE);
		className.set ("assets/cream3.png", __ASSET__assets_cream3_png);
		type.set ("assets/cream3.png", AssetType.IMAGE);
		className.set ("assets/crowd-groan.mp3", __ASSET__assets_crowd_groan_mp3);
		type.set ("assets/crowd-groan.mp3", AssetType.MUSIC);
		className.set ("assets/cutscene.png", __ASSET__assets_cutscene_png);
		type.set ("assets/cutscene.png", AssetType.IMAGE);
		className.set ("assets/cutscene6.png", __ASSET__assets_cutscene6_png);
		type.set ("assets/cutscene6.png", AssetType.IMAGE);
		className.set ("assets/Dats Dat Kuuuush.mp3", __ASSET__assets_dats_dat_kuuuush_mp3);
		type.set ("assets/Dats Dat Kuuuush.mp3", AssetType.MUSIC);
		className.set ("assets/deathSFX.mp3", __ASSET__assets_deathsfx_mp3);
		type.set ("assets/deathSFX.mp3", AssetType.MUSIC);
		className.set ("assets/deathSFX2.mp3", __ASSET__assets_deathsfx2_mp3);
		type.set ("assets/deathSFX2.mp3", AssetType.MUSIC);
		className.set ("assets/distant_thunder.mp3", __ASSET__assets_distant_thunder_mp3);
		type.set ("assets/distant_thunder.mp3", AssetType.MUSIC);
		className.set ("assets/Drawer.mp3", __ASSET__assets_drawer_mp3);
		type.set ("assets/Drawer.mp3", AssetType.MUSIC);
		className.set ("assets/drawerslide.mp3", __ASSET__assets_drawerslide_mp3);
		type.set ("assets/drawerslide.mp3", AssetType.MUSIC);
		className.set ("assets/dropMug.mp3", __ASSET__assets_dropmug_mp3);
		type.set ("assets/dropMug.mp3", AssetType.MUSIC);
		className.set ("assets/drumfill.mp3", __ASSET__assets_drumfill_mp3);
		type.set ("assets/drumfill.mp3", AssetType.MUSIC);
		className.set ("assets/drumroll.mp3", __ASSET__assets_drumroll_mp3);
		type.set ("assets/drumroll.mp3", AssetType.MUSIC);
		className.set ("assets/dylan_noooo.mp3", __ASSET__assets_dylan_noooo_mp3);
		type.set ("assets/dylan_noooo.mp3", AssetType.MUSIC);
		className.set ("assets/dylan_ohshit.mp3", __ASSET__assets_dylan_ohshit_mp3);
		type.set ("assets/dylan_ohshit.mp3", AssetType.MUSIC);
		className.set ("assets/dylan_ooo.mp3", __ASSET__assets_dylan_ooo_mp3);
		type.set ("assets/dylan_ooo.mp3", AssetType.MUSIC);
		className.set ("assets/egg(2).png", __ASSET__assets_egg_2__png);
		type.set ("assets/egg(2).png", AssetType.IMAGE);
		className.set ("assets/egg.png", __ASSET__assets_egg_png);
		type.set ("assets/egg.png", AssetType.IMAGE);
		className.set ("assets/eject.mp3", __ASSET__assets_eject_mp3);
		type.set ("assets/eject.mp3", AssetType.MUSIC);
		className.set ("assets/elevator.png", __ASSET__assets_elevator_png);
		type.set ("assets/elevator.png", AssetType.IMAGE);
		className.set ("assets/ending.png", __ASSET__assets_ending_png);
		type.set ("assets/ending.png", AssetType.IMAGE);
		className.set ("assets/envelope.png", __ASSET__assets_envelope_png);
		type.set ("assets/envelope.png", AssetType.IMAGE);
		className.set ("assets/fadein_chord.mp3", __ASSET__assets_fadein_chord_mp3);
		type.set ("assets/fadein_chord.mp3", AssetType.MUSIC);
		className.set ("assets/fas.mp3", __ASSET__assets_fas_mp3);
		type.set ("assets/fas.mp3", AssetType.MUSIC);
		className.set ("assets/faststep.mp3", __ASSET__assets_faststep_mp3);
		type.set ("assets/faststep.mp3", AssetType.MUSIC);
		className.set ("assets/foldpaper(openletter).mp3", __ASSET__assets_foldpaper_openletter__mp3);
		type.set ("assets/foldpaper(openletter).mp3", AssetType.MUSIC);
		className.set ("assets/foldpaper.mp3", __ASSET__assets_foldpaper_mp3);
		type.set ("assets/foldpaper.mp3", AssetType.MUSIC);
		className.set ("assets/footstep.mp3", __ASSET__assets_footstep_mp3);
		type.set ("assets/footstep.mp3", AssetType.MUSIC);
		className.set ("assets/forestsounds.mp3", __ASSET__assets_forestsounds_mp3);
		type.set ("assets/forestsounds.mp3", AssetType.MUSIC);
		className.set ("assets/forestsounds2.mp3", __ASSET__assets_forestsounds2_mp3);
		type.set ("assets/forestsounds2.mp3", AssetType.MUSIC);
		className.set ("assets/forest_2.png", __ASSET__assets_forest_2_png);
		type.set ("assets/forest_2.png", AssetType.IMAGE);
		className.set ("assets/forest_4.png", __ASSET__assets_forest_4_png);
		type.set ("assets/forest_4.png", AssetType.IMAGE);
		className.set ("assets/forest_5.png", __ASSET__assets_forest_5_png);
		type.set ("assets/forest_5.png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(19).png", __ASSET__assets_forest_tiles_19__png);
		type.set ("assets/forest_tiles(19).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(2).png", __ASSET__assets_forest_tiles_2__png);
		type.set ("assets/forest_tiles(2).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(20).png", __ASSET__assets_forest_tiles_20__png);
		type.set ("assets/forest_tiles(20).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(21).png", __ASSET__assets_forest_tiles_21__png);
		type.set ("assets/forest_tiles(21).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(22).png", __ASSET__assets_forest_tiles_22__png);
		type.set ("assets/forest_tiles(22).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(23).png", __ASSET__assets_forest_tiles_23__png);
		type.set ("assets/forest_tiles(23).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(24).png", __ASSET__assets_forest_tiles_24__png);
		type.set ("assets/forest_tiles(24).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(25).png", __ASSET__assets_forest_tiles_25__png);
		type.set ("assets/forest_tiles(25).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(3).png", __ASSET__assets_forest_tiles_3__png);
		type.set ("assets/forest_tiles(3).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(4).png", __ASSET__assets_forest_tiles_4__png);
		type.set ("assets/forest_tiles(4).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles(b+w).png", __ASSET__assets_forest_tiles_b_w__png);
		type.set ("assets/forest_tiles(b+w).png", AssetType.IMAGE);
		className.set ("assets/forest_tiles_night.png", __ASSET__assets_forest_tiles_night_png);
		type.set ("assets/forest_tiles_night.png", AssetType.IMAGE);
		className.set ("assets/gasp_x.mp3", __ASSET__assets_gasp_x_mp3);
		type.set ("assets/gasp_x.mp3", AssetType.MUSIC);
		className.set ("assets/gong(supposedly).mp3", __ASSET__assets_gong_supposedly__mp3);
		type.set ("assets/gong(supposedly).mp3", AssetType.MUSIC);
		className.set ("assets/Gucci.mp3", __ASSET__assets_gucci_mp3);
		type.set ("assets/Gucci.mp3", AssetType.MUSIC);
		className.set ("assets/Hayden _Aww_ 2.mp3", __ASSET__assets_hayden__aww__2_mp3);
		type.set ("assets/Hayden _Aww_ 2.mp3", AssetType.MUSIC);
		className.set ("assets/Hayden _Aww_.mp3", __ASSET__assets_hayden__aww__mp3);
		type.set ("assets/Hayden _Aww_.mp3", AssetType.MUSIC);
		className.set ("assets/here.mp3", __ASSET__assets_here_mp3);
		type.set ("assets/here.mp3", AssetType.MUSIC);
		className.set ("assets/hitbox.png", __ASSET__assets_hitbox_png);
		type.set ("assets/hitbox.png", AssetType.IMAGE);
		className.set ("assets/hurtSFX(bot).mp3", __ASSET__assets_hurtsfx_bot__mp3);
		type.set ("assets/hurtSFX(bot).mp3", AssetType.MUSIC);
		className.set ("assets/hurtSFX.mp3", __ASSET__assets_hurtsfx_mp3);
		type.set ("assets/hurtSFX.mp3", AssetType.MUSIC);
		className.set ("assets/I pray arong.mp3", __ASSET__assets_i_pray_arong_mp3);
		type.set ("assets/I pray arong.mp3", AssetType.MUSIC);
		className.set ("assets/I Said Bitch.mp3", __ASSET__assets_i_said_bitch_mp3);
		type.set ("assets/I Said Bitch.mp3", AssetType.MUSIC);
		className.set ("assets/icecream.rli", __ASSET__assets_icecream_rli);
		type.set ("assets/icecream.rli", AssetType.BINARY);
		className.set ("assets/jamesnoise1.mp3", __ASSET__assets_jamesnoise1_mp3);
		type.set ("assets/jamesnoise1.mp3", AssetType.MUSIC);
		className.set ("assets/jamesnoise2.mp3", __ASSET__assets_jamesnoise2_mp3);
		type.set ("assets/jamesnoise2.mp3", AssetType.MUSIC);
		className.set ("assets/jamesnoise3.mp3", __ASSET__assets_jamesnoise3_mp3);
		type.set ("assets/jamesnoise3.mp3", AssetType.MUSIC);
		className.set ("assets/julesnoise1.mp3", __ASSET__assets_julesnoise1_mp3);
		type.set ("assets/julesnoise1.mp3", AssetType.MUSIC);
		className.set ("assets/julesnoise2.mp3", __ASSET__assets_julesnoise2_mp3);
		type.set ("assets/julesnoise2.mp3", AssetType.MUSIC);
		className.set ("assets/jumpSFX.mp3", __ASSET__assets_jumpsfx_mp3);
		type.set ("assets/jumpSFX.mp3", AssetType.MUSIC);
		className.set ("assets/jumpSFX2.mp3", __ASSET__assets_jumpsfx2_mp3);
		type.set ("assets/jumpSFX2.mp3", AssetType.MUSIC);
		className.set ("assets/jumpSFX2.wav", __ASSET__assets_jumpsfx2_wav);
		type.set ("assets/jumpSFX2.wav", AssetType.SOUND);
		className.set ("assets/jumpSFX3.mp3", __ASSET__assets_jumpsfx3_mp3);
		type.set ("assets/jumpSFX3.mp3", AssetType.MUSIC);
		className.set ("assets/kick.mp3", __ASSET__assets_kick_mp3);
		type.set ("assets/kick.mp3", AssetType.MUSIC);
		className.set ("assets/Kyle _aww_ 2.mp3", __ASSET__assets_kyle__aww__2_mp3);
		type.set ("assets/Kyle _aww_ 2.mp3", AssetType.MUSIC);
		className.set ("assets/Kyle _Aww_.mp3", __ASSET__assets_kyle__aww__mp3);
		type.set ("assets/Kyle _Aww_.mp3", AssetType.MUSIC);
		className.set ("assets/Kyle _decent_.mp3", __ASSET__assets_kyle__decent__mp3);
		type.set ("assets/Kyle _decent_.mp3", AssetType.MUSIC);
		className.set ("assets/l1.png", __ASSET__assets_l1_png);
		type.set ("assets/l1.png", AssetType.IMAGE);
		className.set ("assets/l2.png", __ASSET__assets_l2_png);
		type.set ("assets/l2.png", AssetType.IMAGE);
		className.set ("assets/land.mp3", __ASSET__assets_land_mp3);
		type.set ("assets/land.mp3", AssetType.MUSIC);
		className.set ("assets/letter(j).png", __ASSET__assets_letter_j__png);
		type.set ("assets/letter(j).png", AssetType.IMAGE);
		className.set ("assets/letter(level4).png", __ASSET__assets_letter_level4__png);
		type.set ("assets/letter(level4).png", AssetType.IMAGE);
		className.set ("assets/letter.png", __ASSET__assets_letter_png);
		type.set ("assets/letter.png", AssetType.IMAGE);
		className.set ("assets/levels.png", __ASSET__assets_levels_png);
		type.set ("assets/levels.png", AssetType.IMAGE);
		className.set ("assets/lilguy.png", __ASSET__assets_lilguy_png);
		type.set ("assets/lilguy.png", AssetType.IMAGE);
		className.set ("assets/mail.png", __ASSET__assets_mail_png);
		type.set ("assets/mail.png", AssetType.IMAGE);
		className.set ("assets/mainmenu.png", __ASSET__assets_mainmenu_png);
		type.set ("assets/mainmenu.png", AssetType.IMAGE);
		className.set ("assets/mainmenu2.png", __ASSET__assets_mainmenu2_png);
		type.set ("assets/mainmenu2.png", AssetType.IMAGE);
		className.set ("assets/mapCSV_Level1_Background.csv", __ASSET__assets_mapcsv_level1_background_csv);
		type.set ("assets/mapCSV_Level1_Background.csv", AssetType.TEXT);
		className.set ("assets/mapCSV_Level1_Back_Background.csv", __ASSET__assets_mapcsv_level1_back_background_csv);
		type.set ("assets/mapCSV_Level1_Back_Background.csv", AssetType.TEXT);
		className.set ("assets/mapCSV_Level1_Back_Back_Background.csv", __ASSET__assets_mapcsv_level1_back_back_background_csv);
		type.set ("assets/mapCSV_Level1_Back_Back_Background.csv", AssetType.TEXT);
		className.set ("assets/mapCSV_Level1_Bots.csv", __ASSET__assets_mapcsv_level1_bots_csv);
		type.set ("assets/mapCSV_Level1_Bots.csv", AssetType.TEXT);
		className.set ("assets/mapCSV_Level1_Fore-Foreground.csv", __ASSET__assets_mapcsv_level1_fore_foreground_csv);
		type.set ("assets/mapCSV_Level1_Fore-Foreground.csv", AssetType.TEXT);
		className.set ("assets/mapCSV_Level1_Foreground.csv", __ASSET__assets_mapcsv_level1_foreground_csv);
		type.set ("assets/mapCSV_Level1_Foreground.csv", AssetType.TEXT);
		className.set ("assets/menu trees.png", __ASSET__assets_menu_trees_png);
		type.set ("assets/menu trees.png", AssetType.IMAGE);
		className.set ("assets/menu.png", __ASSET__assets_menu_png);
		type.set ("assets/menu.png", AssetType.IMAGE);
		className.set ("assets/menuBox.png", __ASSET__assets_menubox_png);
		type.set ("assets/menuBox.png", AssetType.IMAGE);
		className.set ("assets/menulake.png", __ASSET__assets_menulake_png);
		type.set ("assets/menulake.png", AssetType.IMAGE);
		className.set ("assets/mute.png", __ASSET__assets_mute_png);
		type.set ("assets/mute.png", AssetType.IMAGE);
		className.set ("assets/NomNomcollect.mp3", __ASSET__assets_nomnomcollect_mp3);
		type.set ("assets/NomNomcollect.mp3", AssetType.MUSIC);
		className.set ("assets/not_a_flower(withGuides).png", __ASSET__assets_not_a_flower_withguides__png);
		type.set ("assets/not_a_flower(withGuides).png", AssetType.IMAGE);
		className.set ("assets/not_a_flower.png", __ASSET__assets_not_a_flower_png);
		type.set ("assets/not_a_flower.png", AssetType.IMAGE);
		className.set ("assets/not_a_flower2.png", __ASSET__assets_not_a_flower2_png);
		type.set ("assets/not_a_flower2.png", AssetType.IMAGE);
		className.set ("assets/nowhere.png", __ASSET__assets_nowhere_png);
		type.set ("assets/nowhere.png", AssetType.IMAGE);
		className.set ("assets/npcNoise2.mp3", __ASSET__assets_npcnoise2_mp3);
		type.set ("assets/npcNoise2.mp3", AssetType.MUSIC);
		className.set ("assets/nut.png", __ASSET__assets_nut_png);
		type.set ("assets/nut.png", AssetType.IMAGE);
		className.set ("assets/OOH3.mp3", __ASSET__assets_ooh3_mp3);
		type.set ("assets/OOH3.mp3", AssetType.MUSIC);
		className.set ("assets/pageflip.mp3", __ASSET__assets_pageflip_mp3);
		type.set ("assets/pageflip.mp3", AssetType.MUSIC);
		className.set ("assets/particle.png", __ASSET__assets_particle_png);
		type.set ("assets/particle.png", AssetType.IMAGE);
		className.set ("assets/party_pop.mp3", __ASSET__assets_party_pop_mp3);
		type.set ("assets/party_pop.mp3", AssetType.MUSIC);
		className.set ("assets/pig.mp3", __ASSET__assets_pig_mp3);
		type.set ("assets/pig.mp3", AssetType.MUSIC);
		className.set ("assets/pig_borg.mp3", __ASSET__assets_pig_borg_mp3);
		type.set ("assets/pig_borg.mp3", AssetType.MUSIC);
		className.set ("assets/pixel.png", __ASSET__assets_pixel_png);
		type.set ("assets/pixel.png", AssetType.IMAGE);
		className.set ("assets/player_40x40(letter).png", __ASSET__assets_player_40x40_letter__png);
		type.set ("assets/player_40x40(letter).png", AssetType.IMAGE);
		className.set ("assets/player_40x40(parachute).png", __ASSET__assets_player_40x40_parachute__png);
		type.set ("assets/player_40x40(parachute).png", AssetType.IMAGE);
		className.set ("assets/player_hurt.png", __ASSET__assets_player_hurt_png);
		type.set ("assets/player_hurt.png", AssetType.IMAGE);
		className.set ("assets/poof.mp3", __ASSET__assets_poof_mp3);
		type.set ("assets/poof.mp3", AssetType.MUSIC);
		className.set ("assets/poof.png", __ASSET__assets_poof_png);
		type.set ("assets/poof.png", AssetType.IMAGE);
		className.set ("assets/poof2.mp3", __ASSET__assets_poof2_mp3);
		type.set ("assets/poof2.mp3", AssetType.MUSIC);
		className.set ("assets/pop.aup", __ASSET__assets_pop_aup);
		type.set ("assets/pop.aup", AssetType.TEXT);
		className.set ("assets/pop.mp3", __ASSET__assets_pop_mp3);
		type.set ("assets/pop.mp3", AssetType.MUSIC);
		className.set ("assets/pop_data/e00/d00/e0000033.au", __ASSET__assets_pop_data_e00_d00_e0000033_au);
		type.set ("assets/pop_data/e00/d00/e0000033.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000394.au", __ASSET__assets_pop_data_e00_d00_e0000394_au);
		type.set ("assets/pop_data/e00/d00/e0000394.au", AssetType.TEXT);
		className.set ("assets/pop_data/e00/d00/e00004d3.au", __ASSET__assets_pop_data_e00_d00_e00004d3_au);
		type.set ("assets/pop_data/e00/d00/e00004d3.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e00005c4.au", __ASSET__assets_pop_data_e00_d00_e00005c4_au);
		type.set ("assets/pop_data/e00/d00/e00005c4.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e000083d.au", __ASSET__assets_pop_data_e00_d00_e000083d_au);
		type.set ("assets/pop_data/e00/d00/e000083d.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000993.au", __ASSET__assets_pop_data_e00_d00_e0000993_au);
		type.set ("assets/pop_data/e00/d00/e0000993.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000a0d.au", __ASSET__assets_pop_data_e00_d00_e0000a0d_au);
		type.set ("assets/pop_data/e00/d00/e0000a0d.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000a83.au", __ASSET__assets_pop_data_e00_d00_e0000a83_au);
		type.set ("assets/pop_data/e00/d00/e0000a83.au", AssetType.TEXT);
		className.set ("assets/pop_data/e00/d00/e0000b02.au", __ASSET__assets_pop_data_e00_d00_e0000b02_au);
		type.set ("assets/pop_data/e00/d00/e0000b02.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000b2c.au", __ASSET__assets_pop_data_e00_d00_e0000b2c_au);
		type.set ("assets/pop_data/e00/d00/e0000b2c.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000b60.au", __ASSET__assets_pop_data_e00_d00_e0000b60_au);
		type.set ("assets/pop_data/e00/d00/e0000b60.au", AssetType.TEXT);
		className.set ("assets/pop_data/e00/d00/e0000c09.au", __ASSET__assets_pop_data_e00_d00_e0000c09_au);
		type.set ("assets/pop_data/e00/d00/e0000c09.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000c9d.au", __ASSET__assets_pop_data_e00_d00_e0000c9d_au);
		type.set ("assets/pop_data/e00/d00/e0000c9d.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000ce4.au", __ASSET__assets_pop_data_e00_d00_e0000ce4_au);
		type.set ("assets/pop_data/e00/d00/e0000ce4.au", AssetType.TEXT);
		className.set ("assets/pop_data/e00/d00/e0000df9.au", __ASSET__assets_pop_data_e00_d00_e0000df9_au);
		type.set ("assets/pop_data/e00/d00/e0000df9.au", AssetType.TEXT);
		className.set ("assets/pop_data/e00/d00/e0000e93.au", __ASSET__assets_pop_data_e00_d00_e0000e93_au);
		type.set ("assets/pop_data/e00/d00/e0000e93.au", AssetType.BINARY);
		className.set ("assets/pop_data/e00/d00/e0000eb6.au", __ASSET__assets_pop_data_e00_d00_e0000eb6_au);
		type.set ("assets/pop_data/e00/d00/e0000eb6.au", AssetType.BINARY);
		className.set ("assets/punch.mp3", __ASSET__assets_punch_mp3);
		type.set ("assets/punch.mp3", AssetType.MUSIC);
		className.set ("assets/punch2.mp3", __ASSET__assets_punch2_mp3);
		type.set ("assets/punch2.mp3", AssetType.MUSIC);
		className.set ("assets/pwrdown.wav", __ASSET__assets_pwrdown_wav);
		type.set ("assets/pwrdown.wav", AssetType.SOUND);
		className.set ("assets/quack.mp3", __ASSET__assets_quack_mp3);
		type.set ("assets/quack.mp3", AssetType.MUSIC);
		className.set ("assets/Quaid.png", __ASSET__assets_quaid_png);
		type.set ("assets/Quaid.png", AssetType.IMAGE);
		className.set ("assets/quest.png", __ASSET__assets_quest_png);
		type.set ("assets/quest.png", AssetType.IMAGE);
		className.set ("assets/quest2.png", __ASSET__assets_quest2_png);
		type.set ("assets/quest2.png", AssetType.IMAGE);
		className.set ("assets/replay.fgr", __ASSET__assets_replay_fgr);
		type.set ("assets/replay.fgr", AssetType.TEXT);
		className.set ("assets/river.mp3", __ASSET__assets_river_mp3);
		type.set ("assets/river.mp3", AssetType.MUSIC);
		className.set ("assets/rockBust.mp3", __ASSET__assets_rockbust_mp3);
		type.set ("assets/rockBust.mp3", AssetType.MUSIC);
		className.set ("assets/rockBust2.mp3", __ASSET__assets_rockbust2_mp3);
		type.set ("assets/rockBust2.mp3", AssetType.MUSIC);
		className.set ("assets/rumble.mp3", __ASSET__assets_rumble_mp3);
		type.set ("assets/rumble.mp3", AssetType.MUSIC);
		className.set ("assets/satire.png", __ASSET__assets_satire_png);
		type.set ("assets/satire.png", AssetType.IMAGE);
		className.set ("assets/satire2.png", __ASSET__assets_satire2_png);
		type.set ("assets/satire2.png", AssetType.IMAGE);
		className.set ("assets/selectthing.png", __ASSET__assets_selectthing_png);
		type.set ("assets/selectthing.png", AssetType.IMAGE);
		className.set ("assets/slide.mp3", __ASSET__assets_slide_mp3);
		type.set ("assets/slide.mp3", AssetType.MUSIC);
		className.set ("assets/slidewhistle.mp3", __ASSET__assets_slidewhistle_mp3);
		type.set ("assets/slidewhistle.mp3", AssetType.MUSIC);
		className.set ("assets/smoke(template).png", __ASSET__assets_smoke_template__png);
		type.set ("assets/smoke(template).png", AssetType.IMAGE);
		className.set ("assets/smoke.png", __ASSET__assets_smoke_png);
		type.set ("assets/smoke.png", AssetType.IMAGE);
		className.set ("assets/smoke1.png", __ASSET__assets_smoke1_png);
		type.set ("assets/smoke1.png", AssetType.IMAGE);
		className.set ("assets/smokelet.png", __ASSET__assets_smokelet_png);
		type.set ("assets/smokelet.png", AssetType.IMAGE);
		className.set ("assets/splat.mp3", __ASSET__assets_splat_mp3);
		type.set ("assets/splat.mp3", AssetType.MUSIC);
		className.set ("assets/splat.png", __ASSET__assets_splat_png);
		type.set ("assets/splat.png", AssetType.IMAGE);
		className.set ("assets/spring.png", __ASSET__assets_spring_png);
		type.set ("assets/spring.png", AssetType.IMAGE);
		className.set ("assets/squirrel.png", __ASSET__assets_squirrel_png);
		type.set ("assets/squirrel.png", AssetType.IMAGE);
		className.set ("assets/stars.png", __ASSET__assets_stars_png);
		type.set ("assets/stars.png", AssetType.IMAGE);
		className.set ("assets/start.png", __ASSET__assets_start_png);
		type.set ("assets/start.png", AssetType.IMAGE);
		className.set ("assets/StartPage.png", __ASSET__assets_startpage_png);
		type.set ("assets/StartPage.png", AssetType.IMAGE);
		className.set ("assets/step.mp3", __ASSET__assets_step_mp3);
		type.set ("assets/step.mp3", AssetType.MUSIC);
		className.set ("assets/stream.png", __ASSET__assets_stream_png);
		type.set ("assets/stream.png", AssetType.IMAGE);
		className.set ("assets/swing&aMiss.mp3", __ASSET__assets_swing_amiss_mp3);
		type.set ("assets/swing&aMiss.mp3", AssetType.MUSIC);
		className.set ("assets/textmsg1.png", __ASSET__assets_textmsg1_png);
		type.set ("assets/textmsg1.png", AssetType.IMAGE);
		className.set ("assets/the.png", __ASSET__assets_the_png);
		type.set ("assets/the.png", AssetType.IMAGE);
		className.set ("assets/theriver.png", __ASSET__assets_theriver_png);
		type.set ("assets/theriver.png", AssetType.IMAGE);
		className.set ("assets/title.png", __ASSET__assets_title_png);
		type.set ("assets/title.png", AssetType.IMAGE);
		className.set ("assets/titlepage.png", __ASSET__assets_titlepage_png);
		type.set ("assets/titlepage.png", AssetType.IMAGE);
		className.set ("assets/to .png", __ASSET__assets_to__png);
		type.set ("assets/to .png", AssetType.IMAGE);
		className.set ("assets/Tom _aww_.mp3", __ASSET__assets_tom__aww__mp3);
		type.set ("assets/Tom _aww_.mp3", AssetType.MUSIC);
		className.set ("assets/Tom _aww_2.mp3", __ASSET__assets_tom__aww_2_mp3);
		type.set ("assets/Tom _aww_2.mp3", AssetType.MUSIC);
		className.set ("assets/torch.png", __ASSET__assets_torch_png);
		type.set ("assets/torch.png", AssetType.IMAGE);
		className.set ("assets/tox.png", __ASSET__assets_tox_png);
		type.set ("assets/tox.png", AssetType.IMAGE);
		className.set ("assets/treeshadows.png", __ASSET__assets_treeshadows_png);
		type.set ("assets/treeshadows.png", AssetType.IMAGE);
		className.set ("assets/trumpetfanfare_mom.mp3", __ASSET__assets_trumpetfanfare_mom_mp3);
		type.set ("assets/trumpetfanfare_mom.mp3", AssetType.MUSIC);
		className.set ("assets/umbrella.mp3", __ASSET__assets_umbrella_mp3);
		type.set ("assets/umbrella.mp3", AssetType.MUSIC);
		className.set ("assets/umbrella.png", __ASSET__assets_umbrella_png);
		type.set ("assets/umbrella.png", AssetType.IMAGE);
		className.set ("assets/volcano eruption.png", __ASSET__assets_volcano_eruption_png);
		type.set ("assets/volcano eruption.png", AssetType.IMAGE);
		className.set ("assets/volcano.png", __ASSET__assets_volcano_png);
		type.set ("assets/volcano.png", AssetType.IMAGE);
		className.set ("assets/walkSFX.mp3", __ASSET__assets_walksfx_mp3);
		type.set ("assets/walkSFX.mp3", AssetType.MUSIC);
		className.set ("assets/water.mp3", __ASSET__assets_water_mp3);
		type.set ("assets/water.mp3", AssetType.MUSIC);
		className.set ("assets/woody(4)(messingwitcolor).png", __ASSET__assets_woody_4__messingwitcolor__png);
		type.set ("assets/woody(4)(messingwitcolor).png", AssetType.IMAGE);
		className.set ("assets/woody(4).png", __ASSET__assets_woody_4__png);
		type.set ("assets/woody(4).png", AssetType.IMAGE);
		className.set ("assets/worm.png", __ASSET__assets_worm_png);
		type.set ("assets/worm.png", AssetType.IMAGE);
		className.set ("assets/Wowiwiw.mp3", __ASSET__assets_wowiwiw_mp3);
		type.set ("assets/Wowiwiw.mp3", AssetType.MUSIC);
		className.set ("assets/writing.mp3", __ASSET__assets_writing_mp3);
		type.set ("assets/writing.mp3", AssetType.MUSIC);
		className.set ("assets/z_scoreappear.mp3", __ASSET__assets_z_scoreappear_mp3);
		type.set ("assets/z_scoreappear.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/alphabet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/applause.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/aww.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/bah.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/bahfade.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/black.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/blade.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/blade2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/blagh(Dylan).mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/blue.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/Bobby _Aww_ 2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Bobby _Aww_.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/boing.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/boot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/borgDeathSFX.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/bot2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/botKillSFX.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/botKillSFX2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/boulder.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bouldlet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bouldletmini.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/boxGlove.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/boxGlove2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bracket.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/BUZZER.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/BUZZER.WAV";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/caleb_awman.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/caleb_dangit.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/canopy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/canopy6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/checkpoint.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/cheerin.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/chomp.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/claps.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/clinkclankspin.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/cone.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/congrats.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/cream.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/cream.rli";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/cream1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/cream2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/cream3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/crowd-groan.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/cutscene.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/cutscene6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/Dats Dat Kuuuush.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/deathSFX.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/deathSFX2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/distant_thunder.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Drawer.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/drawerslide.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/dropMug.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/drumfill.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/drumroll.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/dylan_noooo.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/dylan_ohshit.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/dylan_ooo.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/egg(2).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/egg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/eject.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/elevator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/ending.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/envelope.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/fadein_chord.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/fas.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/faststep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/foldpaper(openletter).mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/foldpaper.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/footstep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/forestsounds.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/forestsounds2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/forest_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(19).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(2).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(20).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(21).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(22).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(23).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(24).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(25).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(3).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(4).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles(b+w).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/forest_tiles_night.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/gasp_x.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/gong(supposedly).mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Gucci.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Hayden _Aww_ 2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Hayden _Aww_.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/here.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/hitbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/hurtSFX(bot).mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/hurtSFX.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/I pray arong.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/I Said Bitch.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/icecream.rli";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/jamesnoise1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/jamesnoise2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/jamesnoise3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/julesnoise1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/julesnoise2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/jumpSFX.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/jumpSFX2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/jumpSFX2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/jumpSFX3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/kick.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Kyle _aww_ 2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Kyle _Aww_.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Kyle _decent_.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/l1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/l2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/land.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/letter(j).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/letter(level4).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/letter.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/levels.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/lilguy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/mail.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/mainmenu.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/mainmenu2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/mapCSV_Level1_Background.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/mapCSV_Level1_Back_Background.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/mapCSV_Level1_Back_Back_Background.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/mapCSV_Level1_Bots.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/mapCSV_Level1_Fore-Foreground.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/mapCSV_Level1_Foreground.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/menu trees.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/menu.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/menuBox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/menulake.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/mute.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/NomNomcollect.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/not_a_flower(withGuides).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/not_a_flower.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/not_a_flower2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/nowhere.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/npcNoise2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/nut.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/OOH3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pageflip.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/particle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/party_pop.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pig.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pig_borg.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pixel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/player_40x40(letter).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/player_40x40(parachute).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/player_hurt.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/poof.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/poof.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/poof2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pop.aup";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pop.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pop_data/e00/d00/e0000033.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000394.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pop_data/e00/d00/e00004d3.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e00005c4.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e000083d.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000993.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000a0d.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000a83.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pop_data/e00/d00/e0000b02.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000b2c.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000b60.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pop_data/e00/d00/e0000c09.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000c9d.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000ce4.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pop_data/e00/d00/e0000df9.au";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pop_data/e00/d00/e0000e93.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/pop_data/e00/d00/e0000eb6.au";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/punch.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/punch2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/pwrdown.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/quack.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Quaid.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/quest.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/quest2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/replay.fgr";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/river.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/rockBust.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/rockBust2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/rumble.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/satire.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/satire2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/selectthing.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/slide.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/slidewhistle.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/smoke(template).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/smoke.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/smoke1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/smokelet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/splat.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/splat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/spring.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/squirrel.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/stars.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/start.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/StartPage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/step.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/stream.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/swing&aMiss.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/textmsg1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/the.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/theriver.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/titlepage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/to .png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/Tom _aww_.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/Tom _aww_2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/torch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/tox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/treeshadows.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/trumpetfanfare_mom.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/umbrella.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/umbrella.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/volcano eruption.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/volcano.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/walkSFX.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/water.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/woody(4)(messingwitcolor).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/woody(4).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/worm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/Wowiwiw.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/writing.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/z_scoreappear.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/alphabet.png", __ASSET__assets_alphabet_png);
		type.set ("assets/alphabet.png", AssetType.IMAGE);
		
		className.set ("assets/applause.mp3", __ASSET__assets_applause_mp3);
		type.set ("assets/applause.mp3", AssetType.MUSIC);
		
		className.set ("assets/aww.mp3", __ASSET__assets_aww_mp3);
		type.set ("assets/aww.mp3", AssetType.MUSIC);
		
		className.set ("assets/bah.mp3", __ASSET__assets_bah_mp3);
		type.set ("assets/bah.mp3", AssetType.MUSIC);
		
		className.set ("assets/bahfade.mp3", __ASSET__assets_bahfade_mp3);
		type.set ("assets/bahfade.mp3", AssetType.MUSIC);
		
		className.set ("assets/black.png", __ASSET__assets_black_png);
		type.set ("assets/black.png", AssetType.IMAGE);
		
		className.set ("assets/blade.png", __ASSET__assets_blade_png);
		type.set ("assets/blade.png", AssetType.IMAGE);
		
		className.set ("assets/blade2.png", __ASSET__assets_blade2_png);
		type.set ("assets/blade2.png", AssetType.IMAGE);
		
		className.set ("assets/blagh(Dylan).mp3", __ASSET__assets_blagh_dylan__mp3);
		type.set ("assets/blagh(Dylan).mp3", AssetType.MUSIC);
		
		className.set ("assets/blue.png", __ASSET__assets_blue_png);
		type.set ("assets/blue.png", AssetType.IMAGE);
		
		className.set ("assets/Bobby _Aww_ 2.mp3", __ASSET__assets_bobby__aww__2_mp3);
		type.set ("assets/Bobby _Aww_ 2.mp3", AssetType.MUSIC);
		
		className.set ("assets/Bobby _Aww_.mp3", __ASSET__assets_bobby__aww__mp3);
		type.set ("assets/Bobby _Aww_.mp3", AssetType.MUSIC);
		
		className.set ("assets/boing.mp3", __ASSET__assets_boing_mp3);
		type.set ("assets/boing.mp3", AssetType.MUSIC);
		
		className.set ("assets/boot.png", __ASSET__assets_boot_png);
		type.set ("assets/boot.png", AssetType.IMAGE);
		
		className.set ("assets/borgDeathSFX.mp3", __ASSET__assets_borgdeathsfx_mp3);
		type.set ("assets/borgDeathSFX.mp3", AssetType.MUSIC);
		
		className.set ("assets/bot2.png", __ASSET__assets_bot2_png);
		type.set ("assets/bot2.png", AssetType.IMAGE);
		
		className.set ("assets/botKillSFX.mp3", __ASSET__assets_botkillsfx_mp3);
		type.set ("assets/botKillSFX.mp3", AssetType.MUSIC);
		
		className.set ("assets/botKillSFX2.mp3", __ASSET__assets_botkillsfx2_mp3);
		type.set ("assets/botKillSFX2.mp3", AssetType.MUSIC);
		
		className.set ("assets/boulder.png", __ASSET__assets_boulder_png);
		type.set ("assets/boulder.png", AssetType.IMAGE);
		
		className.set ("assets/bouldlet.png", __ASSET__assets_bouldlet_png);
		type.set ("assets/bouldlet.png", AssetType.IMAGE);
		
		className.set ("assets/bouldletmini.png", __ASSET__assets_bouldletmini_png);
		type.set ("assets/bouldletmini.png", AssetType.IMAGE);
		
		className.set ("assets/boxGlove.png", __ASSET__assets_boxglove_png);
		type.set ("assets/boxGlove.png", AssetType.IMAGE);
		
		className.set ("assets/boxGlove2.png", __ASSET__assets_boxglove2_png);
		type.set ("assets/boxGlove2.png", AssetType.IMAGE);
		
		className.set ("assets/bracket.png", __ASSET__assets_bracket_png);
		type.set ("assets/bracket.png", AssetType.IMAGE);
		
		className.set ("assets/BUZZER.mp3", __ASSET__assets_buzzer_mp3);
		type.set ("assets/BUZZER.mp3", AssetType.MUSIC);
		
		className.set ("assets/BUZZER.WAV", __ASSET__assets_buzzer_wav);
		type.set ("assets/BUZZER.WAV", AssetType.SOUND);
		
		className.set ("assets/caleb_awman.mp3", __ASSET__assets_caleb_awman_mp3);
		type.set ("assets/caleb_awman.mp3", AssetType.MUSIC);
		
		className.set ("assets/caleb_dangit.mp3", __ASSET__assets_caleb_dangit_mp3);
		type.set ("assets/caleb_dangit.mp3", AssetType.MUSIC);
		
		className.set ("assets/canopy.png", __ASSET__assets_canopy_png);
		type.set ("assets/canopy.png", AssetType.IMAGE);
		
		className.set ("assets/canopy6.png", __ASSET__assets_canopy6_png);
		type.set ("assets/canopy6.png", AssetType.IMAGE);
		
		className.set ("assets/checkpoint.png", __ASSET__assets_checkpoint_png);
		type.set ("assets/checkpoint.png", AssetType.IMAGE);
		
		className.set ("assets/cheerin.mp3", __ASSET__assets_cheerin_mp3);
		type.set ("assets/cheerin.mp3", AssetType.MUSIC);
		
		className.set ("assets/chomp.mp3", __ASSET__assets_chomp_mp3);
		type.set ("assets/chomp.mp3", AssetType.MUSIC);
		
		className.set ("assets/claps.mp3", __ASSET__assets_claps_mp3);
		type.set ("assets/claps.mp3", AssetType.MUSIC);
		
		className.set ("assets/clinkclankspin.mp3", __ASSET__assets_clinkclankspin_mp3);
		type.set ("assets/clinkclankspin.mp3", AssetType.MUSIC);
		
		className.set ("assets/cone.png", __ASSET__assets_cone_png);
		type.set ("assets/cone.png", AssetType.IMAGE);
		
		className.set ("assets/congrats.mp3", __ASSET__assets_congrats_mp3);
		type.set ("assets/congrats.mp3", AssetType.MUSIC);
		
		className.set ("assets/cream.png", __ASSET__assets_cream_png);
		type.set ("assets/cream.png", AssetType.IMAGE);
		
		className.set ("assets/cream.rli", __ASSET__assets_cream_rli);
		type.set ("assets/cream.rli", AssetType.BINARY);
		
		className.set ("assets/cream1.png", __ASSET__assets_cream1_png);
		type.set ("assets/cream1.png", AssetType.IMAGE);
		
		className.set ("assets/cream2.png", __ASSET__assets_cream2_png);
		type.set ("assets/cream2.png", AssetType.IMAGE);
		
		className.set ("assets/cream3.png", __ASSET__assets_cream3_png);
		type.set ("assets/cream3.png", AssetType.IMAGE);
		
		className.set ("assets/crowd-groan.mp3", __ASSET__assets_crowd_groan_mp3);
		type.set ("assets/crowd-groan.mp3", AssetType.MUSIC);
		
		className.set ("assets/cutscene.png", __ASSET__assets_cutscene_png);
		type.set ("assets/cutscene.png", AssetType.IMAGE);
		
		className.set ("assets/cutscene6.png", __ASSET__assets_cutscene6_png);
		type.set ("assets/cutscene6.png", AssetType.IMAGE);
		
		className.set ("assets/Dats Dat Kuuuush.mp3", __ASSET__assets_dats_dat_kuuuush_mp3);
		type.set ("assets/Dats Dat Kuuuush.mp3", AssetType.MUSIC);
		
		className.set ("assets/deathSFX.mp3", __ASSET__assets_deathsfx_mp3);
		type.set ("assets/deathSFX.mp3", AssetType.MUSIC);
		
		className.set ("assets/deathSFX2.mp3", __ASSET__assets_deathsfx2_mp3);
		type.set ("assets/deathSFX2.mp3", AssetType.MUSIC);
		
		className.set ("assets/distant_thunder.mp3", __ASSET__assets_distant_thunder_mp3);
		type.set ("assets/distant_thunder.mp3", AssetType.MUSIC);
		
		className.set ("assets/Drawer.mp3", __ASSET__assets_drawer_mp3);
		type.set ("assets/Drawer.mp3", AssetType.MUSIC);
		
		className.set ("assets/drawerslide.mp3", __ASSET__assets_drawerslide_mp3);
		type.set ("assets/drawerslide.mp3", AssetType.MUSIC);
		
		className.set ("assets/dropMug.mp3", __ASSET__assets_dropmug_mp3);
		type.set ("assets/dropMug.mp3", AssetType.MUSIC);
		
		className.set ("assets/drumfill.mp3", __ASSET__assets_drumfill_mp3);
		type.set ("assets/drumfill.mp3", AssetType.MUSIC);
		
		className.set ("assets/drumroll.mp3", __ASSET__assets_drumroll_mp3);
		type.set ("assets/drumroll.mp3", AssetType.MUSIC);
		
		className.set ("assets/dylan_noooo.mp3", __ASSET__assets_dylan_noooo_mp3);
		type.set ("assets/dylan_noooo.mp3", AssetType.MUSIC);
		
		className.set ("assets/dylan_ohshit.mp3", __ASSET__assets_dylan_ohshit_mp3);
		type.set ("assets/dylan_ohshit.mp3", AssetType.MUSIC);
		
		className.set ("assets/dylan_ooo.mp3", __ASSET__assets_dylan_ooo_mp3);
		type.set ("assets/dylan_ooo.mp3", AssetType.MUSIC);
		
		className.set ("assets/egg(2).png", __ASSET__assets_egg_2__png);
		type.set ("assets/egg(2).png", AssetType.IMAGE);
		
		className.set ("assets/egg.png", __ASSET__assets_egg_png);
		type.set ("assets/egg.png", AssetType.IMAGE);
		
		className.set ("assets/eject.mp3", __ASSET__assets_eject_mp3);
		type.set ("assets/eject.mp3", AssetType.MUSIC);
		
		className.set ("assets/elevator.png", __ASSET__assets_elevator_png);
		type.set ("assets/elevator.png", AssetType.IMAGE);
		
		className.set ("assets/ending.png", __ASSET__assets_ending_png);
		type.set ("assets/ending.png", AssetType.IMAGE);
		
		className.set ("assets/envelope.png", __ASSET__assets_envelope_png);
		type.set ("assets/envelope.png", AssetType.IMAGE);
		
		className.set ("assets/fadein_chord.mp3", __ASSET__assets_fadein_chord_mp3);
		type.set ("assets/fadein_chord.mp3", AssetType.MUSIC);
		
		className.set ("assets/fas.mp3", __ASSET__assets_fas_mp3);
		type.set ("assets/fas.mp3", AssetType.MUSIC);
		
		className.set ("assets/faststep.mp3", __ASSET__assets_faststep_mp3);
		type.set ("assets/faststep.mp3", AssetType.MUSIC);
		
		className.set ("assets/foldpaper(openletter).mp3", __ASSET__assets_foldpaper_openletter__mp3);
		type.set ("assets/foldpaper(openletter).mp3", AssetType.MUSIC);
		
		className.set ("assets/foldpaper.mp3", __ASSET__assets_foldpaper_mp3);
		type.set ("assets/foldpaper.mp3", AssetType.MUSIC);
		
		className.set ("assets/footstep.mp3", __ASSET__assets_footstep_mp3);
		type.set ("assets/footstep.mp3", AssetType.MUSIC);
		
		className.set ("assets/forestsounds.mp3", __ASSET__assets_forestsounds_mp3);
		type.set ("assets/forestsounds.mp3", AssetType.MUSIC);
		
		className.set ("assets/forestsounds2.mp3", __ASSET__assets_forestsounds2_mp3);
		type.set ("assets/forestsounds2.mp3", AssetType.MUSIC);
		
		className.set ("assets/forest_2.png", __ASSET__assets_forest_2_png);
		type.set ("assets/forest_2.png", AssetType.IMAGE);
		
		className.set ("assets/forest_4.png", __ASSET__assets_forest_4_png);
		type.set ("assets/forest_4.png", AssetType.IMAGE);
		
		className.set ("assets/forest_5.png", __ASSET__assets_forest_5_png);
		type.set ("assets/forest_5.png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(19).png", __ASSET__assets_forest_tiles_19__png);
		type.set ("assets/forest_tiles(19).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(2).png", __ASSET__assets_forest_tiles_2__png);
		type.set ("assets/forest_tiles(2).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(20).png", __ASSET__assets_forest_tiles_20__png);
		type.set ("assets/forest_tiles(20).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(21).png", __ASSET__assets_forest_tiles_21__png);
		type.set ("assets/forest_tiles(21).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(22).png", __ASSET__assets_forest_tiles_22__png);
		type.set ("assets/forest_tiles(22).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(23).png", __ASSET__assets_forest_tiles_23__png);
		type.set ("assets/forest_tiles(23).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(24).png", __ASSET__assets_forest_tiles_24__png);
		type.set ("assets/forest_tiles(24).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(25).png", __ASSET__assets_forest_tiles_25__png);
		type.set ("assets/forest_tiles(25).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(3).png", __ASSET__assets_forest_tiles_3__png);
		type.set ("assets/forest_tiles(3).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(4).png", __ASSET__assets_forest_tiles_4__png);
		type.set ("assets/forest_tiles(4).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles(b+w).png", __ASSET__assets_forest_tiles_b_w__png);
		type.set ("assets/forest_tiles(b+w).png", AssetType.IMAGE);
		
		className.set ("assets/forest_tiles_night.png", __ASSET__assets_forest_tiles_night_png);
		type.set ("assets/forest_tiles_night.png", AssetType.IMAGE);
		
		className.set ("assets/gasp_x.mp3", __ASSET__assets_gasp_x_mp3);
		type.set ("assets/gasp_x.mp3", AssetType.MUSIC);
		
		className.set ("assets/gong(supposedly).mp3", __ASSET__assets_gong_supposedly__mp3);
		type.set ("assets/gong(supposedly).mp3", AssetType.MUSIC);
		
		className.set ("assets/Gucci.mp3", __ASSET__assets_gucci_mp3);
		type.set ("assets/Gucci.mp3", AssetType.MUSIC);
		
		className.set ("assets/Hayden _Aww_ 2.mp3", __ASSET__assets_hayden__aww__2_mp3);
		type.set ("assets/Hayden _Aww_ 2.mp3", AssetType.MUSIC);
		
		className.set ("assets/Hayden _Aww_.mp3", __ASSET__assets_hayden__aww__mp3);
		type.set ("assets/Hayden _Aww_.mp3", AssetType.MUSIC);
		
		className.set ("assets/here.mp3", __ASSET__assets_here_mp3);
		type.set ("assets/here.mp3", AssetType.MUSIC);
		
		className.set ("assets/hitbox.png", __ASSET__assets_hitbox_png);
		type.set ("assets/hitbox.png", AssetType.IMAGE);
		
		className.set ("assets/hurtSFX(bot).mp3", __ASSET__assets_hurtsfx_bot__mp3);
		type.set ("assets/hurtSFX(bot).mp3", AssetType.MUSIC);
		
		className.set ("assets/hurtSFX.mp3", __ASSET__assets_hurtsfx_mp3);
		type.set ("assets/hurtSFX.mp3", AssetType.MUSIC);
		
		className.set ("assets/I pray arong.mp3", __ASSET__assets_i_pray_arong_mp3);
		type.set ("assets/I pray arong.mp3", AssetType.MUSIC);
		
		className.set ("assets/I Said Bitch.mp3", __ASSET__assets_i_said_bitch_mp3);
		type.set ("assets/I Said Bitch.mp3", AssetType.MUSIC);
		
		className.set ("assets/icecream.rli", __ASSET__assets_icecream_rli);
		type.set ("assets/icecream.rli", AssetType.BINARY);
		
		className.set ("assets/jamesnoise1.mp3", __ASSET__assets_jamesnoise1_mp3);
		type.set ("assets/jamesnoise1.mp3", AssetType.MUSIC);
		
		className.set ("assets/jamesnoise2.mp3", __ASSET__assets_jamesnoise2_mp3);
		type.set ("assets/jamesnoise2.mp3", AssetType.MUSIC);
		
		className.set ("assets/jamesnoise3.mp3", __ASSET__assets_jamesnoise3_mp3);
		type.set ("assets/jamesnoise3.mp3", AssetType.MUSIC);
		
		className.set ("assets/julesnoise1.mp3", __ASSET__assets_julesnoise1_mp3);
		type.set ("assets/julesnoise1.mp3", AssetType.MUSIC);
		
		className.set ("assets/julesnoise2.mp3", __ASSET__assets_julesnoise2_mp3);
		type.set ("assets/julesnoise2.mp3", AssetType.MUSIC);
		
		className.set ("assets/jumpSFX.mp3", __ASSET__assets_jumpsfx_mp3);
		type.set ("assets/jumpSFX.mp3", AssetType.MUSIC);
		
		className.set ("assets/jumpSFX2.mp3", __ASSET__assets_jumpsfx2_mp3);
		type.set ("assets/jumpSFX2.mp3", AssetType.MUSIC);
		
		className.set ("assets/jumpSFX2.wav", __ASSET__assets_jumpsfx2_wav);
		type.set ("assets/jumpSFX2.wav", AssetType.SOUND);
		
		className.set ("assets/jumpSFX3.mp3", __ASSET__assets_jumpsfx3_mp3);
		type.set ("assets/jumpSFX3.mp3", AssetType.MUSIC);
		
		className.set ("assets/kick.mp3", __ASSET__assets_kick_mp3);
		type.set ("assets/kick.mp3", AssetType.MUSIC);
		
		className.set ("assets/Kyle _aww_ 2.mp3", __ASSET__assets_kyle__aww__2_mp3);
		type.set ("assets/Kyle _aww_ 2.mp3", AssetType.MUSIC);
		
		className.set ("assets/Kyle _Aww_.mp3", __ASSET__assets_kyle__aww__mp3);
		type.set ("assets/Kyle _Aww_.mp3", AssetType.MUSIC);
		
		className.set ("assets/Kyle _decent_.mp3", __ASSET__assets_kyle__decent__mp3);
		type.set ("assets/Kyle _decent_.mp3", AssetType.MUSIC);
		
		className.set ("assets/l1.png", __ASSET__assets_l1_png);
		type.set ("assets/l1.png", AssetType.IMAGE);
		
		className.set ("assets/l2.png", __ASSET__assets_l2_png);
		type.set ("assets/l2.png", AssetType.IMAGE);
		
		className.set ("assets/land.mp3", __ASSET__assets_land_mp3);
		type.set ("assets/land.mp3", AssetType.MUSIC);
		
		className.set ("assets/letter(j).png", __ASSET__assets_letter_j__png);
		type.set ("assets/letter(j).png", AssetType.IMAGE);
		
		className.set ("assets/letter(level4).png", __ASSET__assets_letter_level4__png);
		type.set ("assets/letter(level4).png", AssetType.IMAGE);
		
		className.set ("assets/letter.png", __ASSET__assets_letter_png);
		type.set ("assets/letter.png", AssetType.IMAGE);
		
		className.set ("assets/levels.png", __ASSET__assets_levels_png);
		type.set ("assets/levels.png", AssetType.IMAGE);
		
		className.set ("assets/lilguy.png", __ASSET__assets_lilguy_png);
		type.set ("assets/lilguy.png", AssetType.IMAGE);
		
		className.set ("assets/mail.png", __ASSET__assets_mail_png);
		type.set ("assets/mail.png", AssetType.IMAGE);
		
		className.set ("assets/mainmenu.png", __ASSET__assets_mainmenu_png);
		type.set ("assets/mainmenu.png", AssetType.IMAGE);
		
		className.set ("assets/mainmenu2.png", __ASSET__assets_mainmenu2_png);
		type.set ("assets/mainmenu2.png", AssetType.IMAGE);
		
		className.set ("assets/mapCSV_Level1_Background.csv", __ASSET__assets_mapcsv_level1_background_csv);
		type.set ("assets/mapCSV_Level1_Background.csv", AssetType.TEXT);
		
		className.set ("assets/mapCSV_Level1_Back_Background.csv", __ASSET__assets_mapcsv_level1_back_background_csv);
		type.set ("assets/mapCSV_Level1_Back_Background.csv", AssetType.TEXT);
		
		className.set ("assets/mapCSV_Level1_Back_Back_Background.csv", __ASSET__assets_mapcsv_level1_back_back_background_csv);
		type.set ("assets/mapCSV_Level1_Back_Back_Background.csv", AssetType.TEXT);
		
		className.set ("assets/mapCSV_Level1_Bots.csv", __ASSET__assets_mapcsv_level1_bots_csv);
		type.set ("assets/mapCSV_Level1_Bots.csv", AssetType.TEXT);
		
		className.set ("assets/mapCSV_Level1_Fore-Foreground.csv", __ASSET__assets_mapcsv_level1_fore_foreground_csv);
		type.set ("assets/mapCSV_Level1_Fore-Foreground.csv", AssetType.TEXT);
		
		className.set ("assets/mapCSV_Level1_Foreground.csv", __ASSET__assets_mapcsv_level1_foreground_csv);
		type.set ("assets/mapCSV_Level1_Foreground.csv", AssetType.TEXT);
		
		className.set ("assets/menu trees.png", __ASSET__assets_menu_trees_png);
		type.set ("assets/menu trees.png", AssetType.IMAGE);
		
		className.set ("assets/menu.png", __ASSET__assets_menu_png);
		type.set ("assets/menu.png", AssetType.IMAGE);
		
		className.set ("assets/menuBox.png", __ASSET__assets_menubox_png);
		type.set ("assets/menuBox.png", AssetType.IMAGE);
		
		className.set ("assets/menulake.png", __ASSET__assets_menulake_png);
		type.set ("assets/menulake.png", AssetType.IMAGE);
		
		className.set ("assets/mute.png", __ASSET__assets_mute_png);
		type.set ("assets/mute.png", AssetType.IMAGE);
		
		className.set ("assets/NomNomcollect.mp3", __ASSET__assets_nomnomcollect_mp3);
		type.set ("assets/NomNomcollect.mp3", AssetType.MUSIC);
		
		className.set ("assets/not_a_flower(withGuides).png", __ASSET__assets_not_a_flower_withguides__png);
		type.set ("assets/not_a_flower(withGuides).png", AssetType.IMAGE);
		
		className.set ("assets/not_a_flower.png", __ASSET__assets_not_a_flower_png);
		type.set ("assets/not_a_flower.png", AssetType.IMAGE);
		
		className.set ("assets/not_a_flower2.png", __ASSET__assets_not_a_flower2_png);
		type.set ("assets/not_a_flower2.png", AssetType.IMAGE);
		
		className.set ("assets/nowhere.png", __ASSET__assets_nowhere_png);
		type.set ("assets/nowhere.png", AssetType.IMAGE);
		
		className.set ("assets/npcNoise2.mp3", __ASSET__assets_npcnoise2_mp3);
		type.set ("assets/npcNoise2.mp3", AssetType.MUSIC);
		
		className.set ("assets/nut.png", __ASSET__assets_nut_png);
		type.set ("assets/nut.png", AssetType.IMAGE);
		
		className.set ("assets/OOH3.mp3", __ASSET__assets_ooh3_mp3);
		type.set ("assets/OOH3.mp3", AssetType.MUSIC);
		
		className.set ("assets/pageflip.mp3", __ASSET__assets_pageflip_mp3);
		type.set ("assets/pageflip.mp3", AssetType.MUSIC);
		
		className.set ("assets/particle.png", __ASSET__assets_particle_png);
		type.set ("assets/particle.png", AssetType.IMAGE);
		
		className.set ("assets/party_pop.mp3", __ASSET__assets_party_pop_mp3);
		type.set ("assets/party_pop.mp3", AssetType.MUSIC);
		
		className.set ("assets/pig.mp3", __ASSET__assets_pig_mp3);
		type.set ("assets/pig.mp3", AssetType.MUSIC);
		
		className.set ("assets/pig_borg.mp3", __ASSET__assets_pig_borg_mp3);
		type.set ("assets/pig_borg.mp3", AssetType.MUSIC);
		
		className.set ("assets/pixel.png", __ASSET__assets_pixel_png);
		type.set ("assets/pixel.png", AssetType.IMAGE);
		
		className.set ("assets/player_40x40(letter).png", __ASSET__assets_player_40x40_letter__png);
		type.set ("assets/player_40x40(letter).png", AssetType.IMAGE);
		
		className.set ("assets/player_40x40(parachute).png", __ASSET__assets_player_40x40_parachute__png);
		type.set ("assets/player_40x40(parachute).png", AssetType.IMAGE);
		
		className.set ("assets/player_hurt.png", __ASSET__assets_player_hurt_png);
		type.set ("assets/player_hurt.png", AssetType.IMAGE);
		
		className.set ("assets/poof.mp3", __ASSET__assets_poof_mp3);
		type.set ("assets/poof.mp3", AssetType.MUSIC);
		
		className.set ("assets/poof.png", __ASSET__assets_poof_png);
		type.set ("assets/poof.png", AssetType.IMAGE);
		
		className.set ("assets/poof2.mp3", __ASSET__assets_poof2_mp3);
		type.set ("assets/poof2.mp3", AssetType.MUSIC);
		
		className.set ("assets/pop.aup", __ASSET__assets_pop_aup);
		type.set ("assets/pop.aup", AssetType.TEXT);
		
		className.set ("assets/pop.mp3", __ASSET__assets_pop_mp3);
		type.set ("assets/pop.mp3", AssetType.MUSIC);
		
		className.set ("assets/pop_data/e00/d00/e0000033.au", __ASSET__assets_pop_data_e00_d00_e0000033_au);
		type.set ("assets/pop_data/e00/d00/e0000033.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000394.au", __ASSET__assets_pop_data_e00_d00_e0000394_au);
		type.set ("assets/pop_data/e00/d00/e0000394.au", AssetType.TEXT);
		
		className.set ("assets/pop_data/e00/d00/e00004d3.au", __ASSET__assets_pop_data_e00_d00_e00004d3_au);
		type.set ("assets/pop_data/e00/d00/e00004d3.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e00005c4.au", __ASSET__assets_pop_data_e00_d00_e00005c4_au);
		type.set ("assets/pop_data/e00/d00/e00005c4.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e000083d.au", __ASSET__assets_pop_data_e00_d00_e000083d_au);
		type.set ("assets/pop_data/e00/d00/e000083d.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000993.au", __ASSET__assets_pop_data_e00_d00_e0000993_au);
		type.set ("assets/pop_data/e00/d00/e0000993.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000a0d.au", __ASSET__assets_pop_data_e00_d00_e0000a0d_au);
		type.set ("assets/pop_data/e00/d00/e0000a0d.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000a83.au", __ASSET__assets_pop_data_e00_d00_e0000a83_au);
		type.set ("assets/pop_data/e00/d00/e0000a83.au", AssetType.TEXT);
		
		className.set ("assets/pop_data/e00/d00/e0000b02.au", __ASSET__assets_pop_data_e00_d00_e0000b02_au);
		type.set ("assets/pop_data/e00/d00/e0000b02.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000b2c.au", __ASSET__assets_pop_data_e00_d00_e0000b2c_au);
		type.set ("assets/pop_data/e00/d00/e0000b2c.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000b60.au", __ASSET__assets_pop_data_e00_d00_e0000b60_au);
		type.set ("assets/pop_data/e00/d00/e0000b60.au", AssetType.TEXT);
		
		className.set ("assets/pop_data/e00/d00/e0000c09.au", __ASSET__assets_pop_data_e00_d00_e0000c09_au);
		type.set ("assets/pop_data/e00/d00/e0000c09.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000c9d.au", __ASSET__assets_pop_data_e00_d00_e0000c9d_au);
		type.set ("assets/pop_data/e00/d00/e0000c9d.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000ce4.au", __ASSET__assets_pop_data_e00_d00_e0000ce4_au);
		type.set ("assets/pop_data/e00/d00/e0000ce4.au", AssetType.TEXT);
		
		className.set ("assets/pop_data/e00/d00/e0000df9.au", __ASSET__assets_pop_data_e00_d00_e0000df9_au);
		type.set ("assets/pop_data/e00/d00/e0000df9.au", AssetType.TEXT);
		
		className.set ("assets/pop_data/e00/d00/e0000e93.au", __ASSET__assets_pop_data_e00_d00_e0000e93_au);
		type.set ("assets/pop_data/e00/d00/e0000e93.au", AssetType.BINARY);
		
		className.set ("assets/pop_data/e00/d00/e0000eb6.au", __ASSET__assets_pop_data_e00_d00_e0000eb6_au);
		type.set ("assets/pop_data/e00/d00/e0000eb6.au", AssetType.BINARY);
		
		className.set ("assets/punch.mp3", __ASSET__assets_punch_mp3);
		type.set ("assets/punch.mp3", AssetType.MUSIC);
		
		className.set ("assets/punch2.mp3", __ASSET__assets_punch2_mp3);
		type.set ("assets/punch2.mp3", AssetType.MUSIC);
		
		className.set ("assets/pwrdown.wav", __ASSET__assets_pwrdown_wav);
		type.set ("assets/pwrdown.wav", AssetType.SOUND);
		
		className.set ("assets/quack.mp3", __ASSET__assets_quack_mp3);
		type.set ("assets/quack.mp3", AssetType.MUSIC);
		
		className.set ("assets/Quaid.png", __ASSET__assets_quaid_png);
		type.set ("assets/Quaid.png", AssetType.IMAGE);
		
		className.set ("assets/quest.png", __ASSET__assets_quest_png);
		type.set ("assets/quest.png", AssetType.IMAGE);
		
		className.set ("assets/quest2.png", __ASSET__assets_quest2_png);
		type.set ("assets/quest2.png", AssetType.IMAGE);
		
		className.set ("assets/replay.fgr", __ASSET__assets_replay_fgr);
		type.set ("assets/replay.fgr", AssetType.TEXT);
		
		className.set ("assets/river.mp3", __ASSET__assets_river_mp3);
		type.set ("assets/river.mp3", AssetType.MUSIC);
		
		className.set ("assets/rockBust.mp3", __ASSET__assets_rockbust_mp3);
		type.set ("assets/rockBust.mp3", AssetType.MUSIC);
		
		className.set ("assets/rockBust2.mp3", __ASSET__assets_rockbust2_mp3);
		type.set ("assets/rockBust2.mp3", AssetType.MUSIC);
		
		className.set ("assets/rumble.mp3", __ASSET__assets_rumble_mp3);
		type.set ("assets/rumble.mp3", AssetType.MUSIC);
		
		className.set ("assets/satire.png", __ASSET__assets_satire_png);
		type.set ("assets/satire.png", AssetType.IMAGE);
		
		className.set ("assets/satire2.png", __ASSET__assets_satire2_png);
		type.set ("assets/satire2.png", AssetType.IMAGE);
		
		className.set ("assets/selectthing.png", __ASSET__assets_selectthing_png);
		type.set ("assets/selectthing.png", AssetType.IMAGE);
		
		className.set ("assets/slide.mp3", __ASSET__assets_slide_mp3);
		type.set ("assets/slide.mp3", AssetType.MUSIC);
		
		className.set ("assets/slidewhistle.mp3", __ASSET__assets_slidewhistle_mp3);
		type.set ("assets/slidewhistle.mp3", AssetType.MUSIC);
		
		className.set ("assets/smoke(template).png", __ASSET__assets_smoke_template__png);
		type.set ("assets/smoke(template).png", AssetType.IMAGE);
		
		className.set ("assets/smoke.png", __ASSET__assets_smoke_png);
		type.set ("assets/smoke.png", AssetType.IMAGE);
		
		className.set ("assets/smoke1.png", __ASSET__assets_smoke1_png);
		type.set ("assets/smoke1.png", AssetType.IMAGE);
		
		className.set ("assets/smokelet.png", __ASSET__assets_smokelet_png);
		type.set ("assets/smokelet.png", AssetType.IMAGE);
		
		className.set ("assets/splat.mp3", __ASSET__assets_splat_mp3);
		type.set ("assets/splat.mp3", AssetType.MUSIC);
		
		className.set ("assets/splat.png", __ASSET__assets_splat_png);
		type.set ("assets/splat.png", AssetType.IMAGE);
		
		className.set ("assets/spring.png", __ASSET__assets_spring_png);
		type.set ("assets/spring.png", AssetType.IMAGE);
		
		className.set ("assets/squirrel.png", __ASSET__assets_squirrel_png);
		type.set ("assets/squirrel.png", AssetType.IMAGE);
		
		className.set ("assets/stars.png", __ASSET__assets_stars_png);
		type.set ("assets/stars.png", AssetType.IMAGE);
		
		className.set ("assets/start.png", __ASSET__assets_start_png);
		type.set ("assets/start.png", AssetType.IMAGE);
		
		className.set ("assets/StartPage.png", __ASSET__assets_startpage_png);
		type.set ("assets/StartPage.png", AssetType.IMAGE);
		
		className.set ("assets/step.mp3", __ASSET__assets_step_mp3);
		type.set ("assets/step.mp3", AssetType.MUSIC);
		
		className.set ("assets/stream.png", __ASSET__assets_stream_png);
		type.set ("assets/stream.png", AssetType.IMAGE);
		
		className.set ("assets/swing&aMiss.mp3", __ASSET__assets_swing_amiss_mp3);
		type.set ("assets/swing&aMiss.mp3", AssetType.MUSIC);
		
		className.set ("assets/textmsg1.png", __ASSET__assets_textmsg1_png);
		type.set ("assets/textmsg1.png", AssetType.IMAGE);
		
		className.set ("assets/the.png", __ASSET__assets_the_png);
		type.set ("assets/the.png", AssetType.IMAGE);
		
		className.set ("assets/theriver.png", __ASSET__assets_theriver_png);
		type.set ("assets/theriver.png", AssetType.IMAGE);
		
		className.set ("assets/title.png", __ASSET__assets_title_png);
		type.set ("assets/title.png", AssetType.IMAGE);
		
		className.set ("assets/titlepage.png", __ASSET__assets_titlepage_png);
		type.set ("assets/titlepage.png", AssetType.IMAGE);
		
		className.set ("assets/to .png", __ASSET__assets_to__png);
		type.set ("assets/to .png", AssetType.IMAGE);
		
		className.set ("assets/Tom _aww_.mp3", __ASSET__assets_tom__aww__mp3);
		type.set ("assets/Tom _aww_.mp3", AssetType.MUSIC);
		
		className.set ("assets/Tom _aww_2.mp3", __ASSET__assets_tom__aww_2_mp3);
		type.set ("assets/Tom _aww_2.mp3", AssetType.MUSIC);
		
		className.set ("assets/torch.png", __ASSET__assets_torch_png);
		type.set ("assets/torch.png", AssetType.IMAGE);
		
		className.set ("assets/tox.png", __ASSET__assets_tox_png);
		type.set ("assets/tox.png", AssetType.IMAGE);
		
		className.set ("assets/treeshadows.png", __ASSET__assets_treeshadows_png);
		type.set ("assets/treeshadows.png", AssetType.IMAGE);
		
		className.set ("assets/trumpetfanfare_mom.mp3", __ASSET__assets_trumpetfanfare_mom_mp3);
		type.set ("assets/trumpetfanfare_mom.mp3", AssetType.MUSIC);
		
		className.set ("assets/umbrella.mp3", __ASSET__assets_umbrella_mp3);
		type.set ("assets/umbrella.mp3", AssetType.MUSIC);
		
		className.set ("assets/umbrella.png", __ASSET__assets_umbrella_png);
		type.set ("assets/umbrella.png", AssetType.IMAGE);
		
		className.set ("assets/volcano eruption.png", __ASSET__assets_volcano_eruption_png);
		type.set ("assets/volcano eruption.png", AssetType.IMAGE);
		
		className.set ("assets/volcano.png", __ASSET__assets_volcano_png);
		type.set ("assets/volcano.png", AssetType.IMAGE);
		
		className.set ("assets/walkSFX.mp3", __ASSET__assets_walksfx_mp3);
		type.set ("assets/walkSFX.mp3", AssetType.MUSIC);
		
		className.set ("assets/water.mp3", __ASSET__assets_water_mp3);
		type.set ("assets/water.mp3", AssetType.MUSIC);
		
		className.set ("assets/woody(4)(messingwitcolor).png", __ASSET__assets_woody_4__messingwitcolor__png);
		type.set ("assets/woody(4)(messingwitcolor).png", AssetType.IMAGE);
		
		className.set ("assets/woody(4).png", __ASSET__assets_woody_4__png);
		type.set ("assets/woody(4).png", AssetType.IMAGE);
		
		className.set ("assets/worm.png", __ASSET__assets_worm_png);
		type.set ("assets/worm.png", AssetType.IMAGE);
		
		className.set ("assets/Wowiwiw.mp3", __ASSET__assets_wowiwiw_mp3);
		type.set ("assets/Wowiwiw.mp3", AssetType.MUSIC);
		
		className.set ("assets/writing.mp3", __ASSET__assets_writing_mp3);
		type.set ("assets/writing.mp3", AssetType.MUSIC);
		
		className.set ("assets/z_scoreappear.mp3", __ASSET__assets_z_scoreappear_mp3);
		type.set ("assets/z_scoreappear.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_alphabet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_applause_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_aww_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_bah_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_bahfade_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_black_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_blade_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_blade2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_blagh_dylan__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bobby__aww__2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_bobby__aww__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_boing_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_boot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_borgdeathsfx_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_bot2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_botkillsfx_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_botkillsfx2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_boulder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bouldlet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bouldletmini_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_boxglove_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_boxglove2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bracket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_buzzer_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_buzzer_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_caleb_awman_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_caleb_dangit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_canopy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_canopy6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_checkpoint_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_cheerin_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_chomp_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_claps_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_clinkclankspin_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_cone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_congrats_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_cream_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_cream_rli extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_cream1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_cream2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_cream3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_crowd_groan_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_cutscene_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_cutscene6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_dats_dat_kuuuush_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_deathsfx_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_deathsfx2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_distant_thunder_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_drawer_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_drawerslide_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_dropmug_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_drumfill_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_drumroll_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_dylan_noooo_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_dylan_ohshit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_dylan_ooo_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_egg_2__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_egg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_eject_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_elevator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ending_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_envelope_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fadein_chord_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fas_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_faststep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_foldpaper_openletter__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_foldpaper_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_footstep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_forestsounds_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_forestsounds2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_forest_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_19__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_2__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_20__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_21__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_22__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_23__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_24__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_25__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_3__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_4__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_b_w__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_forest_tiles_night_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_gasp_x_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_gong_supposedly__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_gucci_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_hayden__aww__2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_hayden__aww__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_here_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_hitbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_hurtsfx_bot__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_hurtsfx_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_i_pray_arong_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_i_said_bitch_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_icecream_rli extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_jamesnoise1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_jamesnoise2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_jamesnoise3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_julesnoise1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_julesnoise2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_jumpsfx_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_jumpsfx2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_jumpsfx2_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_jumpsfx3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_kick_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_kyle__aww__2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_kyle__aww__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_kyle__decent__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_l1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_l2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_land_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_letter_j__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_letter_level4__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_letter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_levels_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_lilguy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mainmenu2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_level1_background_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_level1_back_background_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_level1_back_back_background_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_level1_bots_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_level1_fore_foreground_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_mapcsv_level1_foreground_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_menu_trees_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_menu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_menubox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_menulake_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_mute_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_nomnomcollect_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_not_a_flower_withguides__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_not_a_flower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_not_a_flower2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_nowhere_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_npcnoise2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_nut_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ooh3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pageflip_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_particle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_party_pop_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pig_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pig_borg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_player_40x40_letter__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_player_40x40_parachute__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_player_hurt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_poof_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_poof_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_poof2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_aup extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000033_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000394_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e00004d3_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e00005c4_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e000083d_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000993_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000a0d_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000a83_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000b02_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000b2c_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000b60_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000c09_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000c9d_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000ce4_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000df9_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000e93_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pop_data_e00_d00_e0000eb6_au extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_punch_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_punch2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_pwrdown_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_quack_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_quaid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_quest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_quest2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_replay_fgr extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_river_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_rockbust_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_rockbust2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_rumble_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_satire_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_satire2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_selectthing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_slide_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_slidewhistle_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_smoke_template__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_smoke_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_smoke1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_smokelet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_splat_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_splat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_spring_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_squirrel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_stars_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_start_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_startpage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_step_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_stream_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_swing_amiss_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_textmsg1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_the_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_theriver_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_titlepage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_to__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_tom__aww__mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_tom__aww_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_torch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_tox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_treeshadows_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_trumpetfanfare_mom_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_umbrella_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_umbrella_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_volcano_eruption_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_volcano_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_walksfx_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_water_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_woody_4__messingwitcolor__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_woody_4__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_worm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_wowiwiw_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_writing_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_z_scoreappear_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

#if openfl






































































































































































































































#end

#else

#if openfl

#end

#if (windows || mac || linux)


@:bitmap("assets/alphabet.png") class __ASSET__assets_alphabet_png extends lime.graphics.Image {}
@:sound("assets/applause.mp3") class __ASSET__assets_applause_mp3 extends lime.audio.AudioSource {}
@:sound("assets/aww.mp3") class __ASSET__assets_aww_mp3 extends lime.audio.AudioSource {}
@:sound("assets/bah.mp3") class __ASSET__assets_bah_mp3 extends lime.audio.AudioSource {}
@:sound("assets/bahfade.mp3") class __ASSET__assets_bahfade_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/black.png") class __ASSET__assets_black_png extends lime.graphics.Image {}
@:bitmap("assets/blade.png") class __ASSET__assets_blade_png extends lime.graphics.Image {}
@:bitmap("assets/blade2.png") class __ASSET__assets_blade2_png extends lime.graphics.Image {}
@:sound("assets/blagh(Dylan).mp3") class __ASSET__assets_blagh_dylan__mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/blue.png") class __ASSET__assets_blue_png extends lime.graphics.Image {}
@:sound("assets/Bobby _Aww_ 2.mp3") class __ASSET__assets_bobby__aww__2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/Bobby _Aww_.mp3") class __ASSET__assets_bobby__aww__mp3 extends lime.audio.AudioSource {}
@:sound("assets/boing.mp3") class __ASSET__assets_boing_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/boot.png") class __ASSET__assets_boot_png extends lime.graphics.Image {}
@:sound("assets/borgDeathSFX.mp3") class __ASSET__assets_borgdeathsfx_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/bot2.png") class __ASSET__assets_bot2_png extends lime.graphics.Image {}
@:sound("assets/botKillSFX.mp3") class __ASSET__assets_botkillsfx_mp3 extends lime.audio.AudioSource {}
@:sound("assets/botKillSFX2.mp3") class __ASSET__assets_botkillsfx2_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/boulder.png") class __ASSET__assets_boulder_png extends lime.graphics.Image {}
@:bitmap("assets/bouldlet.png") class __ASSET__assets_bouldlet_png extends lime.graphics.Image {}
@:bitmap("assets/bouldletmini.png") class __ASSET__assets_bouldletmini_png extends lime.graphics.Image {}
@:bitmap("assets/boxGlove.png") class __ASSET__assets_boxglove_png extends lime.graphics.Image {}
@:bitmap("assets/boxGlove2.png") class __ASSET__assets_boxglove2_png extends lime.graphics.Image {}
@:bitmap("assets/bracket.png") class __ASSET__assets_bracket_png extends lime.graphics.Image {}
@:sound("assets/BUZZER.mp3") class __ASSET__assets_buzzer_mp3 extends lime.audio.AudioSource {}
@:sound("assets/BUZZER.WAV") class __ASSET__assets_buzzer_wav extends lime.audio.AudioSource {}
@:sound("assets/caleb_awman.mp3") class __ASSET__assets_caleb_awman_mp3 extends lime.audio.AudioSource {}
@:sound("assets/caleb_dangit.mp3") class __ASSET__assets_caleb_dangit_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/canopy.png") class __ASSET__assets_canopy_png extends lime.graphics.Image {}
@:bitmap("assets/canopy6.png") class __ASSET__assets_canopy6_png extends lime.graphics.Image {}
@:bitmap("assets/checkpoint.png") class __ASSET__assets_checkpoint_png extends lime.graphics.Image {}
@:sound("assets/cheerin.mp3") class __ASSET__assets_cheerin_mp3 extends lime.audio.AudioSource {}
@:sound("assets/chomp.mp3") class __ASSET__assets_chomp_mp3 extends lime.audio.AudioSource {}
@:sound("assets/claps.mp3") class __ASSET__assets_claps_mp3 extends lime.audio.AudioSource {}
@:sound("assets/clinkclankspin.mp3") class __ASSET__assets_clinkclankspin_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/cone.png") class __ASSET__assets_cone_png extends lime.graphics.Image {}
@:sound("assets/congrats.mp3") class __ASSET__assets_congrats_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/cream.png") class __ASSET__assets_cream_png extends lime.graphics.Image {}
@:file("assets/cream.rli") class __ASSET__assets_cream_rli extends lime.utils.ByteArray {}
@:bitmap("assets/cream1.png") class __ASSET__assets_cream1_png extends lime.graphics.Image {}
@:bitmap("assets/cream2.png") class __ASSET__assets_cream2_png extends lime.graphics.Image {}
@:bitmap("assets/cream3.png") class __ASSET__assets_cream3_png extends lime.graphics.Image {}
@:sound("assets/crowd-groan.mp3") class __ASSET__assets_crowd_groan_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/cutscene.png") class __ASSET__assets_cutscene_png extends lime.graphics.Image {}
@:bitmap("assets/cutscene6.png") class __ASSET__assets_cutscene6_png extends lime.graphics.Image {}
@:sound("assets/Dats Dat Kuuuush.mp3") class __ASSET__assets_dats_dat_kuuuush_mp3 extends lime.audio.AudioSource {}
@:sound("assets/deathSFX.mp3") class __ASSET__assets_deathsfx_mp3 extends lime.audio.AudioSource {}
@:sound("assets/deathSFX2.mp3") class __ASSET__assets_deathsfx2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/distant_thunder.mp3") class __ASSET__assets_distant_thunder_mp3 extends lime.audio.AudioSource {}
@:sound("assets/Drawer.mp3") class __ASSET__assets_drawer_mp3 extends lime.audio.AudioSource {}
@:sound("assets/drawerslide.mp3") class __ASSET__assets_drawerslide_mp3 extends lime.audio.AudioSource {}
@:sound("assets/dropMug.mp3") class __ASSET__assets_dropmug_mp3 extends lime.audio.AudioSource {}
@:sound("assets/drumfill.mp3") class __ASSET__assets_drumfill_mp3 extends lime.audio.AudioSource {}
@:sound("assets/drumroll.mp3") class __ASSET__assets_drumroll_mp3 extends lime.audio.AudioSource {}
@:sound("assets/dylan_noooo.mp3") class __ASSET__assets_dylan_noooo_mp3 extends lime.audio.AudioSource {}
@:sound("assets/dylan_ohshit.mp3") class __ASSET__assets_dylan_ohshit_mp3 extends lime.audio.AudioSource {}
@:sound("assets/dylan_ooo.mp3") class __ASSET__assets_dylan_ooo_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/egg(2).png") class __ASSET__assets_egg_2__png extends lime.graphics.Image {}
@:bitmap("assets/egg.png") class __ASSET__assets_egg_png extends lime.graphics.Image {}
@:sound("assets/eject.mp3") class __ASSET__assets_eject_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/elevator.png") class __ASSET__assets_elevator_png extends lime.graphics.Image {}
@:bitmap("assets/ending.png") class __ASSET__assets_ending_png extends lime.graphics.Image {}
@:bitmap("assets/envelope.png") class __ASSET__assets_envelope_png extends lime.graphics.Image {}
@:sound("assets/fadein_chord.mp3") class __ASSET__assets_fadein_chord_mp3 extends lime.audio.AudioSource {}
@:sound("assets/fas.mp3") class __ASSET__assets_fas_mp3 extends lime.audio.AudioSource {}
@:sound("assets/faststep.mp3") class __ASSET__assets_faststep_mp3 extends lime.audio.AudioSource {}
@:sound("assets/foldpaper(openletter).mp3") class __ASSET__assets_foldpaper_openletter__mp3 extends lime.audio.AudioSource {}
@:sound("assets/foldpaper.mp3") class __ASSET__assets_foldpaper_mp3 extends lime.audio.AudioSource {}
@:sound("assets/footstep.mp3") class __ASSET__assets_footstep_mp3 extends lime.audio.AudioSource {}
@:sound("assets/forestsounds.mp3") class __ASSET__assets_forestsounds_mp3 extends lime.audio.AudioSource {}
@:sound("assets/forestsounds2.mp3") class __ASSET__assets_forestsounds2_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/forest_2.png") class __ASSET__assets_forest_2_png extends lime.graphics.Image {}
@:bitmap("assets/forest_4.png") class __ASSET__assets_forest_4_png extends lime.graphics.Image {}
@:bitmap("assets/forest_5.png") class __ASSET__assets_forest_5_png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(19).png") class __ASSET__assets_forest_tiles_19__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(2).png") class __ASSET__assets_forest_tiles_2__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(20).png") class __ASSET__assets_forest_tiles_20__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(21).png") class __ASSET__assets_forest_tiles_21__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(22).png") class __ASSET__assets_forest_tiles_22__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(23).png") class __ASSET__assets_forest_tiles_23__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(24).png") class __ASSET__assets_forest_tiles_24__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(25).png") class __ASSET__assets_forest_tiles_25__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(3).png") class __ASSET__assets_forest_tiles_3__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(4).png") class __ASSET__assets_forest_tiles_4__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles(b+w).png") class __ASSET__assets_forest_tiles_b_w__png extends lime.graphics.Image {}
@:bitmap("assets/forest_tiles_night.png") class __ASSET__assets_forest_tiles_night_png extends lime.graphics.Image {}
@:sound("assets/gasp_x.mp3") class __ASSET__assets_gasp_x_mp3 extends lime.audio.AudioSource {}
@:sound("assets/gong(supposedly).mp3") class __ASSET__assets_gong_supposedly__mp3 extends lime.audio.AudioSource {}
@:sound("assets/Gucci.mp3") class __ASSET__assets_gucci_mp3 extends lime.audio.AudioSource {}
@:sound("assets/Hayden _Aww_ 2.mp3") class __ASSET__assets_hayden__aww__2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/Hayden _Aww_.mp3") class __ASSET__assets_hayden__aww__mp3 extends lime.audio.AudioSource {}
@:sound("assets/here.mp3") class __ASSET__assets_here_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/hitbox.png") class __ASSET__assets_hitbox_png extends lime.graphics.Image {}
@:sound("assets/hurtSFX(bot).mp3") class __ASSET__assets_hurtsfx_bot__mp3 extends lime.audio.AudioSource {}
@:sound("assets/hurtSFX.mp3") class __ASSET__assets_hurtsfx_mp3 extends lime.audio.AudioSource {}
@:sound("assets/I pray arong.mp3") class __ASSET__assets_i_pray_arong_mp3 extends lime.audio.AudioSource {}
@:sound("assets/I Said Bitch.mp3") class __ASSET__assets_i_said_bitch_mp3 extends lime.audio.AudioSource {}
@:file("assets/icecream.rli") class __ASSET__assets_icecream_rli extends lime.utils.ByteArray {}
@:sound("assets/jamesnoise1.mp3") class __ASSET__assets_jamesnoise1_mp3 extends lime.audio.AudioSource {}
@:sound("assets/jamesnoise2.mp3") class __ASSET__assets_jamesnoise2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/jamesnoise3.mp3") class __ASSET__assets_jamesnoise3_mp3 extends lime.audio.AudioSource {}
@:sound("assets/julesnoise1.mp3") class __ASSET__assets_julesnoise1_mp3 extends lime.audio.AudioSource {}
@:sound("assets/julesnoise2.mp3") class __ASSET__assets_julesnoise2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/jumpSFX.mp3") class __ASSET__assets_jumpsfx_mp3 extends lime.audio.AudioSource {}
@:sound("assets/jumpSFX2.mp3") class __ASSET__assets_jumpsfx2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/jumpSFX2.wav") class __ASSET__assets_jumpsfx2_wav extends lime.audio.AudioSource {}
@:sound("assets/jumpSFX3.mp3") class __ASSET__assets_jumpsfx3_mp3 extends lime.audio.AudioSource {}
@:sound("assets/kick.mp3") class __ASSET__assets_kick_mp3 extends lime.audio.AudioSource {}
@:sound("assets/Kyle _aww_ 2.mp3") class __ASSET__assets_kyle__aww__2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/Kyle _Aww_.mp3") class __ASSET__assets_kyle__aww__mp3 extends lime.audio.AudioSource {}
@:sound("assets/Kyle _decent_.mp3") class __ASSET__assets_kyle__decent__mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/l1.png") class __ASSET__assets_l1_png extends lime.graphics.Image {}
@:bitmap("assets/l2.png") class __ASSET__assets_l2_png extends lime.graphics.Image {}
@:sound("assets/land.mp3") class __ASSET__assets_land_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/letter(j).png") class __ASSET__assets_letter_j__png extends lime.graphics.Image {}
@:bitmap("assets/letter(level4).png") class __ASSET__assets_letter_level4__png extends lime.graphics.Image {}
@:bitmap("assets/letter.png") class __ASSET__assets_letter_png extends lime.graphics.Image {}
@:bitmap("assets/levels.png") class __ASSET__assets_levels_png extends lime.graphics.Image {}
@:bitmap("assets/lilguy.png") class __ASSET__assets_lilguy_png extends lime.graphics.Image {}
@:bitmap("assets/mail.png") class __ASSET__assets_mail_png extends lime.graphics.Image {}
@:bitmap("assets/mainmenu.png") class __ASSET__assets_mainmenu_png extends lime.graphics.Image {}
@:bitmap("assets/mainmenu2.png") class __ASSET__assets_mainmenu2_png extends lime.graphics.Image {}
@:file("assets/mapCSV_Level1_Background.csv") class __ASSET__assets_mapcsv_level1_background_csv extends lime.utils.ByteArray {}
@:file("assets/mapCSV_Level1_Back_Background.csv") class __ASSET__assets_mapcsv_level1_back_background_csv extends lime.utils.ByteArray {}
@:file("assets/mapCSV_Level1_Back_Back_Background.csv") class __ASSET__assets_mapcsv_level1_back_back_background_csv extends lime.utils.ByteArray {}
@:file("assets/mapCSV_Level1_Bots.csv") class __ASSET__assets_mapcsv_level1_bots_csv extends lime.utils.ByteArray {}
@:file("assets/mapCSV_Level1_Fore-Foreground.csv") class __ASSET__assets_mapcsv_level1_fore_foreground_csv extends lime.utils.ByteArray {}
@:file("assets/mapCSV_Level1_Foreground.csv") class __ASSET__assets_mapcsv_level1_foreground_csv extends lime.utils.ByteArray {}
@:bitmap("assets/menu trees.png") class __ASSET__assets_menu_trees_png extends lime.graphics.Image {}
@:bitmap("assets/menu.png") class __ASSET__assets_menu_png extends lime.graphics.Image {}
@:bitmap("assets/menuBox.png") class __ASSET__assets_menubox_png extends lime.graphics.Image {}
@:bitmap("assets/menulake.png") class __ASSET__assets_menulake_png extends lime.graphics.Image {}
@:bitmap("assets/mute.png") class __ASSET__assets_mute_png extends lime.graphics.Image {}
@:sound("assets/NomNomcollect.mp3") class __ASSET__assets_nomnomcollect_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/not_a_flower(withGuides).png") class __ASSET__assets_not_a_flower_withguides__png extends lime.graphics.Image {}
@:bitmap("assets/not_a_flower.png") class __ASSET__assets_not_a_flower_png extends lime.graphics.Image {}
@:bitmap("assets/not_a_flower2.png") class __ASSET__assets_not_a_flower2_png extends lime.graphics.Image {}
@:bitmap("assets/nowhere.png") class __ASSET__assets_nowhere_png extends lime.graphics.Image {}
@:sound("assets/npcNoise2.mp3") class __ASSET__assets_npcnoise2_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/nut.png") class __ASSET__assets_nut_png extends lime.graphics.Image {}
@:sound("assets/OOH3.mp3") class __ASSET__assets_ooh3_mp3 extends lime.audio.AudioSource {}
@:sound("assets/pageflip.mp3") class __ASSET__assets_pageflip_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/particle.png") class __ASSET__assets_particle_png extends lime.graphics.Image {}
@:sound("assets/party_pop.mp3") class __ASSET__assets_party_pop_mp3 extends lime.audio.AudioSource {}
@:sound("assets/pig.mp3") class __ASSET__assets_pig_mp3 extends lime.audio.AudioSource {}
@:sound("assets/pig_borg.mp3") class __ASSET__assets_pig_borg_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/pixel.png") class __ASSET__assets_pixel_png extends lime.graphics.Image {}
@:bitmap("assets/player_40x40(letter).png") class __ASSET__assets_player_40x40_letter__png extends lime.graphics.Image {}
@:bitmap("assets/player_40x40(parachute).png") class __ASSET__assets_player_40x40_parachute__png extends lime.graphics.Image {}
@:bitmap("assets/player_hurt.png") class __ASSET__assets_player_hurt_png extends lime.graphics.Image {}
@:sound("assets/poof.mp3") class __ASSET__assets_poof_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/poof.png") class __ASSET__assets_poof_png extends lime.graphics.Image {}
@:sound("assets/poof2.mp3") class __ASSET__assets_poof2_mp3 extends lime.audio.AudioSource {}
@:file("assets/pop.aup") class __ASSET__assets_pop_aup extends lime.utils.ByteArray {}
@:sound("assets/pop.mp3") class __ASSET__assets_pop_mp3 extends lime.audio.AudioSource {}
@:file("assets/pop_data/e00/d00/e0000033.au") class __ASSET__assets_pop_data_e00_d00_e0000033_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000394.au") class __ASSET__assets_pop_data_e00_d00_e0000394_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e00004d3.au") class __ASSET__assets_pop_data_e00_d00_e00004d3_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e00005c4.au") class __ASSET__assets_pop_data_e00_d00_e00005c4_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e000083d.au") class __ASSET__assets_pop_data_e00_d00_e000083d_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000993.au") class __ASSET__assets_pop_data_e00_d00_e0000993_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000a0d.au") class __ASSET__assets_pop_data_e00_d00_e0000a0d_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000a83.au") class __ASSET__assets_pop_data_e00_d00_e0000a83_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000b02.au") class __ASSET__assets_pop_data_e00_d00_e0000b02_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000b2c.au") class __ASSET__assets_pop_data_e00_d00_e0000b2c_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000b60.au") class __ASSET__assets_pop_data_e00_d00_e0000b60_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000c09.au") class __ASSET__assets_pop_data_e00_d00_e0000c09_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000c9d.au") class __ASSET__assets_pop_data_e00_d00_e0000c9d_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000ce4.au") class __ASSET__assets_pop_data_e00_d00_e0000ce4_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000df9.au") class __ASSET__assets_pop_data_e00_d00_e0000df9_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000e93.au") class __ASSET__assets_pop_data_e00_d00_e0000e93_au extends lime.utils.ByteArray {}
@:file("assets/pop_data/e00/d00/e0000eb6.au") class __ASSET__assets_pop_data_e00_d00_e0000eb6_au extends lime.utils.ByteArray {}
@:sound("assets/punch.mp3") class __ASSET__assets_punch_mp3 extends lime.audio.AudioSource {}
@:sound("assets/punch2.mp3") class __ASSET__assets_punch2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/pwrdown.wav") class __ASSET__assets_pwrdown_wav extends lime.audio.AudioSource {}
@:sound("assets/quack.mp3") class __ASSET__assets_quack_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/Quaid.png") class __ASSET__assets_quaid_png extends lime.graphics.Image {}
@:bitmap("assets/quest.png") class __ASSET__assets_quest_png extends lime.graphics.Image {}
@:bitmap("assets/quest2.png") class __ASSET__assets_quest2_png extends lime.graphics.Image {}
@:file("assets/replay.fgr") class __ASSET__assets_replay_fgr extends lime.utils.ByteArray {}
@:sound("assets/river.mp3") class __ASSET__assets_river_mp3 extends lime.audio.AudioSource {}
@:sound("assets/rockBust.mp3") class __ASSET__assets_rockbust_mp3 extends lime.audio.AudioSource {}
@:sound("assets/rockBust2.mp3") class __ASSET__assets_rockbust2_mp3 extends lime.audio.AudioSource {}
@:sound("assets/rumble.mp3") class __ASSET__assets_rumble_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/satire.png") class __ASSET__assets_satire_png extends lime.graphics.Image {}
@:bitmap("assets/satire2.png") class __ASSET__assets_satire2_png extends lime.graphics.Image {}
@:bitmap("assets/selectthing.png") class __ASSET__assets_selectthing_png extends lime.graphics.Image {}
@:sound("assets/slide.mp3") class __ASSET__assets_slide_mp3 extends lime.audio.AudioSource {}
@:sound("assets/slidewhistle.mp3") class __ASSET__assets_slidewhistle_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/smoke(template).png") class __ASSET__assets_smoke_template__png extends lime.graphics.Image {}
@:bitmap("assets/smoke.png") class __ASSET__assets_smoke_png extends lime.graphics.Image {}
@:bitmap("assets/smoke1.png") class __ASSET__assets_smoke1_png extends lime.graphics.Image {}
@:bitmap("assets/smokelet.png") class __ASSET__assets_smokelet_png extends lime.graphics.Image {}
@:sound("assets/splat.mp3") class __ASSET__assets_splat_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/splat.png") class __ASSET__assets_splat_png extends lime.graphics.Image {}
@:bitmap("assets/spring.png") class __ASSET__assets_spring_png extends lime.graphics.Image {}
@:bitmap("assets/squirrel.png") class __ASSET__assets_squirrel_png extends lime.graphics.Image {}
@:bitmap("assets/stars.png") class __ASSET__assets_stars_png extends lime.graphics.Image {}
@:bitmap("assets/start.png") class __ASSET__assets_start_png extends lime.graphics.Image {}
@:bitmap("assets/StartPage.png") class __ASSET__assets_startpage_png extends lime.graphics.Image {}
@:sound("assets/step.mp3") class __ASSET__assets_step_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/stream.png") class __ASSET__assets_stream_png extends lime.graphics.Image {}
@:sound("assets/swing&aMiss.mp3") class __ASSET__assets_swing_amiss_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/textmsg1.png") class __ASSET__assets_textmsg1_png extends lime.graphics.Image {}
@:bitmap("assets/the.png") class __ASSET__assets_the_png extends lime.graphics.Image {}
@:bitmap("assets/theriver.png") class __ASSET__assets_theriver_png extends lime.graphics.Image {}
@:bitmap("assets/title.png") class __ASSET__assets_title_png extends lime.graphics.Image {}
@:bitmap("assets/titlepage.png") class __ASSET__assets_titlepage_png extends lime.graphics.Image {}
@:bitmap("assets/to .png") class __ASSET__assets_to__png extends lime.graphics.Image {}
@:sound("assets/Tom _aww_.mp3") class __ASSET__assets_tom__aww__mp3 extends lime.audio.AudioSource {}
@:sound("assets/Tom _aww_2.mp3") class __ASSET__assets_tom__aww_2_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/torch.png") class __ASSET__assets_torch_png extends lime.graphics.Image {}
@:bitmap("assets/tox.png") class __ASSET__assets_tox_png extends lime.graphics.Image {}
@:bitmap("assets/treeshadows.png") class __ASSET__assets_treeshadows_png extends lime.graphics.Image {}
@:sound("assets/trumpetfanfare_mom.mp3") class __ASSET__assets_trumpetfanfare_mom_mp3 extends lime.audio.AudioSource {}
@:sound("assets/umbrella.mp3") class __ASSET__assets_umbrella_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/umbrella.png") class __ASSET__assets_umbrella_png extends lime.graphics.Image {}
@:bitmap("assets/volcano eruption.png") class __ASSET__assets_volcano_eruption_png extends lime.graphics.Image {}
@:bitmap("assets/volcano.png") class __ASSET__assets_volcano_png extends lime.graphics.Image {}
@:sound("assets/walkSFX.mp3") class __ASSET__assets_walksfx_mp3 extends lime.audio.AudioSource {}
@:sound("assets/water.mp3") class __ASSET__assets_water_mp3 extends lime.audio.AudioSource {}
@:bitmap("assets/woody(4)(messingwitcolor).png") class __ASSET__assets_woody_4__messingwitcolor__png extends lime.graphics.Image {}
@:bitmap("assets/woody(4).png") class __ASSET__assets_woody_4__png extends lime.graphics.Image {}
@:bitmap("assets/worm.png") class __ASSET__assets_worm_png extends lime.graphics.Image {}
@:sound("assets/Wowiwiw.mp3") class __ASSET__assets_wowiwiw_mp3 extends lime.audio.AudioSource {}
@:sound("assets/writing.mp3") class __ASSET__assets_writing_mp3 extends lime.audio.AudioSource {}
@:sound("assets/z_scoreappear.mp3") class __ASSET__assets_z_scoreappear_mp3 extends lime.audio.AudioSource {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,6/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends lime.audio.AudioSource {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,6/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends lime.audio.AudioSource {}



#end

#end
#end

