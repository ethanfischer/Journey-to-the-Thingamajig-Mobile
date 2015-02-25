package;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author ...
	 */
	class Bouldlet extends FlxSprite
	{
		[Embed(source = "../assets/bouldlet.png")] public var bouldletPNG:Class;
		[Embed(source = "../assets/bouldletmini.png")] public var bouldletminiPNG:Class;
		private var images:Array<Dynamic> = new Array<Dynamic>();
		private var lifetime:Float;
		private var falls:Int = 0;
		
		public function new(i_x:Int, i_y:Int, i_velocityY:Int, i_velocityX:Int = 0, i_lifetime:Float = 0) 
		{
			super(i_x, i_y);
			
			images[0] = bouldletminiPNG;
			images[1] = bouldletminiPNG;
			var rand:Int = Math.random();
			
			lifetime = i_lifetime;
			loadGraphic(images[rand], false, false, 8, 8);
			velocity.y = i_velocityY;
			velocity.x = i_velocityX;
			acceleration.y = 1000;
			solid = false;
			maxVelocity.y = 700;
			scrollFactor.x = 0;
			scrollFactor.y = 0;
		}
		override public function update():Void
		{
			super.update();
			
			if (y > 600)
			{
				x = (Math.random() * 600);
				y = -400 + (Math.random() * 400);
				falls++;
			}
			if (lifetime > 0)
			{
				lifetime -= FlxG.elapsed;
			}
			else if (lifetime < 0)
			{
				visible = false;
			}
			if (falls >= 3)
			{
				kill();
			}
		}
	}