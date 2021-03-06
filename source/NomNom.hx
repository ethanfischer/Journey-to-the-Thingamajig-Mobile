
package;
	import flixel.FlxSprite;
	import flixel.FlxG;
	import flixel.plugin.photonstorm.FlxColor;

	class NomNom extends FlxSprite
	{
		[Embed(source = '../map/star.png')] private var nomNomPNG:Class;
		
		
		private var tempWhere:String = "left";
		private var where:String = "left";
		public var crossedIt:Bool = false;
		public var spinTimer:Float;
		
		public function new(X:Int, Y:Int)
		{
			super(X * 16, Y * 16);
			
			loadGraphic(nomNomPNG, true, false, 16, 20);
			width = 6;
			height = 10;
			offset.y = 0;
		
			
			addAnimation("idle", [1, 2, 1, 3], 4, true);
			addAnimation("spin", [1, 7], 18, true);
			
		}
		
		override public function update():Void
		{
			
			if (Registry.torchesOn) 
			{
				this.color = 0xFFFFFF;
			}
			else 
			{
				this.color = 0x696969;
			}
			
			//spin when crossed
			if (spinTimer > 0) 
			{
				play("spin");
				spinTimer -= FlxG.elapsed;
			}
			else play("idle");
			
			//use two variables to track players movement
			if (Registry.gameLevel.player.x < x + 3) tempWhere = "left";
			else tempWhere = "right";
			
			//player crosses nomNom when previously on left but now on right, or vice versa
			if (where != tempWhere)
			{
				crossedIt = true;
				
			}
			else crossedIt = false;
			
			where = tempWhere //update where
		}
		
	}