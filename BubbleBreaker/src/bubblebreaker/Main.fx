/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package bubblebreaker;
import javafx.stage.Stage;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

import java.util.Random;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.effect.Glow;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.paint.RadialGradient;
import javafx.scene.paint.Stop;
import javafx.scene.Scene;
import javafx.scene.shape.Circle;
import javafx.scene.text.TextAlignment;
import javafx.scene.effect.InnerShadow;
import javafx.scene.effect.DropShadow;
import javafx.ext.swing.SwingButton;

var shift = 10; // from from scene.x and scene.y
var score_count: Number = 0;
var group: Group = new Group;
var slots = [];
var checkedGroup = Group {
        };
var totalScore = 0;

function initGroup() {
    group = new Group;
    slots = [];
    totalScore = 0;

    for (i in [1..10]) {
        for (j in [1..10]) {
            insert "true" into slots;
            insert Ball2 {
                radius: 25;
                vx: i * 50 + shift;
                vy: j * 50 + (shift * 5);
                slot: sizeof slots;
                id: "{sizeof slots}";
            } into group.content;
        }
    }
    insert "true" into slots;//this is required for the 100 slot

}

initGroup();

function fallStep() {
    var aball ;
    //1. iterate through the entire set of balls
    for (node in group.content) {
        aball = (node as Ball2);
        //2. if a ball is marked for deletion then remove from the group and mark the slot as empty(false)
        if (aball.flaggedfordeletion) {
            slots[aball.slot] = "false";
            totalScore = totalScore + Integer.parseInt(aball.score);
            delete aball from group.content;
        }
        //3. if the slot below a ball is empty and not ending with a 1
        if (slots[aball.slot + 1] == "false") {
            var aa = aball.slot + 1;
            if (aa == 11 or aa == 21 or aa == 31 or aa == 41 or aa == 51 or aa == 61 or aa == 71 or aa == 81 or aa == 91) {
                //do nothing

            } else {
                //4. mark the slot at taken(true) and move the ball into it....also mark the previous slot as empty(false);
                slots[aball.slot + 1] = "true";
                slots[aball.slot] = "false";
                aball.slot = aball.slot + 1;
                aball.vy = aball.vy + 50;
                aball.id = "{aball.slot}";
            }
        }

    }
}

function shiftRightStep() {
    for (i in [100..20 step -10]) {
        if (slots[i] == "false") {
            for (j in [(i - 10)..1 step -1]) {
                var aa =
                        group.lookup("{j}") as Ball2;
                if (aa != null) {
                    slots[j + 10] = "true";
                    aa.slot = aa.slot + 10;
                    aa.vx = aa.vx + 50;
                    aa.id = "{aa.slot}";
                    slots[j] = "false";
                }
            }
        }
    }
}

function findNeighbors(aball: Ball2): Void {
    var val ;
    //1.calculate all neighbors
    var r_nball = group.lookup("{aball.slot + 10}") as Ball2;
    var d_nball = group.lookup("{aball.slot + 1}") as Ball2;
    var l_nball = group.lookup("{aball.slot - 10}") as Ball2;
    var u_nball = group.lookup("{aball.slot - 1}") as Ball2;

    //2. make a recursive call to check left,right,up and down
    if (aball.slot <= 90 and not r_nball.checked) {
        r_nball.checked = true;
        val = check(aball, r_nball);
        if (val) {
            aball.checked = true;
            findNeighbors(r_nball);
        }
    }
    if (aball.slot mod 10 != 0 and not d_nball.checked) {
        d_nball.checked = true;
        val = check(aball, d_nball);
        if (val) {
            findNeighbors(d_nball);
        }
    }
    if (aball.slot > 10 and not l_nball.checked) {
        l_nball.checked = true;
        val = check(aball, l_nball);
        if (val) {
            findNeighbors(l_nball);
        }
    }
    if (aball.slot mod 10 != 1 and not u_nball.checked) {
        u_nball.checked = true;
        val = check(aball, u_nball);
        if (val) {
            findNeighbors(u_nball);
        }
    }
}

function check(aball: Ball2, u_nball: Ball2): Boolean {
    var return_value: Boolean = false;

    if (checkColor(aball, u_nball)) {
        aball.effect = Glow {
            level: .4
            input: InnerShadow {
                choke: 0.05
                radius: 25
                color: Color.BLACK
            }
        }
        u_nball.effect = Glow {
            level: .4
            input: InnerShadow {
                choke: 0.05
                radius: 25
                color: Color.BLACK
            }
        }
        u_nball.initialSelect = true;
        return_value = true;
    }
    return return_value;
}

function checkColor(aball: Ball2, nball: Ball2): Boolean {
    var returnvalue: Boolean = false;
    if (aball.colorval == nball.colorval) {
        returnvalue = true;
    }
    return returnvalue;
}

