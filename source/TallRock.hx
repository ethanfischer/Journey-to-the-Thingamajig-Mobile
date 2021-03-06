package;
	import flixel.*;

	class TallRock extends FlxSprite
	{
		private var player:Player;
		private var timer:Float;
		private	var killFlag:Bool = false;
		
		[Embed(source="../assets/rockBust2.mp3")] private var bustSFX:Class;
		
		[Embed(source="../map/tallRock.png")] private var TallRockPNG:Class;
		
		public function new(x:Int, y:Int, i_player:Player)
		{
			super(x * 16, y * 16);
			
			player = i_player;
			
			
			
			loadGraphic(TallRockPNG, true, true, 16, 64);
			
			addAnimation("explode", [1, 2, 3], 9, false);
			addAnimation("idle", [1], 10, false);
			
			play("idle");
			
			
			//active = false;
			solid = true;
			immovable = true;
			
			timer = 0;
		}
		
		override public function update():Void
		{
			super.update();
			
			//Death Timer
			if (timer > 0)
			{
				timer -= FlxG.elapsed;
				play("explode");
			}
			if (timer < 0)
			{
				exists = false;
			}
			
		}
		
		override public function kill():Void
		{
			solid = false;
			FlxG.play(bustSFX);

			if (!killFlag)
			{
				timer = .3;
				killFlag = true;
			}
		}
		
		//only here so reference in PlayState doesn't freak out
		public function knockback():Void
		{
		}
	}