/*
 * Oracle.fx
 *
 * Created on Apr 18, 2010, 10:03:43 AM
 */

package magicanswers;



import java.util.Random;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.animation.transition.AnimationPath;
import javafx.animation.transition.PathTransition;
import javafx.scene.CustomNode;
import javafx.scene.effect.light.DistantLight;
import javafx.scene.effect.Lighting;
import javafx.scene.effect.Reflection;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.shape.ClosePath;
import javafx.scene.shape.HLineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;

public class Oracle extends CustomNode {
    def rnd : Random = new Random();
    //it appears that 9 words is the limit
    var pool_of_answers = ["Who Knows","Absolutely","Maybe", "Yes", "No","Unclear at this time","Without a doubt"];
    var answer_to_question = "";
    var word:MessageObject;
    var node:Node;
    var flag_changeover:Boolean = false;

    def path = [
        MoveTo {
            x: 500,
            y:600 },
        HLineTo{
        x:525 },
        HLineTo{
        x:475}
        ClosePath{ } ];

    def animation = PathTransition
{
        node: this;
        path: AnimationPath.createFromPath(Path{
            elements: path});
        interpolate: true;
        duration: .3s
        repeatCount: 4
}

    var image:Image = Image {
        url: "{__DIR__}8ball.png"
        preserveRatio: true
        backgroundLoading: true
    }
    var image2:Image =  Image {
        url: "{__DIR__}8ball_view.png"
        preserveRatio: true
        backgroundLoading: true
    }

    public var changeover = Timeline {
        keyFrames: [
            at(0s) {
            this.opacity => .9 tween Interpolator.LINEAR;

            },
            at(2s) {
            this.opacity => 0 tween Interpolator.LINEAR;

            },
            at(4s) {
            this.opacity => 1.0 tween Interpolator.LINEAR;
            },
            KeyFrame {
                time: 2.0s
                action: function() {
                      image=image2;
                      flag_changeover = true;

                }
            }
            KeyFrame {
                time:4.2s
                action: function() {
                      generateMessage();
                }
            }
        ]
    }

    public override function create(): Node {
        node = Group {
            cache:true;
            content: [
                ImageView {
                    x: 250
                    y: 190
                    image: bind image
                    visible: true
                    cache:true
                }

            ] // content
            effect: Reflection {
                topOffset:0.1;
                fraction: 0.85
                topOpacity:.3
                bottomOpacity:0.1
                input:Lighting {
                    light: DistantLight {
                        azimuth: -135
                    }
                    surfaceScale: 9
                }

            }
            onMousePressed: function (event) {
                if(not flag_changeover){
                changeover.playFromStart();
                }
                else if(not animation.running and not word.fade.running  ){
                generateMessage();
                }
            }

        }
    }

      function generateMessage(){
                    animation.playFromStart();
                    answer_to_question = pool_of_answers[
                    rnd.nextInt(sizeof pool_of_answers)];
                    word = MessageObject {
                        content: bind answer_to_question
                    };
                    insert word into (this.parent as Group).content;
                        word.fade.play();

    }

}