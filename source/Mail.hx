package;
	import flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	class Mail extends FlxSprite
	{
		[Embed(source = "../assets/mail.png")] private var mailPNG:Class;
		
		public function new(x:Int, y:Int) 
		{
			super(x, y);
			loadGraphic(mailPNG, true, true, 8, 4);
			
		}
		
	}