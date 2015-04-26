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


<div class="left"> 
    <form style="margin-left:20px; padding-top: 13px;" action="Data">
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
                <input class="cd-select" id="cd-dropdown2" value="Enter Locality" onfocus="if(this.value=='Enter Locality') this.value = ''" onblur="if(this.value=='') this.value = 'Enter Locality'" type="text" size="10" name="Location"/>            
            </div>
        </section>
        <section class="main clearfix">
            <div class="fleft">
                <select id="cd-dropdown0" class="cd-select" name="Area">
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
                <select id="cd-dropdown1" class="cd-select" name="Price">
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
        
        <p style="height:20px"></p>
        
        <div class="search_btn_container">
            <input class="search_btn" type="submit" value="Search"/>
            <input class="adv_search_btn" type="submit" value="Advanced Search"/>
        </div>
   <section class="land_tiles">
        <h3>Lands Near You</h3>
        <hr/>
        <div class="tile">
          <div class="tile_content">
            <p id="land_amount" class="pull_left">
              <img src="images/icons/rupee.png" alt="">
              12 Cr
            </p>
            <p id="land_area" class="pull_right">2500 sq. ft.</p>
            <p id="land_address" class="pull_left">Address: 5<sup>th</sup> A Block, 4<sup>th</sup> Cross, Koramangala, Bengaluru, Karnataka</p>
          </div>
          <img class="land_image" src="images/lands/01.jpg" alt="" data-caption="Hello this is something to look for!">
        </div>    
    </section>

    <div class="modal" id="modal">
        <div class="modal-content">
            <h3>Advance Search<a href="" id="close-modal" class="pull_right">X</a></h3>
            <hr/>
            
            <div>
                <section class="main clearfix">
                    <div class="fleft">
                        <select id="cd-dropdown03" class="cd-select">
                            <option value="-1" selected>Population Density</option>
                            <option value="<10">&lt;10 per 1000 Sq.Ft.</option>
                            <option value="10-15">10-15 per 1000 Sq.Ft.</option>
                            <option value="15-20">15-20  per 1000 Sq.Ft.</option>
                            <option value="20-25">20-25  per 1000 Sq.Ft.</option>
                            <option value="25-30">25-30  per 1000 Sq.Ft.</option>
                            <option value=">30">&gt;30 per Sq.Ft.</option>
                        </select>
                    </div>
                </section> 
                <section class="main clearfix">
                    <div class="fleft">
                        <select id="cd-dropdown04" class="cd-select">
                            <option value="-1" selected>Type of Population</option>
                            <option value="Hindus">Hindus</option>
                            <option value="Muslims">Muslims</option>
                            <option value="Christians">Christians</option>
                            <option value="Jains">Jains</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                </section>
                
            </div>
        </div>
             <div class="search_btn_container">
            <input class="search_btn pull_left" type="submit" value="Search" style="position: relative; left:35%; width:35%"/>
            
        </div>
        </form>
        
    </div>

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