function displayScore() {
    for (node in group.content) {
        var tball = (node as Ball2);
        if (tball.effect != null) {
            tball.score = "{score_count.intValue()}";
        }
    }
}

Timeline {
    repeatCount: Timeline.INDEFINITE
    keyFrames: KeyFrame {
        time: 30ms
        action: function () {
            var aball ;
            for (node in group.content) {
                aball = (node as Ball2);

                if (aball.flaggedfordeletion == true) {
                    for (i in [0..9]) {
                        fallStep();
                    }
                    for (i in [0..9]) {
                        shiftRightStep();
                    }
                }
            }
        }
    }
}.play();

class Ball2 extends CustomNode {

    var radius: Number;
    var vx: Number;
    var vy: Number;
    var slot: Integer;
    var initialSelect: Boolean;
    var flaggedfordeletion: Boolean;
    var checked: Boolean;
    var colorval ;
    var score: String;
    def acolor = [Color.ORANGE, Color.BLACK, Color.DODGERBLUE, Color.PURPLE];
    var random: Random = Random {
            };

    override function create() {
        colorval = random.nextInt(4);
        Group {content: [
                Circle {
                    translateX: bind vx
                    translateY: bind vy
                    radius: radius - 1
                    effect: DropShadow {
                        offsetX: 10
                        offsetY: 10
                        color: Color.BLACK
                        radius: 24
                    }
                    fill: RadialGradient {
                        radius: radius * .9;
                        focusX: radius * 0.2
                        focusY: radius * -8
                        proportional: false
                        stops: [
                            Stop {
                                offset: 0
                                color: Color.WHITE
                            }
                            Stop {
                                offset: 1
                                color: acolor[colorval];
                            }
                        ]
                    }
                    onMousePressed: function (event) {
                        score_count = 0;
                        //1. for every event check to see if the a group has already been identified and this is the second click to initiate deletion
                        if (initialSelect) {
                            var flagged = [];//this is to check to see if only one ball is select FIX ME
                            for (node in group.content) {
                                var aball = (node as Ball2);
                                if (aball.initialSelect == true) {
                                    insert aball into flagged;
                                }
                            }
                            if (sizeof flagged > 1) {//this is to check to see if only one ball is select FIX ME
                                for (flag in flagged) {
                                    var f = (flag as Ball2);
                                    f.flaggedfordeletion = true;
                                }
                            }
                        } else { //2. if we have a group identified but the user doesn't want to delete that group ( by selecting another groups ball) then
                            // remove the intialSelects and effects from the first group
                            for (node in group.content) {
                                var aball = (node as Ball2);
                                if (aball.initialSelect == true) {
                                    aball.initialSelect = false;
                                    aball.effect = null;
                                    aball.score = "";
                                }
                            }
                        }
                        if (initialSelect == false) {
                            initialSelect = true;

                            findNeighbors(this);

                            for (node in group.content) {
                                var tball = (node as Ball2);
                                if (tball.effect != null) {
                                    score_count = score_count + 1;
                                }
                                if (tball.checked == true) {
                                    tball.checked = false;
                                }
                            }
                            if (score_count > 9) {
                                score_count = score_count * 9
                            }
                            if (score_count == 8) {
                                score_count = score_count * 7
                            }
                            if (score_count == 7) {
                                score_count = score_count * 6
                            }
                            if (score_count == 6) {
                                score_count = score_count * 5
                            }
                            if (score_count == 5) {
                                score_count = score_count * 5
                            }
                            if (score_count == 4) {
                                score_count = score_count * 3
                            }
                            if (score_count == 3) {
                                score_count = score_count * 2
                            }
                            displayScore();
                        }
                    }
                }
                Text {
                    font: Font {size: 12
                    }
                    x: bind vx - 5,
                    y: bind vy
                    textAlignment: TextAlignment.LEFT
                    content: bind "{score}";
                }
            ]
        }
    }
}
var button = Group {
            translateY: 610
            translateX: 245
            content: [
                SwingButton {
                    text: "New Game"
                    action: function () {
                        initGroup()
                    }
                }
            ]
        }
var x = Stage {
            title: "Bubble Breaker"
            width: 600
            height: 700
            scene: Scene {
                fill: Color.GREY;
                content: bind [
                    button,
                    Text {
                        x: 220
                        y: 50
                        fill: Color.ORANGE
                        effect: Glow {
                            level: .8
                            input: InnerShadow {
                                choke: 0.05
                                radius: 2
                                color: Color.BLACK
                            }
                        }
                        font: Font {size: 30
                        }
                        content: "Score {totalScore}"
                    }
                    group
                ]
            }
        }