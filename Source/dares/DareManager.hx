package dares;

import flash.net.SharedObjectFlushStatus;
import haxe.Json;
import flash.net.SharedObject;

class DareManager {

	private static var DARE_STORE:String = "dareStore";

	private static var _instance:DareManager;

	private var dareObject:DareObject;

	private var sharedObject:SharedObject;

	public static function getInstance():DareManager {
		if(_instance == null) _instance = new DareManager();

		return _instance;
	}

    private static function new() {
	    sharedObject = SharedObject.getLocal(DARE_STORE);

	    if(sharedObject.data.dares == null) sharedObject.data.dares = "";

	    dareObject = new DareObject();
    }

	public function saveDares():Void {
		#if(cpp || neko)
		var flushStatus:SharedObjectFlushStatus = null;
		#else
		var flushStatus:String = null;
		#end

		try {
			sharedObject.data.dares = Json.stringify(dareObject.dareArray);
			flushStatus = sharedObject.flush();
		}
		catch(e:Dynamic) {
			trace("Couldn't save Data");
		}

		if(flushStatus != null) {
			switch(flushStatus) {
				case SharedObjectFlushStatus.PENDING:
				trace("Requesting permission to save");

				case SharedObjectFlushStatus.FLUSHED:
				trace("Data saved");
			}
		}
	}

	public function loadDares():Void {
		dareObject.dareArray = Json.parse(sharedObject.data.dares);

		trace(dareObject.dareArray.length);
		trace(dareObject.dareArray[0]);
	}

	public function createDare(text:String):Void {
		var dare:Dare = new Dare(text);

		dareObject.dareArray.push(dare);
	}

	public function toggleSelection(dare:Dare):Void {
		var index:Int = Lambda.indexOf(dareObject.dareArray, dare);

		dareObject.dareArray[index].selected = !dareObject.dareArray[index].selected;
	}

	public function getDares():Array<Dare> {
		return dareObject.dareArray;
	}

}
