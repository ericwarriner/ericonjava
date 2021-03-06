package com.ericonjava;

import java.io.InputStream;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;


import android.os.AsyncTask;
import android.util.Log;



public class GeoIpTranslateTask extends AsyncTask<String, Void, String> {
	
	private Caller caller;
	
	public GeoIpTranslateTask(Caller caller){
		
		this.caller = caller;
	}
	
    protected String doInBackground(String... ip) {

        return callGeoIpTranslationService(ip[0]);
    }



    protected void onPostExecute(String result) {
     
   	 caller.postRequestHandler(result);
 	 
    }
    
    
    private String callGeoIpTranslationService(String ip){
    	String return_str = "";
    
    	try{ 
            HttpClient hc = new DefaultHttpClient();
            HttpGet get = new HttpGet("SERVICE"+ip);
            HttpConnectionParams.setConnectionTimeout(hc.getParams(), 15000);
            HttpResponse rp = hc.execute(get);
            
            if(rp.getStatusLine().getStatusCode() == HttpStatus.SC_OK){ 
                InputStream is = rp.getEntity().getContent();           
                byte[] readBytes =new byte[512]; 
                is.read(readBytes);                
                
                return_str = new String(readBytes);              
                
                //Log.v("MYTAG", "response string="+return_str);
                   
            }
            else{
            	return_str = "ERROR- The request failed with status code"+ rp.getStatusLine().getStatusCode();
            }
        }catch(Exception e){
        	return_str = "ERROR- The request to the GEO-IP server failed. Please ensure that a data connection is availible";
            return return_str;
        }
        
        return return_str;
    }
	
}