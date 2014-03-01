package;


import states.GameState;
import states.MenuState;
import states.stateManager.StateManager;
import states.stateManager.State;
import flash.Lib;
import flash.events.Event;
import flash.display.Sprite;

class Main extends Sprite {

	private var _currentTime:Int = 0;
	private var _previousTime:Int = 0;
	private var _deltaTime:Int = 0;

	public static var stateManager:StateManager;

	public static var stageWidth:Int;
	public static var stageHeight:Int;

	public function new():Void {
		
		super ();

		stageWidth = Lib.current.stage.stageWidth;
		stageHeight = Lib.current.stage.stageHeight;

		stateManager = StateManager.getInstance();
		stateManager.addState(MenuState.STATE_KEY, new MenuState());
		stateManager.addState(GameState.STATE_KEY, new GameState());
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