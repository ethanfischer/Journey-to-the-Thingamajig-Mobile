package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class LevelTitleState extends FlxState
	{	
		private var levelMessage:FlxText;
		private var levelNumber:Int;
		
		public function new() 
		{
		}
		
		override public function create():Void
		{
			
			levelNumber = Registry.stageCount + 1;
			levelMessage = new FlxText(65, 75, 320, "LEVEL " + levelNumber);
			levelMessage.alignment = "center";
			levelMessage.shadow = 0xff000000;
			levelMessage.scrollFactor.x = 0;
			levelMessage.scrollFactor.y = 0;
			
			FlxG.mouse.show();
			//Registry.gameLevel.musix.stop();
				
			add(levelMessage);
		}
		
		override public function update():Void
		{
			super.update();
			
			if (FlxG.keys.SPACE)
			{
				FlxG.fade(0xff000000, 0, changeState);
			}
			
		}
		
		private function changeState():Void
		{
			FlxG.switchState(new PlayState);
		}
		
		override public function destroy():Void
		{
			FlxSpecialFX.clear();
			
			super.destroy();
		}
		
	}

}