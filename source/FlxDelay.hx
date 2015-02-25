
/**
 * FlxDelay
 * -- Part of the Flixel Power Tools set
 * 
 * v1.1 Updated for the Flixel 2.5 Plugin system
 * 
 * @version 1.1 - April 23rd 2011
 * @link http://www.photonstorm.com
 * @author Richard Davey / Photon Storm
*/

package;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	import org.flixel.*;
	
	/**
	 * A useful timer that can be used to trigger events after certain amounts of time are up.<br />
	 * Uses getTimer so is low on resources and avoids using Flash events.<br />
	 * Also takes into consideration the Pause state of your game.<br />
	 * If your game pauses, when it starts again the timer notices and adjusts the expires time accordingly.
	 */
	
	class FlxDelay extends Sprite
	{
		public var isRunning:Bool;
		
		private var started:Int;
		public var duration:Int;
		private var expires:Int;
		private var pauseStarted:Int;
		private var pausedTimerRunning:Bool;
		private var complete:Bool;
		
		/**
		 * Create a new timer which will run for the given amount of ms (1000 = 1 second real time)
		 * 
		 * @param	runFor	The duration of this timer in ms. Call start() to set it going.
		 */
		public function new(runFor:Int)
		{
			duration = runFor;
		}
		
		/**
		 * Starts the timer running
		 */
		public function start():Void
		{
			started = getTimer();
			expires = started + duration;
			isRunning = true;
			complete = false;
			
			pauseStarted = 0;
			pausedTimerRunning = false;
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		/**
		 * Has the timer finished?
		 */
		public function get hasExpired():Bool
		{
			return complete;
		}
		
		/**
		 * Restart the timer using the new duration
		 * 
		 * @param	newDuration	The duration of this timer in ms.
		 */
		public function reset(newDuration:Int):Void
		{
			duration = newDuration;
			
			start();
		}
		
		private function update(event:Event):Void
		{
			//	Has the game been paused?
			if (pausedTimerRunning == true && FlxG.paused == false)
			{
				pausedTimerRunning = false;
				
				//	Add the time the game was paused for onto the expires timer
				expires += (getTimer() - pauseStarted);
			}
			else if (FlxG.paused == true && pausedTimerRunning == false)
			{
				pauseStarted = getTimer();
				pausedTimerRunning = true;
			}
			
			if (isRunning && pausedTimerRunning == false && getTimer() > expires)
			{
				stop();
			}
		}
		
		/**
		 * Abors a currently active timer without firing any callbacks (if set)
		 */
		public function abort():Void
		{
			stop();
		}
		
		private function stop():Void
		{
			removeEventListener(Event.ENTER_FRAME, update);
			
			isRunning = false;
			complete = true;
		}
		
	}