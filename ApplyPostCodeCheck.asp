 <%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/connGazza.asp" -->
<%
Posty =  Request.Form("Pcode")
TC = Request.Form("AgreeTC")
Length = len(Posty)
ADV = Request.Form("advisor")





PROD = Request.Form("product")
PRICE = Request.Form("rprice")
IMG = Request.Form("productImage")






result = False
%>
<%
do until (Length = 0)
NewStr = Left(Posty,Length)
Dim rsGazza__varPcode
rsGazza__varPcode = "AB11"
If Posty <> "" Then 
  rsGazza__varPcode = NewStr
End If
%>
<%
Dim rsGazza
Dim rsGazza_numRows
Set rsGazza = Server.CreateObject("ADODB.Recordset")
rsGazza.ActiveConnection = MM_connGazza_STRING
rsGazza.Source = "SELECT *  FROM gazetteer  WHERE code = '" + Replace(rsGazza__varPcode, "'", "''") + "'"
rsGazza.CursorType = 0
rsGazza.CursorLocation = 2
rsGazza.LockType = 1
rsGazza.Open()

rsGazza_numRows = 0
%><!doctype html>
 <html lang="en">
 <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Forbes Rentals | Home</title>
       <link rel="stylesheet" type="text/css" href="styles/main.css">
      <!--[if lt IE 9]>
     	<link rel="stylesheet" type="text/css" href="styles/ie.css">
        <![endif]-->
 <%

	If rsGazza.EOF then
		Length=Length-1
	Else
 
	Exit Do
%>
 <link rel="stylesheet" type="text/css" href="styles/main.css">
   <!--[if IE ]>
   		<link rel="stylesheet" type="text/css" href="/styles/ie.css">  
   <![endif]-->
  <!--[if IE 9]>
   	<link rel="stylesheet" type="text/css" href="/styles/ie9.css"> 
   <![endif]-->
   <!--[if lt IE 9]>
     	<link rel="stylesheet" type="text/css" href="/styles/ie8less.css">  
        <script src="/scripts/ie8less.js"></script>      
    <![endif]-->
 <%
