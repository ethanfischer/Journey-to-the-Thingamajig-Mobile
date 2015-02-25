
package;
	import org.flixel.*;

	class Poofs extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempPoof:Poof;
		public var allthePoofs:Array<Dynamic> = new Array<Dynamic>(); //array of Poofs used to randomly select a chosen bot for retreat function
		
		
		
		
		public function new()
		{
			super();
		}
		
		public function addPoof(i_x:Int, i_y:Int):Void
		{	
			x = i_x;
			y = i_y;
			tempPoof = new Poof(x, y);
			add(tempPoof);
			//allthePoofs.push(tempPoof);
		}	
	}