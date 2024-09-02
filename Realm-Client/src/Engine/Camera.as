package Engine {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Point;
import flash.ui.Keyboard;

public class Camera extends Sprite {

    private var map:Map;
    private var position:Point; // Position of the camera on the map
    private var viewportSize:Point; // Size of the visible area (viewport)

    private var speed:int = 5; // Speed of the camera movement

    public function Camera(map:Map, viewportWidth:Number, viewportHeight:Number) {
        this.map = map;
        this.position = new Point(0, 0); // Initial camera position
        this.viewportSize = new Point(viewportWidth, viewportHeight);
        addChild(this.map);

        addEventListener("enterFrame", onEnterFrame);
        Main.STAGE.addEventListener("keyDown", onKeyDown);
        Main.STAGE.addEventListener("keyUp", onKeyUp);
    }

    private var keys:Object = {}; // Object to store key states

    private function onKeyDown(e:KeyboardEvent):void {
        keys[e.keyCode] = true;
    }

    private function onKeyUp(e:KeyboardEvent):void {
        keys[e.keyCode] = false;
    }

    private function onEnterFrame(e:Event):void {
        // Handle camera movement based on key states
        if (keys[Keyboard.LEFT]) {
            position.x -= speed;
        }
        if (keys[Keyboard.RIGHT]) {
            position.x += speed;
        }
        if (keys[Keyboard.UP]) {
            position.y -= speed;
        }
        if (keys[Keyboard.DOWN]) {
            position.y += speed;
        }

        // Update the map position based on the camera's position
        map.x = -position.x;
        map.y = -position.y;
    }

    // Function to move the camera to a new position
    public function moveTo(newX:Number, newY:Number):void {
        this.position.x = newX;
        this.position.y = newY;
    }

    // Function to center the camera on a specific point on the map
    public function centerOn(point:Point):void {
        this.position.x = point.x - viewportSize.x / 2;
        this.position.y = point.y - viewportSize.y / 2;
    }
}
}
