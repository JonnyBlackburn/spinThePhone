package primitives;

import flash.geom.Point;
import flash.events.MouseEvent;
import flash.display.BitmapData;
import flash.utils.Function;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;

class Button extends Sprite {

	private var _image:Bitmap;
	private var _callback:Function;

	@:isVar public var originX(get, set):Float;
	@:isVar public var originY(get, set):Float;

	private function set_originX(newOriginX:Float):Float {
		_image.x -= newOriginX;
		return newOriginX;
	}

	private function get_originX():Float {
		return originX;
	}

	private function set_originY(newOriginY:Float):Float {
		_image.y -= newOriginY;
		return newOriginY;
	}

	private function get_originY():Float {
		return originY;
	}

    public function new(imageURL:String, callback:Function):Void {

	    super();

	    _image = new Bitmap(Assets.getBitmapData(imageURL, true));
	    addChild(_image);

	    _callback = callback;

	    setUp();
    }

	public function setUp():Void {
		addEventListener(MouseEvent.CLICK, _callback);
	}

	public function cleanUp():Void {
		removeEventListener(MouseEvent.CLICK, _callback);
	}
}
