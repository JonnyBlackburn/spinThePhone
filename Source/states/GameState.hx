package states;

import flash.text.TextFormatAlign;
import flash.text.TextFormat;
import flash.text.TextField;
import flash.display.Bitmap;
import states.stateManager.transitions.TransitionHelper;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Sprite;
import openfl.Assets;

class GameState extends State {

	public static var STATE_KEY = "GameState";

	private var mainContainer:Sprite;
	private var backgroundImage:Bitmap;

	private var dareMenuBtn:Sprite;
	private var dareMenuBtnImage:Bitmap;

	private var phoneIcon:Bitmap;
	private var spinAgain:Bitmap;
	private var dareTextField:TextField;

    public function new() {
	    super();

	    trace("Game state");
    }

	override public function load():Void {

		mainContainer = new Sprite();
		addChild(mainContainer);

		//Background image
		backgroundImage = new Bitmap(Assets.getBitmapData("assets/gameState/background.png", true));
		centerImageX(backgroundImage);
		backgroundImage.y = 52;

		//dareMenu button
		//NOTE: dareMenuBtn is added to the main container
		dareMenuBtn = new Sprite();
		dareMenuBtnImage = new Bitmap(Assets.getBitmapData("assets/gameState/plus.png", true));
		dareMenuBtn.addChild(dareMenuBtnImage);
		dareMenuBtn.x = (Main.stageWidth / 2) - (dareMenuBtn.width / 2);
		dareMenuBtn.y = 700;
		addChild(dareMenuBtn);

		//Phone icon
		phoneIcon = new Bitmap(Assets.getBitmapData("assets/gameState/phoneIcon.png", true));
		centerImageX(phoneIcon);
		phoneIcon.y = ((backgroundImage.height / 2) - (phoneIcon.height / 2)) + backgroundImage.y;

		//Spin again text and border flourish
		spinAgain = new Bitmap(Assets.getBitmapData("assets/gameState/spinAgain.png", true));
		centerImageX(spinAgain);
		spinAgain.y = 535;

		dareTextField = new TextField();
		dareTextField.defaultTextFormat = new TextFormat("assets/fonts/mesquiteStd.otf", 46, 0xDCDCDC,
		TextFormatAlign.CENTER);
		dareTextField.wordWrap = true;
		dareTextField.multiline = true;
		dareTextField.text = "Do the hokey kokey and turn around. Because that’s what it’s all about! Here is the second verse of this awesome song!";
		dareTextField.width = 315;
		dareTextField.height = 370;
		dareTextField.x = 90;
		dareTextField.y = 155;

		addChildrenToMainContainer();
	}

	private function addChildrenToMainContainer():Void {
		mainContainer.addChild(backgroundImage);
		mainContainer.addChild(phoneIcon);
		mainContainer.addChild(spinAgain);
		mainContainer.addChild(dareTextField);
	}

	//Center the image on the stage
	private function centerImageX(image:Bitmap):Void {
		image.x = (Main.stageWidth / 2) - (image.width / 2);
	}

	override public function onEnterStart():Void {
		phoneIcon.visible = true;
		spinAgain.visible = false;
		dareTextField.visible = false;
	}

	override public function onEnterFinish():Void {
		dareMenuBtn.addEventListener(MouseEvent.CLICK, onDareMenuClicked);
		mainContainer.addEventListener(MouseEvent.CLICK, onMainClicked);
	}

	private function onDareMenuClicked(e:MouseEvent):Void {
		dareMenuBtn.removeEventListener(MouseEvent.CLICK, onDareMenuClicked);
		StateManager.getInstance().changeStateTransition(DareState.STATE_KEY, Transitions.SLIDE_PUSH_UP);
	}

	//This is a temp function and will be replaced once
	//We have the accelerometer stuff in
	private function onMainClicked(e:MouseEvent):Void {
		phoneIcon.visible = false;
		spinAgain.visible = true;
		dareTextField.visible = true;
	}

	override public function update(dt:Int):Void {
	}

	override public function cleanUp():Void {
		phoneIcon.visible = true;
		spinAgain.visible = false;
		dareTextField.visible = false;
		mainContainer.removeEventListener(MouseEvent.CLICK, onMainClicked);
	}
}
