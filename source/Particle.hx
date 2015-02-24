package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author ...
	 */
	public class Particle extends FlxSprite
	{
		[Embed(source = "../assets/particle.png")] private var ParticlePNG:Class;
		private var rand1:Int;
		private var rand2:Int;
		private var timer:Float = 0;
		
		public function new(i_x:Int, i_y:Int) 
		{
			super(i_x, i_y);
			
			
			loadGraphic(ParticlePNG, true, false, 2, 2);
			addAnimation("cool", [0, 1, 2, 3, 4, 5, 6, 7], 10, false);
			play("cool");
			velocity.y = (Int(Math.random()+.5 *3)) * -50;
			acceleration.x = .1;
			scrollFactor.x = 0;
			scrollFactor.y = .1;
			rand1 = (((Math.random() + .5) * 3) + (Math.random() * 3)) * 4;
			visible = false;
			
			
		}
		
		override public function update():Void
		{
			if (y < 130) 
			{
				play("cool");
				//velocity.y = (Int(Math.random()*3)) * -50;
				y = 180;
				rand2 = (((Math.random()) * 3)-1) * 30;
				velocity.x = rand2;
				acceleration.x = ((Int(Math.random()*3))-1)*2;
				x = 455 + rand1;
				
			}
			timer += FlxG.elapsed;
			if (timer > 10)
			{
				visible = true;
				if (timer > 15)
				{
					timer = 0;
					visible = false;
				}
			}
			
			
		}
		
	}

}