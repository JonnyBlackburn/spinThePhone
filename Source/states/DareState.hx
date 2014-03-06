package states;

import dares.Dare;
import Array;
import dares.DareManager;
import primitives.Button;
import states.stateManager.StateManager;
import states.stateManager.transitions.TransitionHelper.Transitions;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.display.Sprite;
import states.stateManager.State;
import openfl.Assets;

class DareState extends State {

	public static var STATE_KEY = "DareState";

	private var dareBackgroundImage:Bitmap;
	private var dareMenuBtn:Button;
	private var jonnyDare:Array<Dare>;

	private var dareManager:DareManager;

    public function new() {
	    super();
	    trace("Dare State");
    }

	override public function load():Void {

		dareBackgroundImage = new Bitmap(Assets.getBitmapData("assets/dareState/background.png", true));
		dareBackgroundImage.x = (Main.stageWidth - dareBackgroundImage.width) / 2;
		dareBackgroundImage.y = 85;
		addChild(dareBackgroundImage);

		//dareMenu button
		dareMenuBtn = new Button("assets/gameState/plus.png", onDareMenuBtnClicked);
		dareMenuBtn.x = (Main.stageWidth - dareMenuBtn.width) / 2;
		dareMenuBtn.y = 700;
		addChild(dareMenuBtn);

		dareManager = DareManager.getInstance();
		dareManager.createDare("Jonny is Awesome!");
		dareManager.createDare("Jonny isn't Awesome!");
	}

	override public function onEntered():Void {
		dareMenuBtn.setUp();
		jonnyDare = dareManager.getDares();

		trace(jonnyDare.length);
		for(i in 0...jonnyDare.length) {
			trace(jonnyDare[i].dareText);
		}
	}

	private function onDareMenuBtnClicked(e:MouseEvent):Void {
		StateManager.getInstance().changeStateTransition(GameState.STATE_KEY, Transitions.SLIDE_PUSH_DOWN);
	}

	override public function update(dt:Int):Void {

	}

	override public function cleanUp():Void {
		dareMenuBtn.cleanUp();
	}
}