End If
rsGazza.Close()
Set rsGazza = Nothing
loop
%>
 <!--#include file="includes/analytics.inc.asp" -->
 </head>
 <body>
  <div class="headermain">
   <div class="contentwrapper">
   <div class="row clearfix">
     <div class="col-6">
        <a href="index.asp"><img src="images/forbes-rentals-logo.png" class="forbeslogo" alt="Forbes Rentals" /></a>
      </div>
      <div class="col-6">
        <p class="tel">0800 00 63 00</p>
      </div>
     </div><!-- row //-->
    </div>
  </div> <!-- headermain //-->
   <nav>
    <a href="index.asp"><img src="images/forbes-logo-blue.png" alt="Forbes Rentals" class="mobile-logo" /></a>
	<ul id="menu">
    		<li><a href="index.asp" class="icon-home"><span>Home</span></a></li>
            <li><a href="index.asp" class="dropdown icon-dropdown">Home</a>
              <div class="submenu">
                <ul class="ddleft">
                      <li><a href="Adverse_Weather.asp">Adverse Weather</a></li>
                      <li><a href="aerials.asp">Aerial and Satellite</a></li>
                      <li><a href="coverage.asp">Check Service Area</a></li>
                      <li><a href="Choose-the-correct-size-TV.asp">Choose Correct TV Size</a></li>
                      <li><a href="support.asp">Customer Information</a></li>
                      <li><a href="hints-and-tips.asp">Hints and Tips</a></li>
                      <li><a href="AugustBH.asp">Holiday Opening</a></li>
                </ul>
                 <ul class="ddright">
                      <li><a href="Industry_News.asp">Industry News</a></li>
                      <li><a href="Media.asp">Media</a></li>
                      <li><a href="quality-refurbished.asp">Quality Refurbished Rental</a></li>
                      <li><a href="Recruitment.asp">Recruitment</a></li>
                      <li><a href="showroom.asp">See our Showroom</a></li>
                      <li><a href="service.asp">Repairs and Service</a></li> 
                 </ul>
              </div>
            </li>
            <li><a href="why-rent.asp" class="toplevel">Why Rent?</a></li>
            <li><a href="Samsung-4KTV.asp" class="toplevel">Ultra HD 4K</a></li>
            <li><a href="#" class="dropdown icon-dropdown">Products</a>
              <div class="submenu products">
                <ul class="ddleft">
                      <li><a href="listing.asp?Category=A">Plasma</a></li>
                      <li><a href="listing.asp?Category=B">LCD</a></li>
                      <li><a href="listing.asp?Category=C">LED</a></li>
                      <li><a href="listing.asp?Category=F">DVD</a></li>
                      <li><a href="listing.asp?Category=I">Home Cinema</a></li>
                      <li><a href="listing.asp?Category=J">Home Laundry</a></li>
                      <li><a href="listing.asp?Category=K">Dishwashers</a></li>
                      <li><a href="listing.asp?Category=L">Refrigeration</a></li>
                      <li><a href="listing.asp?Category=N">Freeview</a></li>
                </ul>
                 <ul class="ddright">
                      <li><a href="listing.asp?Category=ZA">Stands</a></li>
                      <li><a href="listing.asp?Category=ZZ">Cookers</a></li>
                      <li><a href="listing.asp?Category=ZC">Scooters</a>
                      <li><a href="listing.asp?Category=ZD">Other Appliances</a></li>
                      <li><a href="listing.asp?Category=ZE">Accessories</a></li>
                      <li><a href="mobility-accessories.asp">Scooter Accessories</a></li>
                      <li><a href="listing.asp?Make=Value">Value Range</a></li>
                      <li><a href="listing.asp?Make=Student">Student Rentals</a></li>
                 </ul>
              </div>
      </li>
             <li><a href="mobility.asp" class="dropdown icon-dropdown">Mobility</a>
              <div class="submenu mobility ddsingle">
                <ul>
                	<li><a href="listing.asp?Category=ZC">Scooters</a>
                    <li><a href="why-rent-scooter.asp">Why rent a Scooter</a></li>
                    <li><a href="mobility-q-a.asp">Mobility Q and A</a></li>
                    <li><a href="mobility-accessories.asp">Scooter Accessories</a></li>
                </ul>
              </div>
            </li>
            <li><a href="apply.asp" class="toplevel">Apply Now</a></li>
            <li><a href="contact.asp" class="dropdown icon-dropdown">Contact</a>
            <div class="submenu contact ddsingle">
                <ul>
                 <li><a href="Recommend-a-friend.asp">&pound;200 of Cash Rewards</a></li>
                 <li><a href="showroom.asp">See our Showroom</a></li>
                </ul>
              </div>
            </li>
            <li><a href="http://www.forbes-professional.co.uk/index.asp" class="dropdown icon-dropdown">Forbes Business Solutions</a>
              <div class="submenu professional ddsingle">
               <ul>
                   <li><a href="http://www.forbes-professional.co.uk/B2B/TelevisionandAV.asp">Television and AV</a></li>
                   <li><a href="http://www.forbes-professional.co.uk/B2B/DigitalSignage.asp">Digital Signage</a></li>
                   <li><a href="http://www.forbes-professional.co.uk/laundry/index.asp">Laundry &amp; Dishwashing</a></li>
                   <li><a href="http://www.forbes-professional.co.uk/B2B/indexB2B.asp">Business to Business</a></li>
               </ul>
             </div>
            </li>
     </ul>
		<div class="clearfix"></div>
  </nav>
  <div class="wrapper">
  	<a href="#" id="togglemenu" class="icon-menu">Menu</a>
       	  <div class="headermobile clearfix">
            <a href="index.asp"><img src="images/forbes-rentals-logo.png" class="forbeslogo" alt="Forbes Rentals" /></a>
      		<p class="tel large">0800 00 63 00</p>
     	  </div>
  <div class="contentwrapper">
<div class="row clearfix">
       <div class="module clearfix">
         <div class="col-12">
  		

                <% If Length <> 0 then %>
                <%
                Response.write(Posty)
                Response.write(TC)
                Response.write(ADV)



                Response.write(PROD)
                Response.write(PRICE)
                Response.write(IMG)


                
                
                 If (rsGazza.Fields.Item("cango")) = "True" then %>
                <form name="form1" method="post" action="secureOLA/apply1.asp" onSubmit="javascript:pageTracker._linkByPost(this)">
                      <input name="PostCodeSubmitted" type="hidden" value= "<%=Request.Form("Pcode") %>" >      
                      <input name="AgreedTC" type="hidden" value= "<%=Request.Form("AgreeTC") %>">
                      <input name="Advisor" type="hidden" value= "<%=Request.Form("Advisor") %>">

                      <input type="hidden" name="product" value="<%=Request.Form("product")%>" />
                      <input type="hidden" name="rprice" value="<%=Request.Form("rprice") %>" />
                      <input type="hidden" name="productImage" value="<%=Request.Form("productImage")%>" />

                      
                </form>
                <script>form1.submit()</script>
                <% Else %>
                <%= Response.Redirect("AreaNotCovered.asp") %>
                <% End If %>
                <% Else %>
                <%= Response.Redirect("PostcodeUnrecognised.asp") %>
                <% End If %>







         </div>         
       </div>
    </div>
    </div> 
  <!-- contentwrapper //-->
