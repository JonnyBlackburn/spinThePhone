package states;

import primitives.Button;
import flash.display.Bitmap;
import states.stateManager.transitions.TransitionHelper.Transitions;
import states.stateManager.transitions.TransitionHelper;
import states.stateManager.transitions.SlideTransitions;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.Sprite;

class MenuState extends State {

	public static var STATE_KEY:String = "MenuState";

	private var menuImageBtn:Button;

    public function new():Void {

	    super();

	    trace("Menu State");
    }

	override public function load():Void {

		menuImageBtn = new Button("assets/mainMenu/label.png", onMenuClicked);
		//Center the image on the stage
		menuImageBtn.x = (Main.stageWidth - menuImageBtn.width) / 2;
		menuImageBtn.y = (Main.stageHeight - menuImageBtn.height) / 2;

		addChild(menuImageBtn);
	}

	override public function onEntered():Void {
	}

	private function onMenuClicked(e:MouseEvent):Void {
		StateManager.getInstance().changeStateTransition(GameState.STATE_KEY, Transitions.SLIDE_PUSH_LEFT);
	}

	override public function update(dt:Int):Void {

	}

	override public function cleanUp():Void {
	}
}
