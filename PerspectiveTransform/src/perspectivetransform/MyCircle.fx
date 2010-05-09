/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package perspectivetransform;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.chart.part.PlotSymbol.Circle;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color;

public class MyCircle extends CustomNode {
def shift = 30; //This would be the shift from scene.x =0 scene.y=0
 public var y:Integer on replace {
        BBy = y;
    };
    var BBy:Number on replace {
        y = BBy as Integer;
     };

  public var x:Integer on replace {
        BBx = x;
    };
    var BBx:Number on replace {
        x = BBx as Integer;
    };
    public override function create(): Node {
        return Group {
            translateX: bind BBx
            translateY: bind BBy
            content: [Circle {
   //                 radius: 10,
                    fill: Color.RED
                }
            ]

            onMouseDragged:function(e:MouseEvent):Void{

                var tx = e.sceneX ;
                if(tx < 0 + shift) {
                    tx = shift;
                }
                if(tx > (420 + shift)  - this.boundsInLocal.width) {
                    tx = (420 + shift) - this.boundsInLocal.width;
                }
                BBx = tx;

                var ty = e.sceneY;
                if(ty < 0 + shift) {
                    ty = 0 + shift;
                }
                if(ty > (420 + shift) - this.boundsInLocal.height) {
                    ty = (420 + shift) - this.boundsInLocal.height;
                }

                BBy = ty;

            }

        };
    }
}