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

	private var transitionHelper:TransitionHelper;

	private var menuContainer:Sprite;
	private var menuImage:Bitmap;

    public function new():Void {

	    super();

	    transitionHelper = TransitionHelper.getInstance();

	    trace("Menu State");
    }

	override public function load():Void {

		menuContainer = new Sprite();
		menuImage = new Bitmap(Assets.getBitmapData("assets/mainMenu/label.png", true));

		menuContainer.x = (Main.stageWidth / 2) - (menuImage.width / 2);
		menuContainer.y = (Main.stageHeight / 2) - (menuImage.height / 2);

		menuContainer.addChild(menuImage);
		addChild(menuContainer);
	}

	override public function onEntered():Void {
		menuContainer.addEventListener(MouseEvent.CLICK, onClicked);
	}

	private function onClicked(e:MouseEvent):Void {
		menuContainer.removeEventListener(MouseEvent.CLICK, onClicked);
		StateManager.getInstance().changeStateTransition(GameState.STATE_KEY, transitionHelper.getRandomTransition());
	}

	override public function update(dt:Int):Void {

	}

	override public function cleanUp():Void {
	}
}
