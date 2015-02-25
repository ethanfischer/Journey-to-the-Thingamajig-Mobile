package;
	import org.flixel.*;

	class Wiz extends FlxSprite
	{
		[Embed(source="../map/wiz.png")] private var wizPNG:Class;
		
		public var isDying:Bool = false;
		private var dieTimer:Float;
		private var bounceTimer:Float;
		private var turnAroundTimer:Float;
		private var knockBackTimer:Float;
		private var player:Player;
		public var dTurnFlag:Bool = false;
		private var shockedTimer:Float;
		private var shockedFlag:Bool = false;
		
		
		
		public function new(x:Int, y:Int)
		{
			super(x, y);
			
			offset.y = -2;
			loadGraphic(wizPNG, true, true, 24, 48);
			solid = true;
			
			addAnimation("idle", [0], 0, true);
			addAnimation("excited", [1, 2], 4, true);
			play("idle");
			scrollFactor.x = 1;
			
			acceleration.y = 500;
		}
	
		override public function update():Void
		{
			super.update();
			
			
			if (onScreen() && !shockedFlag)
			{
				shockedTimer = 1.5;
				shockedFlag = true;
			}
			
			
			//Timer
			if (shockedTimer > 0)
			{
				shockedTimer -= FlxG.elapsed;
			}
			else if (shockedTimer < 0)
			{
				if (isTouching(FLOOR)) velocity.y = -110;
				play("excited");
			}
		}
		
		public function turnAround():Void
		{
			if (!isDying)
			{
				if (facing == FlxObject.RIGHT)
				{
					facing = FlxObject.LEFT;
					////IMPLEMENT A PAUSED TURN AROUND/////////////////////////////////////////////////////////
					velocity.x = -30;
					play("idleRight");
				}
				else
				{
					facing = FlxObject.RIGHT;
					velocity.x = 30;
					play("idleLeft");
				}
			}
		}
		
		
	}