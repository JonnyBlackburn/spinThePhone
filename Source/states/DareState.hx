package states;

import states.stateManager.StateManager;
import states.stateManager.transitions.TransitionHelper.Transitions;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.display.Sprite;
import states.stateManager.State;
import openfl.Assets;

class DareState extends State {

	public static var STATE_KEY = "DareState";

	private var mainDareContainer:Sprite;
	private var dareBackgroundImage:Bitmap;

	private var dareMenuBtn:Sprite;
	private var dareMenuBtnImage:Bitmap;

    public function new() {
	    super();
	    trace("Dare State");
    }

	override public function load():Void {
		mainDareContainer = new Sprite();
		addChild(mainDareContainer);

		dareBackgroundImage = new Bitmap(Assets.getBitmapData("assets/dareState/background.png", true));
		dareBackgroundImage.x = (Main.baseWidth - dareBackgroundImage.width) / 2;
		dareBackgroundImage.y = 85;
		mainDareContainer.addChild(dareBackgroundImage);

		//dareMenu button
		//NOTE: dareMenuBtn is added to the main container
		dareMenuBtn = new Sprite();
		dareMenuBtnImage = new Bitmap(Assets.getBitmapData("assets/gameState/plus.png", true));
		dareMenuBtn.addChild(dareMenuBtnImage);
		dareMenuBtn.x = (Main.baseWidth - dareMenuBtn.width) / 2;
		dareMenuBtn.y = 700;
		addChild(dareMenuBtn);
	}

	override public function onEnterFinish():Void {
		dareMenuBtn.addEventListener(MouseEvent.CLICK, onDareMenuBtnClicked);
	}

	private function onDareMenuBtnClicked(e:MouseEvent):Void {
		dareMenuBtn.removeEventListener(MouseEvent.CLICK, onDareMenuBtnClicked);
		StateManager.getInstance().changeStateTransition(GameState.STATE_KEY, Transitions.SLIDE_PUSH_DOWN);
	}

	override public function update(dt:Int):Void {

	}
}
