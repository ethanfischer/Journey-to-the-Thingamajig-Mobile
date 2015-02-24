package flixel.input.touch;

#if !FLX_NO_TOUCH
import flash.events.TouchEvent;
import flash.Lib;
import flash.ui.Multitouch;
import flash.ui.MultitouchInputMode;
import flixel.FlxG;
import flixel.interfaces.IFlxInput;

/**
 * ...
 * @author Zaphod
 */
class FlxTouchManager implements IFlxInput
{
	/**
	 * The maximum number of concurrent touch points supported by the current device.
	 */
	public static var maxTouchPoints:Int = 0;
	
	/**
	 * All active touches including just created, moving and just released.
	 */
	public var list:Array<Dynamic><FlxTouch>;
	
	/**
	 * Storage for inactive touches (some sort of cache for them).
	 */
	private var _inactiveTouches:Array<Dynamic><FlxTouch>;
	/**
	 * Helper storage for active touches (for faster access)
	 */
	private var _touchesCache:Map<Int, FlxTouch>;
	
	/**
	 * WARNING: can be null if no active touch with the provided ID could be found
	 */
	public inline function getByID(TouchPointID:Int):FlxTouch
	{
		return _touchesCache.get(TouchPointID);
	}
	
	/**
	 * Return the first touch if there is one, beware of null
	 */
	public function getFirst():FlxTouch
	{
		if (list[0] != null)
		{
			return list[0];
		}
		else
		{
			return null;
		}
	}
	
	/**
	 * Clean up memory. Internal use only.
	 */
	@:noCompletion
	public function destroy():Void
	{
		for (touch in list)
		{
			touch.destroy();
		}
		list = null;
		
		for (touch in _inactiveTouches)
		{
			touch.destroy();
		}
		_inactiveTouches = null;
		
		_touchesCache = null;
	}
	
	/**
	 * Gets all touches which were just started
	 * 
	 * @param	TouchArray	Optional array to fill with touch objects
	 * @return	Array<Dynamic> with touches
	 */
	public function justStarted(?TouchArray:Array<Dynamic><FlxTouch>):Array<Dynamic><FlxTouch>
	{
		if (TouchArray == null)
		{
			TouchArray = new Array<Dynamic><FlxTouch>();
		}
		
		var touchLen:Int = TouchArray.length;
		
		if (touchLen > 0)
		{
			TouchArray.splice(0, touchLen);
		}
		
		for (touch in list)
		{
			if (touch._current == 2)
			{
				TouchArray.push(touch);
			}
		}
		
		return TouchArray;
	}
	
	/**
	 * Gets all touches which were just ended
	 * 
	 * @param	TouchArray	Optional array to fill with touch objects
	 * @return	Array<Dynamic> with touches
	 */
	public function justReleased(?TouchArray:Array<Dynamic><FlxTouch>):Array<Dynamic><FlxTouch>
	{
		if (TouchArray == null)
		{
			TouchArray = new Array<Dynamic><FlxTouch>();
		}
		
		var touchLen:Int = TouchArray.length;
		if (touchLen > 0)
		{
			TouchArray.splice(0, touchLen);
		}
		
		for (touch in list)
		{
			if (touch._current == -1)
			{
				TouchArray.push(touch);
			}
		}
		
		return TouchArray;
	}
	
	/**
	 * Resets all touches to inactive state.
	 */
	public function reset():Void
	{
		for (key in _touchesCache.keys())
		{
			_touchesCache.remove(key);
		}
		
		for (touch in list)
		{
			touch.deactivate();
			_inactiveTouches.push(touch);
		}
		
		list.splice(0, list.length);
	}
	
	@:allow(flixel.FlxG)
	private function new() 
	{
		list = new Array<Dynamic><FlxTouch>();
		_inactiveTouches = new Array<Dynamic><FlxTouch>();
		_touchesCache = new Map<Int, FlxTouch>();
		maxTouchPoints = Multitouch.maxTouchPoints;
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		
		Lib.current.stage.addEventListener(TouchEvent.TOUCH_BEGIN, handleTouchBegin);
		Lib.current.stage.addEventListener(TouchEvent.TOUCH_END, handleTouchEnd);
		Lib.current.stage.addEventListener(TouchEvent.TOUCH_MOVE, handleTouchMove);
	}
	
	/**
	 * Event handler so FlxGame can update touches.
	 * 
	 * @param	FlashEvent	A TouchEvent object.
	 */
	private function handleTouchBegin(FlashEvent:TouchEvent):Void
	{
		var touch:FlxTouch = _touchesCache.get(FlashEvent.touchPointID);
		if (touch != null)
		{
			touch.updatePosition(FlashEvent.stageX, FlashEvent.stageY); 
			
			if (touch._current > 0) 
			{
				touch._current = 1;
			}
			else 
			{
				touch._current = 2;
			}
		}
		else
		{
			touch = recycle(FlashEvent.stageX, FlashEvent.stageY, FlashEvent.touchPointID);
			touch._current = 2;
		}
	}
	
	/**
	 * Event handler so FlxGame can update touches.
	 * 
	 * @param	FlashEvent	A TouchEvent object.
	 */
	private function handleTouchEnd(FlashEvent:TouchEvent):Void
	{
		var touch:FlxTouch = _touchesCache.get(FlashEvent.touchPointID);
		
		if (touch != null)
		{
			if (touch._current > 0) 
			{
				touch._current = -1;
			}
			else 
			{
				touch._current = 0;
			}
		}
	}
	
	/**
	 * Event handler so FlxGame can update touches.
	 * 
	 * @param	FlashEvent	A TouchEvent object.
	 */
	private function handleTouchMove(FlashEvent:TouchEvent):Void
	{
		var touch:FlxTouch = _touchesCache.get(FlashEvent.touchPointID);
		
		if (touch != null)
		{
			touch.updatePosition(FlashEvent.stageX, FlashEvent.stageY); 
		}
	}
	
	/**
	 * Internal function for adding new touches to the manager
	 * 
	 * @param	Touch	A new FlxTouch object
	 * @return	The added FlxTouch object
	 */
	private function add(Touch:FlxTouch):FlxTouch
	{
		list.push(Touch);
		_touchesCache.set(Touch.touchPointID, Touch); 
		return Touch;
	}
	
	/**
	 * Internal function for touch reuse
	 * 
	 * @param	X			stageX touch coordinate
	 * @param	Y			stageY touch coordinate
	 * @param	PointID		id of the touch
	 * @return	A recycled touch object
	 */
	private function recycle(X:Float, Y:Float, PointID:Int):FlxTouch
	{
		if (_inactiveTouches.length > 0)
		{
			var touch:FlxTouch = _inactiveTouches.pop();
			touch.reset(X, Y, PointID);
			return add(touch);
		}
		
		return add(new FlxTouch(X, Y, PointID));
	}
	
	/**
	 * Called by the internal game loop to update the touch position in the game world.
	 * Also updates the just pressed/just released flags.
	 */
	private function update():Void
	{
		var i:Int = list.length - 1;
		var touch:FlxTouch;
		
		while (i >= 0)
		{
			touch = list[i];
			
			// Touch ended at previous frame
			if (touch._current == 0)
			{
				touch.deactivate();
				_touchesCache.remove(touch.touchPointID);
				list.splice(i, 1);
				_inactiveTouches.push(touch);
			}
			else	// Touch is active currently
			{
				touch.update();
			}
			
			i--;
		}
	}

	private function onFocus():Void {}

	private function onFocusLost():Void
	{
		reset();
	}
}
#end