package flixel.system.ui;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.Lib;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.system.FlxAssets;

class FlxFocusLostScreen extends Sprite
{
	public function new()
	{
		super();	
		draw();
		
		var logo:Sprite = new Sprite();
		FlxAssets.drawLogo(logo.graphics);
		logo.scaleX = logo.scaleY = 0.2;
		logo.x = logo.y = 5;
		logo.alpha = 0.35;
		addChild(logo);
		
		visible = false;
	}
	
	/**
	 * Redraws the big arrow on the focus lost screen.
	 */
	public function draw():Void
	{
		var gfx:Graphics = graphics;
		
		var screenWidth:Int = Std.Int(FlxCamera.defaultZoom * FlxG.width * FlxG.game.scaleX);
		var screenHeight:Int = Std.Int(FlxCamera.defaultZoom * FlxG.height * FlxG.game.scaleY);
		
		// Draw transparent black backdrop
		gfx.clear();
		gfx.moveTo(0, 0);
		gfx.beginFill(0, 0.5);
		gfx.drawRect(0, 0, screenWidth, screenHeight);
		gfx.endFill();
		
		// Draw white arrow
		var halfWidth:Int = Std.Int(screenWidth / 2);
		var halfHeight:Int = Std.Int(screenHeight / 2);
		var helper:Int = Std.Int(Math.min(halfWidth, halfHeight) / 3);
		gfx.moveTo(halfWidth - helper, halfHeight - helper);
		gfx.beginFill(0xffffff, 0.65);
		gfx.lineTo(halfWidth + helper, halfHeight);
		gfx.lineTo(halfWidth - helper, halfHeight + helper);
		gfx.lineTo(halfWidth - helper, halfHeight - helper);
		gfx.endFill();
		
		scaleX = 1 / FlxG.game.scaleX;
		scaleY = 1 / FlxG.game.scaleY;
	}
}