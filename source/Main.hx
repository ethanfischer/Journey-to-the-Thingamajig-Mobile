package;
	import flixel.FlxGame;
	
	//[SWF(width = "1300", height = "650", backgroundColor = "#000000")]
	//[Frame(factoryClass="Preloader")] //Tells Flixel to use the default preloader

	class Main extends FlxGame
	{
		public function new()
		{
			super(Registry.screenWidth, Registry.screenHeight, MainMenuState, 2, 30, 30);
			
			//forceDebugger = true;
		}
	}
