
package;
	import flixel.*;

	class Borgs extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempBorg:Borg;
		
		
		public function new()
		{
			super();
		}
		
		public function addBorg(i_x:Int, i_y:Int, i_player:Player, facing:UInt):Void
		{	
			x = i_x;
			y = i_y;
			player = i_player;
			tempBorg = new Borg(x, y, player, facing);
			tempBorg.facing = facing;
			add(tempBorg);
		}
	}