package states;

import flash.display.Bitmap;
import states.stateManager.transitions.TransitionHelper.Transitions;
import states.stateManager.transitions.TransitionHelper;
import states.stateManager.transitions.SlideTransitions;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.Sprite;
import openfl.Assets;

class MenuState extends State {

	public static var STATE_KEY:String = "MenuState";

	private var menuContainer:Sprite;
	private var menuImage:Bitmap;

    public function new():Void {

	    super();

	    trace("Menu State");
    }

	override public function load():Void {

		menuContainer = new Sprite();
		addChild(menuContainer);

		menuImage = new Bitmap(Assets.getBitmapData("assets/mainMenu/label.png", true));
		//Center the image on the stage
		menuImage.x = (Main.baseWidth - menuImage.width) / 2;
		menuImage.y = (Main.baseHeight - menuImage.height) / 2;

		menuContainer.addChild(menuImage);
	}

	override public function onEntered():Void {
		menuContainer.addEventListener(MouseEvent.CLICK, onClicked);
	}

	private function onClicked(e:MouseEvent):Void {
		menuContainer.removeEventListener(MouseEvent.CLICK, onClicked);
		StateManager.getInstance().changeStateTransition(GameState.STATE_KEY, Transitions.SLIDE_PUSH_LEFT);
	}

	override public function update(dt:Int):Void {

	}

	override public function cleanUp():Void {
	}
}
