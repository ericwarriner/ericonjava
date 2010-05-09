
package perspectivetransform;


import javafx.ext.swing.SwingSlider;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.text.Text;

public class MySlider extends CustomNode {
def shift = 30; //This would be the shift from scene.x =0 scene.y=0
    public var x=100;
    public var y=100;
    public var vertical=false;
    public var value=200;

    public override function create(): Node {
        return Group {
            content: [SwingSlider {
                    translateX:bind x
                    translateY:bind y
                    minimum: 0 + shift
                    maximum: 400 + shift

                    value: bind value with inverse
                    vertical: bind vertical
                }, Text {
                    x: bind x
                    y: bind y
                    rotate:
                    if (vertical)180 else 0;
                    content: bind "{value - shift}"
                }

            ]
        };
    }
}