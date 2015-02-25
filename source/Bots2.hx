package;
	import flixel.*;
	import flixel.plugin.photonstorm.FlxWeapon;

	class Bots2 extends FlxGroup
	{
		public var x:Int;
		public var y:Int;
		private var player:Player;
		private var tempBot:Bot2;
		public var weapon:FlxWeapon;
		public var blades:FlxGroup = new FlxGroup;
		
		
		public function new()
		{
			super();
		}
		
		public function addBot2(i_x:Int, i_y:Int, i_player:Player, facing:UInt, bladeSpeed:Int, i_active:Bool = false, i_fireRate:Int = 1, i_bullets:Int = 4, i_updateForever:Bool = false):Void
		{	
			x = i_x;
			y = i_y + 4/16; //+ 4 because the bots fall a little bit to the ground otherwise
			
			player = i_player;
			
			weapon = new FlxWeapon("bladeLauncher");
			tempBot = new Bot2(x, y, player, weapon, facing, bladeSpeed, i_active, i_fireRate, i_bullets, i_updateForever);
			add(tempBot);
			blades.add(weapon.group);
			
		}
		
		
		
	}