package  
{
	import org.flixel.*;

	public class NotAFlower extends FlxSprite
	{
		private var player:Player;
		private var blinktimer:Float;
		private var discoverTimer:Float;
		public var stareTimer:Float;
		public var punchTimer:Float;
		private var flashTimer:Float;
		private var animation:String;
		private var blinkSequence:Bool = true;
		private var hungerTimer:Float = 20;
		private var chasePlayer:Bool;
		private var eatingTimer:Float;
		private var eatingTimerFlag:Bool;
		public var eatingEm:Bool = false;
		public var idleSpeed:String = "idle";
		private var drumfillFlag:Bool = false;
		public var contact:Bool;
		private var meeting:Bool;
		
	
		[Embed(source = "../assets/boxGlove2.png")] private var not_a_flowerPNG:Class;
		//[Embed(source = "../assets/boot.png")] private var not_a_flowerPNG:Class;
		[Embed(source = "../assets/drumfill.mp3")] private var drumfill:Class;
		
		
		
		
		public function NotAFlower(x:Int, y:Int, i_player:Player)
		{
			super(x, y);
			
			exists = true;
			if (!Registry.hasFlower) visible = false;
			
			player = i_player;
			
			loadGraphic(not_a_flowerPNG, true, true, 30, 16);
			offset.x = 10;
			offset.y = 2;
			facing = FlxObject.RIGHT;
			
			addAnimation("freeze", [0], 0, false);
			addAnimation("idle" , [0, 1, 2, 3, 4, 5, 4, 3, 2, 1], 12, true);
			addAnimation("punch", [6, 7, 8, 8, 7, 6], 50, false);
			
			animation = "freeze";
			
			blinktimer = 3;
		}
		
		override public function update():Void
		{
			super.update();

			//this is where all the normal functionality is after you've goten the boxing glove
			if (Registry.meetingAdjourned)
			{
				if (!player.deathFlag)
				{
					if (player.getFacing == RIGHT)
					{
						x = player.x - 12;
						facing = RIGHT;
					}
					else
					{
						x = player.x + 14;
						facing = LEFT;
					}
					//position him around the player
					y = player.y + 13;
					
				}
				
				//////////////////////////////////////////
				//				Timers					//
				//////////////////////////////////////////
					
				if (punchTimer > 0)
				{
					//handle the punch functionality here
					punchTimer -= FlxG.elapsed;
					animation = "punch";
					if (punchTimer < .1)
					{
						if (_facing == RIGHT)
						{
							x = player.x + 20;
						}
						else
						{
							x = player.x - 20;
						}
					}
				}
				else
				{
					animation = "idle";
				}
				
				if (Registry.gameLevel.player.canPunch && FlxG.keys.justPressed("X"))
				{
					punchTimer = .12;
				}
					
				//flashTimer
				if (flashTimer > 0)
				{
					this.color = 0x1a00ff;
					flashTimer -= FlxG.elapsed;
				}
				if (flashTimer < 0)
				{
					this.color = 0xFFFFFF;
					flashTimer = 0;
				}
				
			}
			//this is the code for the cutscene for when you meet quaid
			else
			{
				////////////////////////////////////////////////////////////
				//						  TIMERS						  //
				////////////////////////////////////////////////////////////
				
				if (stareTimer > 0)
				{
					stareTimer -= FlxG.elapsed;
					x = Registry.gameLevel.player.x - 2;
					y = Registry.gameLevel.player.y - 16;
				}
				if (stareTimer < 0)
				{
					stareTimer = 0;
					//animation = "shapeshift";
					Registry.meetingAdjourned = true;
					Registry.gameLevel.player.canPunch = true;
				}
			}
			//handle all animations here
				play(animation);
			
		}
		
		public function niceToMeetYou():Void
		{
			if (!meeting)
			{
				meeting = true;
				stareTimer = 2;
			}
		}
		
		public function killPlayer(player:Player, yeah:FlxObject):Void
		{
			player.dead();
		}
	}
}