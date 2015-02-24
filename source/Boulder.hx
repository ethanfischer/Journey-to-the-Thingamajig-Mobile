package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class Boulder extends FlxSprite
	{
		[Embed(source = "../assets/boulder.png")] private var boulderPNG:Class;
		private var splodeFlag:Bool = false;
		public var sploded:Bool = false;
		
		public function new() 
		{
			super(100, -100);
			loadGraphic(boulderPNG, false, false, 30, 24);
			velocity.y = 10;
			acceleration.y = 800;
			solid = true;
			addAnimation("splode", [1, 2] , 15, true);
			
			
		}
		override public function update():Void
		{
			super.update();
			
			if (velocity.y == 0 && !splodeFlag)
			{
				visible = false;
				splodeFlag = true;
				sploded = true;
			}
		}
		
	}

}