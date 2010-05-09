/*
 * MessageObject.fx
 *
 * Created on Apr 18, 2010, 10:06:35 AM
 */

package magicanswers;



import java.util.Random;
import javafx.animation.*;
import javafx.scene.*;
import javafx.scene.effect.DropShadow;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;

public class MessageObject extends CustomNode {
    def rnd : Random = new Random();
    public var content:String;
    var image:Image =  Image {
        url: "{__DIR__}Triangle.png"

    }
    var imageView=ImageView {
        image: bind image
        visible: true
        cache:true}

    public override function create(): Node {
        return Group {
            content: [
                imageView,
                Text{
                    translateX: bind imageView.translateX + 31
                    translateY: bind imageView.translateY + 85
                    content:content;
                    font: Font {
                        size: 15
                    }
                    wrappingWidth: 100
                    textAlignment: TextAlignment.LEFT
                    fill:Color.LIGHTBLUE;
                },
            ]
            cache:true;
        }
    }

    public var fade = Timeline {

        def sx1 =.9;     def sx2 = .5;
        def sy1 =.9;     def sy2 = .5;
        def tx1 = 437;   def tx2 = 437 ;
        def ty1 = 300;   def ty2 = 300;
        def ro1 = this.rotate; def ro2 = rnd.nextDouble() * 400;
        keyFrames: [
            at(0s) {
            this.opacity    => .1 tween  Interpolator.LINEAR;
            this.scaleX     => sx2 tween Interpolator.LINEAR;
            this.scaleY     => sy2 tween Interpolator.LINEAR;
            this.translateX => tx2 tween Interpolator.LINEAR;
            this.translateY => ty2 tween Interpolator.LINEAR;
            this.rotate     => ro2 tween Interpolator.LINEAR;
            },
            at(2s)  {
            this.opacity    =>.5 tween Interpolator.LINEAR;
            },
            at(4s) {
            this.opacity    => 1.0 tween Interpolator.LINEAR;
            this.scaleX     => sx1 tween Interpolator.LINEAR;
            this.scaleY     => sy1 tween Interpolator.LINEAR;
            this.translateX => tx1 tween Interpolator.LINEAR;
            this.translateY => ty1 tween Interpolator.LINEAR;
            this.rotate     => ro1 tween Interpolator.LINEAR;
            },
            at(8s)  {
            this.opacity    => .1 tween Interpolator.LINEAR;
            },
            KeyFrame {
                time: 8s
                action: function() {
                    delete this from (this.parent as Group).content;
                }
            }
        ]
    }
};

