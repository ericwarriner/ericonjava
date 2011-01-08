package com.ericonjava;


import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import org.json.JSONException;
import org.json.JSONObject;

import com.ericonjava.R;

import com.google.android.maps.GeoPoint;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapView;
import com.google.android.maps.Overlay;
import com.google.android.maps.OverlayItem;


import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


public class MainView extends MapActivity implements Caller {
	
	//Regex from http://stackoverflow.com/questions/106179/regular-expression-to-match-hostname-or-ip-address
	private String ValidIpAddressRegex = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$";
	private Pattern pattern;
    private Matcher matcher;
	
    private Button aButton;
    
    private MapView  mapView;
    private MainView ref;
    
    private String ipaddress;
    
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ref = this;
        setContentView(R.layout.main);
       
        pattern = Pattern.compile(ValidIpAddressRegex);
        
        mapView = (MapView) findViewById(R.id.mapview);
        mapView.setBuiltInZoomControls(true);
        
        
        
        aButton = (Button) findViewById(R.id.ok);
        aButton.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
               
            	EditText stxt = (EditText) findViewById(R.id.entry);
            	ipaddress = stxt.getText().toString().trim();
            	
            	if(validateIPString(ipaddress)){
            		aButton.setEnabled(false);
            		new GeoIpTranslateTask(ref).execute(ipaddress);
            		
            		
            	}else{
            		Toast toast = Toast.makeText(getApplicationContext(), "Please enter a valid IP address", 30);
            		toast.show();
            	}
            } });       
        
    }
    

    public boolean validateIPString(final String ip){		  
  	  matcher = pattern.matcher(ip);
  	  return matcher.matches();	    	    
      }

	private GeoPoint getPoint(double lat, double lon) {
		//GeoPoint gp = new GeoPoint((int)(lat * 1E6), (int)(lng * 1E6));
		return(new GeoPoint((int)(lat*1000000.0),(int)(lon*1000000.0)));
	}

    

	@Override
	protected boolean isRouteDisplayed() {
		return false;
	}
    
	public void postRequestHandler(String result){
		
		 aButton.setEnabled(true);
		 
		 JSONObject json_obj;
		 
			try{
				
				json_obj = new JSONObject(result);
			
	        String slat=json_obj.getString("latitude");
	        String slong=json_obj.getString("longitude");
	        String countryname=json_obj.getString("country_name");
	        String city=json_obj.getString("city");
	        String region=json_obj.getString("region");
	        
	        double lat = Double.parseDouble(slat);
	        double lon = Double.parseDouble(slong);
	        
	       
	        GeoPoint gp = getPoint(lat,lon);
	        mapView.getController().setZoom(9);
	        mapView.getController().animateTo(gp);
	        
	        List<Overlay> mapOverlays = mapView.getOverlays();
	        Drawable drawable = this.getResources().getDrawable(R.drawable.marker);
	        SitesOverlay itemizedoverlay = new SitesOverlay(drawable,getApplicationContext());
	        
	        OverlayItem overlayitem = new OverlayItem(gp,ipaddress,ipaddress);
	        
	        itemizedoverlay.addOverlay(overlayitem);
	        mapOverlays.add(itemizedoverlay);
	        
	        
	        TextView textView = (TextView) findViewById(R.id.display);
	        textView.setText("Longitude = "+ slat + " \nLongitude = " +slong+" \nCity = " +city+" \nRegion = " +region+" \nCountry = " +countryname);
	        textView.setHorizontalScrollBarEnabled(true);
	        
			Toast toast = Toast.makeText(getApplicationContext(), "Request has completed succesfully", 3);
			toast.show();
	        
			} catch (JSONException e) {
				Toast toast = Toast.makeText(getApplicationContext(),"Unable to process request...please try again", 10);
				toast.show(); 
				
			}
		
	}  
    
}