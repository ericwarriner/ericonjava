/*
 * Main.fx
 *
 * Created on Jan 24, 2010, 12:07:53 PM
 */

package magicanswers;

import javafx.lang.FX;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;
import magicanswers.Oracle;

var oracle = Oracle { }






var scene:Scene;
Stage {

	title: "Magic Eight Ball"
    scene:
    scene = Scene {
        height: 700
        width: 900
        fill:null;
        content: [
            Group{
                content:[  ImageView {
                        opacity: 1.0
                        visible: true
                        image: Image {
                            url: "{__DIR__}Background.png"
                        },
                        fitWidth:bind scene.width;
                        fitHeight:bind scene.height;

                    },oracle,
                    
                ]
            }

        ]
    }
};

