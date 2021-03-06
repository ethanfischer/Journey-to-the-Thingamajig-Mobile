package;
	import flixel.*;
	import flixel.plugin.photonstorm.*;

	class Bot2 extends Bot
	{
		[Embed(source = "../assets/bot2.png")] private var bot2PNG:Class;
		[Embed(source = "../assets/botKillSFX.mp3")] private var botKillSFX:Class;
		[Embed(source = "../assets/blade2.png")] private var blade:Class;
		[Embed(source = "../assets/drawerslide.mp3")] private var fireSoundEffect:Class;
	
		
		public var fireSFX:FlxSound;
		private var dieTimer:Float;
		private var player:Player;
		private var knockbackTimer:Float;
		private var knockbackTimerFlag:Bool;
		private var canKnockback:Bool = false;
		public var weapon:FlxWeapon;
		public var direction:UInt;
		public var updateForever:Bool;
		
		public function new(x:Int, y:Int, i_player:Player, i_weapon:FlxWeapon, i_facing:UInt, bladeSpeed:Int, i_active:Bool = false, fireRate:Int = 1, bullets:Int = 4, i_updateForever:Bool = false)
		{
			super(x, y, i_player, FlxObject.RIGHT);
			
			//fireSFX = new FlxSound();
			//fireSFX.loadEmbedded(fireSoundEffect, false, true);
			//fireSFX.volume = 0;
			
			weapon = i_weapon;
			updateForever = i_updateForever;
			var bulletBoundRect:FlxRect = new FlxRect((x * 16) - 800, (y * 16) + 4, 1600, 8);
			
			weapon.setParent(this, "x", "y", 0, 0, true);
			weapon.makeAnimatedBullet(bullets, blade, 16, 2, [0, 1], 25, true, 10, 3);
			weapon.bulletLifeSpan = 20000;
			weapon.setBulletSpeed(bladeSpeed);
			weapon.setFireRate((2950 + (bladeSpeed * 3.125)) / fireRate);
			weapon.setBulletBounds(bulletBoundRect);
			//weapon.setFireCallback(meh, fireSFX);

			player = i_player;
			
			loadGraphic(bot2PNG, true, true, 16, 24);
			
			facing = i_facing;
			
			solid = true;
			active = i_active;
			
			addAnimation("idle", [0,1], 30, true);
			addAnimation("dead", [11], 1, false);
			
			play("idle");
			
			dieTimer = 0;
			
			acceleration.y = 500;
			velocity.x = 0;
		}
		
		override public function update():Void
		{
			super.update();
			
			if (!isDying)
			{
				velocity.x = 0;
			}
			
			if (!isDying)
			{
				if(isTouching(FLOOR)) weapon.fire(); //don't shoot before they land
				
				/*if (Registry.pauseSounds) this.fireSFX.volume = 0;
				if (Registry.stageCount == 2 && (this.x > 2110 && this.x < 2120)) this.fireSFX.volume = 0.05; //for those three guys in level 3
				else if(this.onScreen()) fireSFX.volume = 1;
				else fireSFX.volume = .2; */
			}
			
			
		
			
		}
		
		override public function retreat():Void
		{
			
		}
		
		
		private function meh():Void
		{
			
		}
	}