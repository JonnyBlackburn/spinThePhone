package states.stateManager;

import flash.events.Event;
import flash.display.Sprite;

class State extends Sprite {

    public function new():Void {
	    super();
    }

	public function load():Void {
	}

	public function setUp():Void {
	}

	public function onEntered():Void {
	}

	public function onEnterStart():Void {
	}

	public function onEnterFinish():Void {
	}

	public function onExitStart():Void {
	}

	public function onExitFinish():Void {
	}

	public function cleanUp():Void {
	}


	public function update(dt:Int):Void {
		//This should be overridden
		trace("Update function not overridden");
	}
}
