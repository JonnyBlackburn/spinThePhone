package states.stateManager;

import flash.events.Event;
import flash.display.Sprite;

class State extends Sprite {

	public static var STATE_KEY:String = "state";

    public function new():Void {
	    super();
    }

	public function load():Void {
	}

	//State has entered the scene
	public function onEntered():Void {
	}

	//State has started transitioning in
	public function onEnterStart():Void {
	}

	//State has finished transitioning in
	public function onEnterFinish():Void {
	}

	//State has started transitioning out
	public function onExitStart():Void {
	}

	//State has finished transitioning out
	public function onExitFinish():Void {
	}

	public function cleanUp():Void {
	}

	public function update(dt:Int):Void {
	}
}
