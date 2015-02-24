package  
{
	import org.flixel.*;

	public class Supports extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempSupport:Support;
		
		
		public function Supports()
		{
			super();
		}
		
		public function addSupport(i_x:Int, i_y:Int):Void
		{	
			x = i_x;
			y = i_y;
			tempSupport = new Support(x, y);
			add(tempSupport);
		}
	}

}