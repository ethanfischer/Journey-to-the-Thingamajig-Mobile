package;
	import org.flixel.*;

	class CrumbleRocks extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempRock:CrumbleRock;
		
		public function new()
		{
			super();
		}
		
		public function addCrumbleRock(i_x:Int, i_y:Int):Void
		{	
			x = i_x;
			y = i_y;
			tempRock = new CrumbleRock(x, y);
			add(tempRock);
		}
		
		override public function update():Void
		{
			super.update();
		}
		
	}