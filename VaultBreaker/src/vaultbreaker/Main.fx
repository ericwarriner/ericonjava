package vaultbreaker;

import vaultbreaker.Results;
import javafx.ext.swing.SwingButton;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.effect.Lighting;
import java.util.Random;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.stage.Stage;

var shift = 145; // from from scene.x and scene.y
var xshift = -50;
var score_count: Integer;
var random_number: String;
var group: Group = new Group;
var checkedGroup: Group;
var rs_group_array: Results[];
var rs_group: Group;
var guess: String;
var random = new Random();

function randomNumberGen():String{
  var x:String = String.valueOf((random.nextInt(999) * 100));
return "{x.substring(0, 3)}"};

function initGroup(){
rs_group_array =[];
random_number = randomNumberGen();
checkedGroup =  new Group;
rs_group = new Group;
guess ="";
score_count=0;
println(random_number);
}
initGroup();

var guessdisplay = Text {
    font: Font {
        size: 48
    }
    effect: Lighting {
        diffuseConstant: 1.0
        specularConstant: 1.0
        specularExponent: 20
        surfaceScale: 1.5
    }

    underline: true;
    fill: Color.SILVER;
    x: 100,
    y: 400
    content: bind guess;
}

var scoredisplay = Text {
    font: Font {
        size: 24
    }
    effect: Lighting {
        diffuseConstant: 1.0
        specularConstant: 1.0
        specularExponent: 20
        surfaceScale: 1.5
    }
    fill: Color.DODGERBLUE;
    x: 320,
    y: 40
    content: bind "Count: {score_count}";
}

for( i in [1..12]){
    insert NumberButton{
        value: "       {i}       ";
        id: "{i}";
    }
    into group.content;
}

function placeNumbers(){

    var b_1 = group.lookup("{1}") as NumberButton;
    b_1.vx = 100 + xshift;
    b_1.vy = 400 + shift;
    var b_2 = group.lookup("{2}") as NumberButton;
    b_2.vx = 175 + xshift;
    b_2.vy = 400 + shift;
    var b_3 = group.lookup("{3}") as NumberButton;
    b_3.vx = 250 + xshift;
    b_3.vy = 400 + shift;
    var b_4 = group.lookup("{4}") as NumberButton;
    b_4.vx = 100 + xshift;
    b_4.vy = 350 + shift;
    var b_5 = group.lookup("{5}") as NumberButton;
    b_5.vx = 175 + xshift;
    b_5.vy = 350 + shift;
    var b_6 = group.lookup("{6}") as NumberButton;
    b_6.vx = 250 + xshift;
    b_6.vy = 350 + shift;
    var b_7 = group.lookup("{7}") as NumberButton;
    b_7.vx = 100 + xshift;
    b_7.vy = 300 + shift;
    var b_8 = group.lookup("{8}") as NumberButton;
    b_8.vx = 175 + xshift;
    b_8.vy = 300 + shift;
    var b_9 = group.lookup("{9}") as NumberButton;
    b_9.vx = 250 + xshift;
    b_9.vy = 300 + shift;
    var b_10 = group.lookup("{10}") as NumberButton;
    b_10.vx = 92 + xshift;
    b_10.vy = 450 + shift;
    b_10.value = "CLEAR";
    var b_11 = group.lookup("{11}") as NumberButton;
    b_11.vx = 173 + xshift;
    b_11.vy = 450 + shift;
    b_11.value = "0";
    var b_12 = group.lookup("{12}") as NumberButton;
    b_12.vx = 252 + xshift;
    b_12.vy = 450 + shift;
    b_12.value = "ENTER";

}

placeNumbers();

function checkNumber(){

    score_count++;
    var blue: Integer = 0;
    var silver: Integer = 0;

    var result = Results{
        vx: 100,
        vy: 100,
        radius: 10
    }

    if(guess == random_number){
        println("GAME WON {score_count}");
        winner.playFromStart();
        initGroup();
        return;
    }

    var pos_1 = guess.substring(0,1);
    var pos_2 = guess.substring(1,2);
    var pos_3 = guess.substring(2,3);

    if(pos_1 == random_number.substring(0,1) or pos_1 == random_number.substring(1,2) or pos_1 == random_number.substring(2,3)){
        if(pos_1 == random_number.substring(0,1)){
            blue++;
        }else {
            silver++;
        }

    }

    if(pos_2 == random_number.substring(0,1) or pos_2 == random_number.substring(1,2) or pos_2 == random_number.substring(2,3)){
        if(pos_2 == random_number.substring(1,2)){
            blue++;
        }else {
            silver++;
        }

    }

    if(pos_3 == random_number.substring(0,1) or pos_3 == random_number.substring(1,2) or pos_3 == random_number.substring(2,3)){
        if(pos_3 == random_number.substring(2,3)){
            blue++;
        }else {
            silver++;
        }

    }

    for(b in [1..blue]){
        insert Color.BLACK into result.result_set;
    }
    for(s in [1..silver]){
        insert Color.DODGERBLUE into result.result_set;
    }

    result.guess = guess;

    insert result before rs_group_array[0];

    rs_group= new Group;
    var i = 0;
    var count = 0;
    for (node in rs_group_array){
        count++;

        node.translateX = 245;
        node.translateY = i;
        i=i + 29;
        if(count < 20){
        insert node into rs_group.content;
        }
    }

}

var background_image = ImageView {
    image: Image {
        url: "{__DIR__}Image.jpg"
    }
fitWidth: 300
fitHeight: 300
    visible: true
}
var background_image2 = ImageView {
    image: Image {
        url: "{__DIR__}Image3.jpg"
    }
fitWidth: 300
fitHeight: 300
    visible: true
}

Stage {
    title: "Break the Vault"
    width: 465
    height: 670
    scene: Scene {
        content: bind[ group,guessdisplay,rs_group,background_image2,background_image,scoredisplay ]
        fill: LinearGradient {
            startX: 0.0
            startY: 400.0
            endX: 0.0
            endY: 700.0
            proportional:false;
            stops: [
                Stop {
                    color: Color.WHITE
                    offset: 0.0
                },
                Stop {
                    color: Color.DODGERBLUE
                    offset: 1.0
                },

            ]
        }
    }
}

class NumberButton extends CustomNode {

    var radius: Number;
    var vx: Number;
    var vy: Number;
    var value: String;

    override function create() {

        Group{
            content: [
                SwingButton {
                    translateX: bind vx;
                    translateY: bind vy;
                    text: bind value
                    action: function(){
                        if(id == "12" and (guess.length() == 3)){
                            checkNumber();
                            guess ="";
                        }
                        if(id == "10"){

                            guess = "";
                        }

                        if(guess.length() < 3 and not (value   ==   "CLEAR") and not (value   ==   "ENTER")){

                            guess ="{guess}{value.trim()}"
                        }
                    }
                }

            ]

        }
    }
}

var winner = Timeline {
    keyFrames:[
        KeyFrame { time: 0s values:  background_image.opacity => 1  },
        KeyFrame { time: 0s values:  guess => ""  },
        KeyFrame { time: 1s values: background_image.opacity => 0 tween Interpolator.LINEAR },
        KeyFrame { time: 1s values:  guess => "You Win!"  },
        KeyFrame { time: 4s values: background_image.opacity => 0 tween Interpolator.LINEAR },
    ]
    autoReverse: true
    repeatCount:2;
}

