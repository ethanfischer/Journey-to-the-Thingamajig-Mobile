package;
	import flixel.*;

	class Rocks extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempRock:Rock;
		private var tallRock:TallRock;
		
		public function new()
		{
			super();
		}
		
		public function addRock(i_x:Int, i_y:Int, i_player:Player, rockType:Int):Void
		{	
			x = i_x;
			y = i_y;
			player = i_player;
			
			if (rockType == 1)
			{
				tempRock = new Rock(x, y, player);
				add(tempRock);
			}
			else if (rockType == 2)
			{
				tallRock = new TallRock(x, y, player);
				add(tallRock);
			}
		}

	}