package;
	import org.flixel.*;

	public class FadeBlocks extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempRock:FadeBlock;
		private var allofem:FlxGroup = new FlxGroup();
	
		private var scootFlag:Bool;
		
		public function new()
		{
			super();
		}
		
		public function addFadeBlock(i_x:Int, i_y:Int, delay:Float, speed:Float):Void
		{	
			x = i_x;
			y = i_y;
			tempRock = new FadeBlock(x, y, delay, speed);
			add(tempRock);
		}	
	}