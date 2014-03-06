package dares;

class Dare {
	public var dareText:String;
	public var selected:Bool;

	public function new(text:String):Void {
		dareText = text;
		selected = true;
	}
}
