package;
	import org.flixel.*;

	public class FadeBlock extends FlxSprite
	{
		private var player:Player;
		private var timer:Float;
		private var delay:Float;
		private	var killFlag:Bool = false;
		private var speed:Float;
		private var faded:Bool = false;
		
		[Embed(source = "../assets/drawerslide.mp3")] private var scootSFX:Class;
		[Embed(source="../map/fadeRock(brown).png")] private var rockPNG:Class;
		
		public function new(x:Int, y:Int, i_delay:Float, i_speed:Float)
		{
			super(x * 16, y * 16 + 160); //no clue why I had to add 160
			
			speed = i_speed;
			delay = i_delay;
			
			
		
			loadGraphic(rockPNG, true, true, 16, 16);
			
			addAnimation("idle", [6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5], 16, false);
			addAnimation("faded", [6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7], 16, false);
			
			play("idle");
			
			immovable = true;
			active = true;
			
			timer = speed + delay;
			
		}
		
		override public function update():Void
		{
			super.update();
			
			if (faded) play("faded");
			else play("idle");
			
			//Fade Timer
			if (timer > 0)
			{
				timer -= FlxG.elapsed
			}
			if (timer <= 0)
			{
				switchFade();
				timer = speed;
			}
			
		}
		
		public function switchFade():Void
		{
		//	if (this.onScreen()) //FlxG.play(scootSFX, .1);
			
			if (faded)
			{
				faded = false;
				solid = true;
				
			}
			else
			{
				faded = true;
				solid = false;
			}
		}
		
		
		
		//only here so reference in PlayState doesn't freak out
		public function knockback():Void
		{
		}
	}