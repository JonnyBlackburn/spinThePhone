package states.stateManager.transitions;

import states.stateManager.transitions.TransitionHelper.Transitions;
import flash.utils.Function;
import motion.Actuate;

class SlideTransitions {

	public static function pushLeft(currentState:State, nextState:State, callback:Function, duration:Float = 1):Void {
		nextState.x = Main.stageWidth;

		Actuate.tween(currentState, duration, {x: -Main.stageWidth});
		Actuate.tween(nextState, duration, {x: 0}).onComplete(callback);
	}

	public static function pushRight(currentState:State, nextState:State, callback:Function, duration:Float = 1):Void {
		nextState.x = -Main.stageWidth;

		Actuate.tween(currentState, duration, {x: Main.stageWidth});
		Actuate.tween(nextState, duration, {x: 0}).onComplete(callback);
	}

	public static function pushDown(currentState:State, nextState:State, callback:Function, duration:Float = 1.5):Void {
		nextState.y = -Main.stageHeight;

		Actuate.tween(currentState, duration, {y: Main.stageHeight});
		Actuate.tween(nextState, duration, {y: 0}).onComplete(callback);
	}

	public static function pushUp(currentState:State, nextState:State, callback:Function, duration:Float = 1.5):Void {
		nextState.y = Main.stageHeight;

		Actuate.tween(currentState, duration, {y: -Main.stageHeight});
		Actuate.tween(nextState, duration, {y: 0}).onComplete(callback);
	}

	public static function slideLeft(currentState:State, nextState:State, callback:Function, duration:Float = 1):Void {
		nextState.x = -Main.stageWidth;

		Actuate.tween(nextState, duration, {x: 0}).onComplete(callback);
	}

	public static function slideRight(currentState:State, nextState:State, callback:Function, duration:Float = 1):Void {
		nextState.x = Main.stageWidth;

		Actuate.tween(nextState, duration, {x: 0}).onComplete(callback);
	}

	public static function slideDown(currentState:State, nextState:State, callback:Function, duration:Float = 1.5):Void {
		nextState.y = -Main.stageHeight;

		Actuate.tween(nextState, duration, {y: 0}).onComplete(callback);
	}

	public static function slideUp(currentState:State, nextState:State, callback:Function, duration:Float = 1.5):Void {
		nextState.y = Main.stageHeight;

		Actuate.tween(nextState, duration, {y: 0}).onComplete(callback);
	}
}
