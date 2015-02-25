
package;
	import flixel.*;

	class Rock extends FlxSprite
	{
		private var player:Player;
		private var timer:Float;
		private	var killFlag:Bool = false;
		
		[Embed(source="../assets/rockBust2.mp3")] private var bustSFX:Class;
		
		[Embed(source="../map/rock.png")] private var rockPNG:Class;
		
		public function new(x:Int, y:Int, i_player:Player)
		{
			super(x * 16, y * 16);
			
			player = i_player;
			
			drag.x = 9000;
			
			loadGraphic(rockPNG, true, true, 24, 24);
			width = 16;
			height = 16;
			offset.x = 4;
			offset.y = 4;
			
			addAnimation("explode", [1,2,2,3, 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4], 24, false);
			addAnimation("idle", [1], 10, false);
			
			play("idle");
			
			
			//active = false;
			solid = true;
			
			timer = 0;
			immovable = true;
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
			acceleration.y = 100;

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