package perspectivetransform;

import javafx.scene.shape.Line;
import javafx.ext.swing.SwingButton;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.effect.PerspectiveTransform;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

def shift = 30; //This would be the shift from scene.x =0 scene.y=0

var uly:Integer = 40 + shift; //uly=  upper left y value
var ulx:Integer = 0 + shift;
var ury:Integer = 0 + shift;
var urx:Integer = 400 + shift;
var lly:Integer = 200 + shift;
var llx:Integer = 0 + shift;
var lry:Integer = 400 + shift;
var lrx:Integer = 400 + shift; //lrx=  lower right x value

def grid=Group{};
var nums = [0..40];
//sets the background grid
for(a_num in nums){
        insert Line{
        opacity:.3,
        startX:a_num * 10 + shift,
        endX:a_num * 10 + shift
        startY:shift
        endY:400 + shift} into grid.content;
insert Line{
        opacity:.3,
        startX:shift,
        endX:400 + shift,
        startY:a_num * 10 + shift,
        endY:a_num * 10 + shift} into grid.content;
}

//ULB = Upper Left Ball
var ULB = MyCircle {

    x: bind ulx with inverse,
    y: bind uly with inverse;
}
//URB = Upper Right Ball
var URB = MyCircle {

    x: bind urx with inverse,
    y: bind ury with inverse;

}
//LLB = Lower Left Ball
var LLB = MyCircle {

    x: bind llx with inverse,
    y: bind lly with inverse;

}
//LRB = Lower Right Ball
var LRB = MyCircle {

    x: bind lrx with inverse,
    y: bind lry with inverse;

}

Stage {
    title: "Perspective"
    width: 510
    height: 550
    scene: Scene {
        fill: Color.TRANSPARENT
        content: [
            Group{
                content:bind [
                   grid,
                    ImageView {
                        image: Image {
                            url: "{__DIR__}Image.jpg"
                        }
                        effect: bind PerspectiveTransform {
                            ulx: bind ulx
                            uly: bind uly
                            urx: bind urx
                            ury: bind ury
                            lrx: bind lrx
                            lry: bind lry
                            llx: bind llx
                            lly: bind lly

                        }

                        visible: true
                    }
                    ,MySlider{
                        x:0 + shift,
                        y:10,

                        vertical:false,
                        value:bind ulx with inverse

                    },MySlider{
                        x:200 + shift,
                        y:10,
                        vertical:false,
                        value:bind urx with inverse

                    }
                    MySlider{
                        x:10,
                        y:40,
                        rotate:180
                        value:bind uly with inverse,
                    vertical:true},
                    MySlider{
                        x:10,
                        y:250,
                        rotate:180
                        value:bind lly with inverse,
                    vertical:true},
                    MySlider{
                        x:435,
                        y:40,
                        rotate:180
                        value:bind ury with inverse,
                    vertical:true},
                    MySlider{
                        x:435,
                        y:250,
                        rotate:180
                        value:bind lry with inverse,
                    vertical:true},
                    MySlider{
                        x:10 + shift,
                        y:450,
                        vertical:false
                        value:bind llx with inverse}
                    MySlider{
                        x:210 + shift,
                        y:450,
                        vertical:false
                        value:bind lrx with inverse},
                ULB,
                URB,
                LLB,
                LRB,
                    SwingButton {
                        translateX:210
                        translateY: 470
                        text: "RESET"
                        action: function() {
                            uly = 40 + shift;
                            ulx= 0 + shift;
                            ury = 0 + shift;
                            urx = 400 + shift;
                            lly = 200 + shift;
                            llx= 0 + shift;
                            lry = 400 + shift;
                            lrx = 400 + shift;

                        }
                    }

                ]}
        ]

    }
}


