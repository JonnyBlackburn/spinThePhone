package states;

import states.stateManager.transitions.TransitionHelper;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.events.MouseEvent;
import flash.display.Sprite;

class GameState extends State {

	public static var STATE_KEY:String = "GameState";

	private var gameCircle:Sprite;

    public function new() {
	    super();

	    trace("Game state");
    }

	override public function load():Void {
		gameCircle = new Sprite();
		gameCircle.graphics.beginFill(0x0000FF);
		gameCircle.graphics.drawCircle(100, 100, 10);
		addChild(gameCircle);
	}

	override public function onEntered():Void {
		gameCircle.addEventListener(MouseEvent.CLICK, onClicked);
	}

	private function onClicked(e:MouseEvent):Void {
		gameCircle.removeEventListener(MouseEvent.CLICK, onClicked);
		StateManager.getInstance().changeStateTransition(MenuState.STATE_KEY, Transitions.RANDOM);
	}

	override public function update(dt:Int):Void {
	}

	override public function cleanUp():Void {
	}
}
