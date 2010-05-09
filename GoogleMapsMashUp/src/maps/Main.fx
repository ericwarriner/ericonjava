/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package maps;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.control.TextBox;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.data.pull.Event;
import javafx.data.pull.PullParser;
import javafx.io.http.HttpRequest;
import javafx.io.http.URLConverter;
import javafx.ext.swing.SwingLabel;

var base_url:String ="http://maps.google.com/staticmap?zoom=7&amp;size=600x500";
var s:String ="http://maps.google.com/staticmap?markers=38,-77&amp;zoom=7&amp;size=600x500";
var stations:String="Stations:";

bound function getMapImage(s):Image {
var mapurl:String = "{s}";
var map:Image = Image {
  url: mapurl;
}
return map;
}

function parseNprQuery(zip:String):Void {
def getRequest: HttpRequest = HttpRequest {
  var zip_enc = URLConverter{}.encodeString(zip);
  var name ="";
  location: "http://api.npr.org/stations.php?apiKey=YOUR_API_KEY&amp;zip={zip_enc}";
  onInput: function(is: java.io.InputStream) {
    def parser = PullParser {
      documentType: PullParser.XML;
      input: is;
      onEvent: function(event: Event) {
        if (event.type == PullParser.END_ELEMENT) {
          if (event.qname.name == "marketCity") {
            getLatLng(event.text);
          }else if (event.qname.name == "name") {
            name = event.text;
          }else if (event.qname.name == "frequency") {
            stations="{stations} {name} {event.text}";
          }
        }
      }
    }
    parser.parse();
    parser.input.close();
  }
}
getRequest.start();
}

function getLatLng(place:String):Void {
def getRequest: HttpRequest = HttpRequest {
  var place_enc = URLConverter{}.encodeString(place);
  location: "http://maps.google.com/maps/geo?q={place_enc}&amp;output=xml";
  onInput: function(is: java.io.InputStream) {
    def parser = PullParser {
      documentType: PullParser.XML;
      input: is;
      onEvent: function(event: Event) {
        if (event.type == PullParser.END_ELEMENT) {
          if (event.qname.name == "code" and event.text == "602") {
            //TODO:alert user of problem
          }
          else if (event.qname.name == "coordinates") {
            var pts = event.text.split(",");
            s="{s}&amp;markers={java.lang.Float.parseFloat(pts[1])},{java.lang.Float.parseFloat(pts[0])}";
          }
        }
      }
    }
    parser.parse();
    parser.input.close();
  }
}
getRequest.start();
}

var mapview:ImageView = ImageView {
layoutX:10 layoutY:75;
image: bind getMapImage(s);
}

def zipLabel = SwingLabel {
  layoutX:10 layoutY:15;
  text: "Enter US Zip code :"
}

def zip = TextBox {
  layoutX:120 layoutY:10;
  text: ""
  columns: 10
  selectOnFocus: true
}

def btnUpdateMap = Button {
layoutX:240 layoutY:10;
text: "Get NPR Radio Stations"
action: function() {
  var addr:String = zip.text;
  s=base_url;
  stations="Stations :";
  parseNprQuery(addr);
}
}

def stationsLabel = Label {
layoutX:10 layoutY:45;
width:650;
text: bind stations;
}

def stage = Stage {
title : "JavaFX NPR Google Maps"
scene: Scene {
  width: 650
  height: 600
  content: [zipLabel, zip,btnUpdateMap,stationsLabel,mapview]
    }
}