package;
	import org.flixel.*;

	public class Torches extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var tempTorch:Torch;
		
		
		public function new()
		{
			super();
		}
		
		public function addTorch(i_x:Int, i_y:Int, i_flameDance:Int):Void
		{	
			x = i_x;
			y = i_y;

			tempTorch = new Torch(x, y, i_flameDance);
			add(tempTorch);
		}
	}