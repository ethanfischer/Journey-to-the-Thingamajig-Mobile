package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	//import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	//import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	public class MainMenuState extends FlxState
	{
		[Embed(source = "../assets/menulake.png")] private var titlePagePNG:Class;
		[Embed(source = "../assets/menuBox.png")] private var menuBoxPNG:Class;	
		[Embed(source = "../assets/menu trees.png")] private var menuTreesPNG:Class;
		[Embed(source = "../assets/selectthing.png")] private var dotsPNG:Class;
		[Embed(source = "../assets/quack.mp3")] private var quack:Class;
		[Embed(source = "../assets/title.png")] private var titlePNG:Class;
		
		[Embed(source="../assets/the.png")] private var thePNG:Class;
		[Embed(source="../assets/quest.png")] private var questPNG:Class;
		[Embed(source="../assets/to .png")] private var toPNG:Class;
		[Embed(source = "../assets/nowhere.png")] private var nowherePNG:Class;
		[Embed(source = "../assets/stars.png")] private var starsPNG:Class;
		[Embed(source = "../assets/black.png")] private var blackPNG:Class;
		[Embed(source = "../assets/punch2.mp3")] private var punchSFX:Class;
		//[Embed(source = "../assets/Save an Enemy.mp3")] private var horns:Class;
	
		[Embed(source = "../assets/start.png")] private var startPNG:Class;
		[Embed(source = "../assets/fadein_chord.mp3")] private var fadeChord:Class
		[Embed(source = "../assets/forestsounds.mp3")] public var dwarfDance:Class;
		
		private var fadeChordflag1:Boolean;
		private var fadeChordflag2:Boolean;
		private var fadeChordflag3:Boolean;
		
		
	 	private var dots:FlxSprite = new FlxSprite(Registry.screenWidth / 2 - 34, 191);
		
		private var level:Level1;
		private var title:FlxSprite;
		private var dolly:FlxSprite;
		//private var start:FlxButton;
		private var levelsText:FlxText;
		private var levelsBox:FlxButton;
		private var selector:int = 1;
		
		//private var the:FlxSprite;
		private var quest:FlxSprite;
		private var to:FlxSprite;
		private var nowhere:FlxSprite;
		private var stars:FlxSprite;
		private var stars2:FlxSprite;
		private var black:FlxSprite;
		private var menuTrees:FlxSprite;
		private var punchFlag:Boolean;
		private var timer:Number = 2.8;
		private var start:FlxSprite;
		
		public function MainMenuState() 
		{
		}
		
		override public function create():void
		{
		
		//Registry.checkpointFlag = false;
		//FlxG.play(quack);
		FlxG.mouse.show();
		
		FlxG.playMusic(dwarfDance, 1);
	
		dots.loadGraphic(dotsPNG, true, false, 72, 6);
		dots.drag.y = 3900;
		dots.addAnimation("blink", [0, 2], 3, true);
		dots.play("blink");
		
		var t:FlxSprite = new FlxSprite(0, 0, titlePagePNG);
		
		title = new FlxSprite(0, 0);
		title.loadGraphic(titlePNG, false, false, 600, 300);
		title.alpha = 0;
		
		quest = new FlxSprite(0, 0);
		quest.loadGraphic(questPNG, false, false, 600, 300);
		quest.alpha = 0;
		
		to = new FlxSprite(0, 0);
		to.loadGraphic(toPNG, false, false, 600, 300);
		to.alpha = 0;
		
		nowhere = new FlxSprite(0, 0);
		nowhere.loadGraphic(nowherePNG, false, false, 600, 300);
		nowhere.alpha = 0;
		
		start = new FlxSprite(0, 0);
		start.loadGraphic(startPNG, false, false, 600, 300);
		start.alpha = 0;
		
		menuTrees = new FlxSprite(0, 0);
		menuTrees.loadGraphic(menuTreesPNG, false, false, 1200, 300);
		menuTrees.velocity.x = -30;
		
		stars = new FlxSprite(0, 0);
		stars.loadGraphic(starsPNG, false, false, 1200, 300);
		
		stars2 = new FlxSprite(0, 0);
		stars2.loadGraphic(starsPNG, false, false, 1200, 300);
		
		black = new FlxSprite(0, 0);
		black.loadGraphic(blackPNG, false, false, 600, 300);
		black.alpha = 0;
			
		Registry.stageCount = 0;
			
		//levelsBox = new FlxButton(Registry.screenWidth / 2 - 29, 200, "LEVELS", goToLevelMenu);
		//start = new FlxButton(Registry.screenWidth / 2 - 30, 185, "START", startIt);
		
		//levelsBox.makeGraphic(64, 20, 0x00000000);
		
		//start.makeGraphic(64, 20, 0x00000000);
		
		//levelsBox.label.color = 0xffffff;
		//levelsBox.alpha = 0;
		
		//start.label.color = 0xffffff;
		//start.alpha = 0;
		
		
		stars.velocity.x = -200;
		stars2.velocity.x = 200;
		
		add(black);
		add(t);
		add(stars);
		add(stars2);
		add(menuTrees);
		add(title);
		//add(the);
		add(quest);
		add(to);
		add(nowhere);
		add(start);
		
		}
		
		override public function update():void
		{
			super.update();
			dots.play("blink");
			//title.alpha += .01;
			
			if (stars.x < -600) stars.x = 0;
			if (stars2.x > 0) stars2.x = -600;	
			if (menuTrees.x < -600) menuTrees.x = 0;
			
			if (timer > 0)
			{	
				if (timer < 2.1)
				{
					quest.alpha += .5;
					if (!fadeChordflag1)
					{
						FlxG.play(fadeChord);
						fadeChordflag1 = true;
					}
					if (timer < 1.4)
					{
						to.alpha += .5;
						if (!fadeChordflag2)
						{
							FlxG.play(fadeChord);
							fadeChordflag2 = true;
						}
						if (timer < .7)
						{
							nowhere.alpha += .5;
							if (!fadeChordflag3)
							{
								FlxG.play(fadeChord);
								fadeChordflag3 = true;
							}
							
						}
					}
				}
				timer -= FlxG.elapsed;
			}
			else if (timer < 0)
			{
				start.alpha += .02;
			}
			
			if (start.alpha == 1)
			{
				add(start);
				add(levelsBox);
				add(dots);
			}
			
			if (FlxG.keys.justPressed("DOWN") && selector < 2) 
			{
				dots.frame = 0;
				selector++;
				dots.velocity.y = 354;
				FlxG.play(quack);
			}
			else if (FlxG.keys.justPressed("UP") && selector > 1) 
			{
				dots.frame = 0;
				selector--;
				dots.velocity.y = -354;
				FlxG.play(quack);
			}
			
			if (FlxG.keys.SPACE || FlxG.keys.ENTER)
			{
				if (selector == 1) 
				{
					FlxG.flash(0x99999900, .1);
					if (!punchFlag)
					{
						FlxG.play(punchSFX, 1, false, true);
						punchFlag = true;
					}
					FlxG.shake(.03, .1);
					FlxG.fade(0x000000, 0.5, changeState); 
				}
				else if (selector == 2) 
				{
					FlxG.fade(0x000000, 0.2, changeState);
				}
				//FlxG.play(quack);
			}
			
		}
		
		private function changeState():void
		{
			if (selector == 1) 
				{	
					FlxG.switchState(new DeathMenuState);
				}
				else if (selector == 2) 
				{	
					FlxG.switchState(new LevelMenuState);
				}
			//FlxG.switchState(new DeathMenuState);
		}
		
		override public function destroy():void
		{
			FlxSpecialFX.clear();
			
			super.destroy();
		}
		
		private function goToLevelMenu():void
		{
			FlxG.switchState(new LevelMenuState);
		}
		
		private function startIt():void
		{
			Registry.stageCount = 0;
			FlxG.switchState(new DeathMenuState);
		}
	}
}