package;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Ethan Fischer
	 */
	class Spring extends FlxSprite
	{
		[Embed(source = "../assets/spring.png")] private var springPNG:Class;
		public var bounce:Int;
		
		public function new(x:Int, y:Int, i_bounce:Int) 
		{
			super(x, y);
			
			bounce = i_bounce;
			loadGraphic(springPNG, true, false, 32, 24);
			addAnimation("up", [3, 2, 1, 2, 3], 25, false); 
			addAnimation("idle", [1], 0, false);
			play("idle");
		}
		
	}