 /*==========================================================================================================================================================
 * 
 *	Javascript file for simple Directions service
 *
 ==========================================================================================================================================================*/

//===========================================================================================================================================================

//variables for display a basic map
var map;
var mapOptions;

var loc;
var geocoder;
var markersTitle = [];
var markersLatLng = [];
var markers = [];
var MapCanvas;
var latlngbounds;
//===========================================================================================================================================================

function initialize() 
{
  var rendererOptions = {							//Direction render options.
    draggable: true
  }; 		
  mapOptions = {								//Map boject options.
    zoom:5,
    center: new google.maps.LatLng(20, 76)
  };
  MapCanvas = document.getElementById('map-canvas');				//Dom element of map canvas
  map = new google.maps.Map(MapCanvas, mapOptions);				//map object
  var markersLatLng = new google.maps.LatLng(20, 76);
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
var marker = new google.maps.Marker({
    position: myLatlng,
    title:"Hello World!"
});
  
//alert(1);
cleanup();
//alert(2);									//call to initalise the map
           place();
}

//===========================================================================================================================================================

function Search() 
{
  loc = document.getElementById('loc').value;				//value of the textbox having starting point address of the route
  var address = loc;							//address to be 
   geocoder = new google.maps.Geocoder();					//Geocoder object
   geocoder.geocode( { 'address': address }, function(results, status) 		//perform GeoCoding	
   {
      if (status == google.maps.GeocoderStatus.OK) 
	  {				//check if the results for geocoding are present
        cleanup();								//clean the map if there are previous objects present on it
	//if(routes.length > 0)
	    for (var i = 0, len = results.length; i < len; i++)
	    {			//for all the geocoding results do
           markersTitle[i] = results[i].formatted_address;
           markersLatLng[i] = results[i].geometry.location;
        } 
           place();
      } 
      else {									//No results
	alert("unsuccessful for the following reason: " + status);
      }
   });
}


//===========================================================================================================================================================

function place() 
{
//alert(4);
    for (var i = 0, len = "<%=markersTitle%>".length; i < len; i++)
	{		

	   
	     var ltlg = "<%=markersLatLng[i]%>";
		 var res = ltlg.split(",");
		 markersLatLng[i] = new google.maps.LatLng(parseFloat(res[0]), parseFloat(res[1]));
     	//for all the geocoding results do
	   latlngbounds.extend(markersLatLng[i]);			//include the point to the bounds of the map display
           var marker = new google.maps.Marker({				//create the marker
              map: map, 	
              position: markersLatLng[i],
	          title: 	 "<%=markersTitle[i]%>"
           }); 
        markers[i] =marker;
        google.maps.event.addListener(marker, 'click', function() {
            alert(marker.getPosition());
        });
    }
	map.setCenter(latlngbounds.getCenter());				//set the map display properties
	map.fitBounds(latlngbounds);
}
//===========================================================================================================================================================

function cleanup() 
{
	for (var i = 0; i < markers.length; i++) 				//for all the markers present on map
           markers[i].setMap(null);						//take the marker out of map
	markers = [];
           markersTitle=[];
           markersLatLng=[];
        latlngbounds = new google.maps.LatLngBounds();				//reset the bounds of map display
}

