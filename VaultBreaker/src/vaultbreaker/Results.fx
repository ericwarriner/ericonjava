package vaultbreaker;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.paint.Paint;
import javafx.scene.shape.Ellipse;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.effect.Lighting;
import javafx.scene.effect.Glow;

public class Results extends CustomNode {

    public var vx: Number;
    public var vy: Number;
    public var guess: String;
    public var radius: Number;
    public var result_set = [];

    override function create() {
    var r=2;
        Group{
            content: [
               Text {
                    font: Font {
                        size: 26
                    }
                    x: bind vx -20,
                    y: bind vy + 8
                    content: bind guess;
                    fill: Color.BLACK;
                    effect: Glow {
                        level: .4
                    }
            },
                Ellipse {
                    centerX: bind vx + 40,
                    centerY: bind vy,
                    radiusX: radius ,
                    radiusY: radius + r,
                    fill: bind result_set[0] as Paint;

                }
                Ellipse {
                    centerX: bind vx + 62,
                    centerY: bind vy,
                    radiusX: radius ,
                    radiusY: radius + r,
                    fill: bind result_set[1] as Paint;

                }
                Ellipse {
                    centerX: bind vx + 84,
                    centerY: bind vy,
                    radiusX: radius ,
                    radiusY: radius + r,
                    fill: bind result_set[2] as Paint;

                }
 ]
           effect: Lighting {
diffuseConstant: 1.0
specularConstant: 1.0
specularExponent: 20
surfaceScale: 1.5
            }
        }
    }
}