<footer>
     <div class="contentwrapper">
       <div class="row cleafix">
        <div class="col-12">
          <h1>Help &amp; Support</h1>
        </div>
       </div>
       <div class="row cleafix">
        <ul class="support col-4">
          <li><a href="contact.asp#callback">Book a Callback</a></li>
          <li><a href="contact.asp#sales">Sales &amp; Advice</a></li>
        </ul>
        <ul class="support col-4">
          <li><a href="contact.asp#service">Service &amp; Customer Care</a></li>
          <li><a href="contact.asp#payments">Payments &amp; Accounts</a></li>
        </ul>
        <ul class="support col-4">
          <li><a href="#">Apply Online</a></li>
          <li><a href="contact.asp#postal">Postal Address</a></li>
         </ul><div class="clearfix"></div>
       </div>
   		<div class="row clearfix socialmodule">   
       <div class="col-4">
            <img src="images/forbes-logo-grey.png" alt="Forbes Rentals logo" class="forbes-logo" />
       </div>
       <div class="col-4">
         <p class="familyrun">Family Run Since 1926</p>
         <ul class="social">
           <li><a href="https://twitter.com/forbesrentals" class="twitter">Twitter</a></li>
           <li><a href="https://www.facebook.com/pages/Forbes-Rentals/119930192256" class="facebook">Facebook</a></li>
           <li><a href="https://www.youtube.com/user/ForbesRentals" class="youtube">Youtube</a></li>
           <li><a href="http://forbes-rentals.tumblr.com/" class="tumblr">Tumblr</a></li>
         </ul>
        </div>
        <div class="col-4">
          <img src="images/forbes-85years-grey.png" alt="Forbes 85 Years Service" class="forbes85" />
        </div>
      </div>
      <div class="row clearfix">
        <div class="col-12">
          <ul class="logos clearfix">
            <li class="samsung">Samsung</li>
            <li class="toshiba">Toshiba</li>
            <li class="philips">Philips</li>
            <li class="linsar">Linsar</li>
            <li class="panasonic">Panasonic</li>
            <li class="bosch">Bosch</li>
            <li class="humax">Humax</li>
            <li class="shoprider">Shoprider</li>
     	  </ul>
        </div>
       </div>      
   	   <div class="row clearfix">
        <div class="col-12">
         <ul class="seo">
          <li><a href="cooker-rental.asp">Cooker Rental</a></li>
          <li><a href="dishwasher-rental.asp">Dishwasher Rental</a></li>
          <li><a href="dryer-rental.asp">Tumble Dryer Rental</a></li>
          <li><a href="washer-dryer-rental.asp">Washer Dryer Rental</a></li>
          <li><a href="washing-machine-rental.asp">Washing Machine Rental</a></li>
          <li><a href="LCD-Television-Rental.asp">LCD Television Rental</a></li>
          <li><a href="LED-Television-Rental.asp">LED Television Rental</a></li>
          <li><a href="Plasma-Television-Rental.asp">Plasma Television Rental</a></li>
          <li><a href="freeview-hd-box-rental.asp">Freeview HD box Rental</a></li>
          <li><a href="smart-tv-rental.asp">Smart TV Rental</a></li>
          <li><a href="Blu-Ray-and-DVD-rental.asp">Blu-Ray and DVD</a></li>
          <li><a href="freezer-rental.asp">Freezer Rental</a></li>
          <li><a href="fridge-rental.asp">Fridge Rental</a></li>
          <li><a href="fridge-freezer-rental.asp">Fridge Freezer Rental</a></li>
          <li><a href="student.asp">Student Rental</a></li>
          <li><a href="ebay.asp">eBay</a></li>
       </ul>
      </div>
     </div>
   	 <div class="row clearfix">
       <div class="col-12">    
        <p class="small">Copyright &copy; 2015 F Donald Forbes &amp; Co Ltd T/A Forbes Rentals, 7 Wells Place, Redhill, Surrey. RH 1 3DR. Registered England 687172</p>
    	<p class="small">Forbes Rentals is authorised and regulated by the Financial Conduct Authority. It is a member of the Consumer Credit Trade Association and abides by its Code of Practice</p>   
       </div>
     </div>        
	</div> <!-- contenwrapper //-->
 </footer>
</div> <!-- wrapper //-->  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 <script src="scripts/forbes.js"></script>
   <!--[if IE 9]>
    	<script src="/responsive/scripts/ie9.js"></script>
    <![endif]-->
 </body>
</html>       
