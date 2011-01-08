package com.ericonjava;

import java.util.ArrayList;
import java.util.List;

import com.google.android.maps.ItemizedOverlay;
import com.google.android.maps.MapView;
import com.google.android.maps.OverlayItem;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.widget.Toast;

public class SitesOverlay extends ItemizedOverlay<OverlayItem> {
private Context mContext;
	
	private List<OverlayItem> items=new ArrayList<OverlayItem>();
	
	public SitesOverlay(Drawable defaultMarker,Context context) {
		super(boundCenterBottom(defaultMarker));
		mContext = context;;

	}

	@Override
	protected OverlayItem createItem(int i) {
		return(items.get(i));
	}
	@Override
	public int size() {
	  return items.size();
	}
	@Override
	public void draw(Canvas canvas, MapView mapView,
										boolean shadow) {
		super.draw(canvas, mapView, shadow);

	}
		
	@Override
	protected boolean onTap(int index) {
	  OverlayItem item = items.get(index);
	  Toast toast = Toast.makeText(mContext,item.getTitle(), 10);
      toast.show(); 
	  return true;
	}



	
	public void addOverlay(OverlayItem overlay) {
		items.add(overlay);
	    populate();
	}
	
}