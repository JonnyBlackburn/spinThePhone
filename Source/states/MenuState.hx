package states;

import states.stateManager.transitions.TransitionHelper.Transitions;
import states.stateManager.transitions.SlideTransitions;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.Sprite;

class MenuState extends State {

	public static var STATE_KEY:String = "MenuState";

	private var menuCircle:Sprite;

    public function new():Void {

	    super();

	    trace("Menu State");
    }

	override public function load():Void {
		menuCircle = new Sprite();
		menuCircle.graphics.beginFill(0x00FF00);
		menuCircle.graphics.drawCircle(100, 100, 10);
		addChild(menuCircle);
	}

	override public function onEntered():Void {
		menuCircle.addEventListener(MouseEvent.CLICK, onClicked);
	}

	private function onClicked(e:MouseEvent):Void {
		menuCircle.removeEventListener(MouseEvent.CLICK, onClicked);
		StateManager.getInstance().changeStateTransition(GameState.STATE_KEY, Transitions.SLIDE_PUSH_LEFT);
	}

	override public function update(dt:Int):Void {

	}

	override public function cleanUp():Void {
	}
}
