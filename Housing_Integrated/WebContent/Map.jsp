<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import ="com.housing.Properties" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/style5.css" />
<link rel="stylesheet" type="text/css" href="css/modal.css" />
<link rel="stylesheet" type="text/css" href="css/set1.css" />
    
    <!-- User defined external style sheet -->
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">

    <!-- External Javascript files from the google map API for V3. -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>

    <!-- External Javascript file used for the animation of object motion. -->
    <script type ="text/javascript" src="js/v3_epoly.js"></script>

    <!-- User defined external Javascript file. -->
    <script src="js/myscripts.js"></script>

    <script>
        //Register the function for loading the webpage
    	google.maps.event.addDomListener(window, 'load', initialize);
    </script>
<script src="js/modernizr.custom.63321.js"></script>
<script>function switchImageIdOver(elem, imgPath) {
  elem.src = imgPath;
  }
  function switchImageIdOut(elem, imgPath) {
  elem.src = imgPath;
  } 
</script>

</head>
<header>
	<div>
    <img src="img/Header Icons/logo.jpg" alt "Housing.com" style="display:inline; vertical-align:middle;">
  </div>

</header> 

<body>
<%
 	List<Properties>  result = (List<Properties>) request.getAttribute("listData");
 	String[] markersTitle= new String[100];
 	String[] markersLatLng= new String[100];
 	int i=0;
	for(Properties category : result) {
		markersTitle[i] = category.city+", "+category.location+", "+category.area+" Sq Fts";
        markersLatLng[i] = category.latlng;
        i++;
    }
    %>
    
    
    <div class="left"> 
    <form style="margin-left:20px; padding-top: 13px;" action="#">
        <section class="main clearfix">
            <div class="fleft">
                <select id="cd-dropdown" class="cd-select">
                    <option value="-1" selected>Select City</option>
                    <option value="Bengaluru">Bengaluru</option>
                    <option value="Pune">Pune</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Delhi">Delhi</option>

                </select>
            </div>
        </section>

        <section class="main clearfix">
            <div class="fleft">
                <input class="cd-select" id="cd-dropdown2" value="Enter Locality" onfocus="if(this.value=='Enter Locality') this.value = ''" onblur="if(this.value=='') this.value = 'Enter Locality'" type="text" size="10"/>            
            </div>
        </section>
        <section class="main clearfix">
            <div class="fleft">
                <select id="cd-dropdown0" class="cd-select">
                    <option value="-1" selected>Area</option>
                    <option value="<1000">&lt;1000 Sq.Ft.</option>
                    <option value="1000-1500">1000 Sq.Ft.-1500 Sq.Ft.</option>
                    <option value="1500-2000">1500 Sq.Ft.-2000 Sq.Ft.</option>
                    <option value="2000-2500">2000 Sq.Ft.-2500 Sq.Ft.</option>
                    <option value="2500-3000">2500 Sq.Ft.-3000 Sq.Ft.</option>
                    <option value=">3000">&gt;3000 Sq.Ft.</option>
                </select>
            </div>
        </section> 
        <section class="main clearfix">
            <div class="fleft">
                <select id="cd-dropdown1" class="cd-select">
                    <option value="-1" selected>Price Range</option>
                    <option value="<1000000">&lt;10 lakh</option>
                    <option value="1000000-2500000">10 lakh-25 lakh</option>
                    <option value="2500000-3500000">25 lakh-35 lakh</option>
                    <option value="3500000-5000000">35 lakh-50 lakh</option>
                    <option value="5000000-7000000">50 lakh-70 lakh</option>
                    <option value=">7000000">&gt;70 lakh</option>
                </select>
            </div>
        </section>
        
           <section class="main clearfix">
                    <div class="fleft">
                        <select id="cd-dropdown03" class="cd-select">
                            <option value="-1" selected>Population Density</option>
                            <option value="<1000">&lt;10 per 10 Sq.Ft.</option>
                            <option value="1000-1500">10-15 per 1000 Sq.Ft.</option>
                            <option value="1500-2000">15-20  per 1000 Sq.Ft.</option>
                            <option value="2000-2500">20-25  per 1000 Sq.Ft.</option>
                            <option value="2500-3000">25-30  per 1000 Sq.Ft.</option>
                            <option value=">3000">&gt;30 per Sq.Ft.</option>
                        </select>
                    </div>
                </section> 
        
          <section class="main clearfix">
                    <div class="fleft">
                        <select id="cd-dropdown04" class="cd-select">
                            <option value="-1" selected>Type of Population</option>
                            <option value="<1000">Hindus</option>
                            <option value="1000-1500">Muslims</option>
                            <option value="1500-2000">Christians</option>
                            <option value="2000-2500">Jains</option>
                            <option value="2500-3000">Others</option>
                        </select>
                    </div>
                </section>
        
        
        
        <div class="land_btn_container">
            <input class="land_btn" type="submit" value="Land Details"/>
        </div>
    </form> 
   </div>
    
 <!--  <div id="panel">					<!-- Panel for the from and to adress inputs. -->
      <!--<b>Location: <b>
      <input type="text" name="location" id="loc">

      <div id="waypoints" align="center">		
        <input type="button" name="Search" value="Search" onclick ="Search()">
      </div>	
-->

<!--    </div>-->



    <div id="map-canvas"></div>				<!-- Panel holding map dispaly. --> 

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.dropdown.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript">

        $( function() {
            $( '#cd-dropdown0' ).dropdown( {
               // gutter : 5,
                stack : false,
                slidingIn : 100
            } );
            $( '#cd-dropdown00' ).text( {
                //gutter : 5,
                stack : false,
                slidingIn : 100
            } );
            
            $( '#cd-dropdown' ).dropdown( {
                //gutter : 5,
                stack : false,
                slidingIn : 100
            } );
            
            $( '#cd-dropdown1' ).dropdown( {
                //gutter : 5,
                stack : false,
                slidingIn : 100
            } );
            $( '#cd-dropdown03' ).dropdown( {
               // gutter : 5,
                stack : false,
                slidingIn : 100
            } );
            $( '#cd-dropdown04' ).dropdown( {
               // gutter : 5,
                stack : false,
                slidingIn : 100
            } ); 
        });

    </script>
</body>
</html>