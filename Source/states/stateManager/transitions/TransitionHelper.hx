package states.stateManager.transitions;

import states.stateManager.transitions.TransitionHelper.Transitions;
import flash.utils.Function;
import motion.Actuate;

using Lambda;

enum Transitions {
	SLIDE_PUSH_LEFT;
	SLIDE_PUSH_RIGHT;
	SLIDE_PUSH_UP;
	SLIDE_PUSH_DOWN;
	SLIDE_LEFT;
	SLIDE_RIGHT;
	SLIDE_UP;
	SLIDE_DOWN;
}

class TransitionHelper {

	private static var _instance:TransitionHelper;

	public static function getInstance():TransitionHelper {
		if(_instance == null) _instance = new TransitionHelper();

		return _instance;
	}

	private var transitions:Map<Transitions, Function>;

    private function new() {

	    transitions = new Map<Transitions, Function>();

	    //Slide Transitions
	    transitions.set(Transitions.SLIDE_PUSH_LEFT, SlideTransitions.pushLeft);
	    transitions.set(Transitions.SLIDE_PUSH_RIGHT, SlideTransitions.pushRight);
	    transitions.set(Transitions.SLIDE_PUSH_DOWN, SlideTransitions.pushDown);
	    transitions.set(Transitions.SLIDE_PUSH_UP, SlideTransitions.pushUp);
	    transitions.set(Transitions.SLIDE_LEFT, SlideTransitions.slideLeft);
	    transitions.set(Transitions.SLIDE_RIGHT, SlideTransitions.slideRight);
	    transitions.set(Transitions.SLIDE_UP, SlideTransitions.slideUp);
	    transitions.set(Transitions.SLIDE_DOWN, SlideTransitions.slideDown);
    }

	public function getRandomTransition() : Function {
		var rand:Int = Math.floor(Math.random() * (Lambda.count(transitions)));

		var i:Int = 0;
		var chosenKey:Transitions;

		for(key in transitions.keys()) {
			chosenKey = key;
			if(i == rand) break;
			i++;
		}

		return transitions.get(chosenKey);
	}

	public function getTransition(transitionKey:Transitions) : Function {

		trace(transitionKey);

		return transitions.get(transitionKey);
	}
}
