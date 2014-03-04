package;


import states.DareState;
import flash.display.Bitmap;
import states.GameState;
import states.MenuState;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.Lib;
import flash.events.Event;
import flash.display.Sprite;
import openfl.Assets;

class Main extends Sprite {

	private var _currentTime:Int = 0;
	private var _previousTime:Int = 0;
	private var _deltaTime:Int = 0;

	public static var stateManager:StateManager;

	public static var actualStageWidth:Int;
	public static var actualStageHeight:Int;

	public static var stageWidth:Int = 480;
	public static var stageHeight:Int = 800;

	private var backgroundImage:Bitmap;

	public function new():Void {
		
		super ();

		actualStageWidth = Lib.current.stage.stageWidth;
		actualStageHeight = Lib.current.stage.stageHeight;

		scaleX = (actualStageWidth / stageWidth);
		scaleY = (actualStageHeight / stageHeight);

		backgroundImage = new Bitmap(Assets.getBitmapData("assets/background.jpg", false));
		addChild(backgroundImage);

		stateManager = StateManager.getInstance();
		stateManager.addState(MenuState.STATE_KEY, new MenuState());
		stateManager.addState(GameState.STATE_KEY, new GameState());
		stateManager.addState(DareState.STATE_KEY, new DareState());

		//Start on the MenuState
		stateManager.changeState(MenuState.STATE_KEY);

		addChild(stateManager);

		addEventListener(Event.ENTER_FRAME, update);
	}

	private function update(e:Event):Void {

		_currentTime = Lib.getTimer();
		_deltaTime = _currentTime - _previousTime;
		_previousTime = _currentTime;

		stateManager.update(_deltaTime);
	}
}