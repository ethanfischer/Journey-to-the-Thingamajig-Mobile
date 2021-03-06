package;
	import flixel.*;

	class Reinforcements extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempReinforcement:Reinforcement;
		
		public function new()
		{
			super();
		}
		
		public function addReinforcement(i_x:Int, i_y:Int):Void
		{	
			x = i_x;
			y = i_y;
			tempReinforcement = new Reinforcement(x, y);
			add(tempReinforcement);
		}
	}