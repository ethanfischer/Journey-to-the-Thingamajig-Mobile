package  
{
	import org.flixel.*;

	public class Bots extends FlxGroup
	{
		private var x:Int;
		private var y:Int;
		private var player:Player;
		private var tempBot:Bot;
		public var alltheBots:Array<Dynamic> = new Array<Dynamic>(); //array of bots used to randomly select a chosen bot for retreat function
		
		
		
		
		public function Bots()
		{
			super();
		}
		
		public function addBot(i_x:Int, i_y:Int, i_player:Player, i_facing:uint):Void
		{	
			x = i_x;
			y = i_y;
			player = i_player;
			tempBot = new Bot(x, y, player, i_facing);
			add(tempBot);
			alltheBots.push(tempBot);
		}
	
		
	}

}