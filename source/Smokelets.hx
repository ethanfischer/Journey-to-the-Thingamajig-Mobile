package;
	import flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	class Smokelets extends FlxGroup
	{
		
		public function new()
		{
			super();
		}
		
		public function addSmokelet(i_x:Int, i_y:Int):Void
		{	
			var temp:Smokelet = new Smokelet(i_x, i_y);
			add(temp);
		}
		
	}