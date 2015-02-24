package  
{
	import org.flixel.FlxSprite;
	import org.flixel.*;

	public class Sign extends FlxGroup
	{	
		public var message:FlxText;
		private var player:Player;
		private var x:Int;
		private var y:Int;
		
		public function Sign(i_x:Int, i_y:Int, text:String, i_player:Player, m_x:Int, m_y:Int )
		{
			super();
			
			player = i_player;
			x = i_x;
			y = i_y;
			
			message = new FlxText(m_x, m_y, 150, text);
			//message.alignment = "center";
			//message.scrollFactor.x = 0;
			//message.scrollFactor.y = 0;
			add(message);
		}
		
		override public function update():Void
		{
			if (player.x > x-34 && player.x < x+50)
			{
				message.visible = true;
			}
			else
			{
				message.visible = false;
			}
		}
		
	}

}