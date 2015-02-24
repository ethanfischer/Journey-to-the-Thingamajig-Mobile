package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class Particles extends FlxGroup
	{
		
		public function new()
		{
			super();
		}
		
		public function addParticle(i_x:Int, i_y:Int):Void
		{	
			var temp:Particle = new Particle(i_x, i_y);
			add(temp);
		}
		
	}

}