<%
Dim NavCategoriesRS
Dim NavCategoriesRS_cmd
Dim NavCategoriesRS_numRows

Set NavCategoriesRS_cmd = Server.CreateObject ("ADODB.Command")
NavCategoriesRS_cmd.ActiveConnection = MM_rsMain_STRING
NavCategoriesRS_cmd.CommandText = "SELECT * FROM Categories WHERE include Like '-1'" 
NavCategoriesRS_cmd.Prepared = true

Set NavCategoriesRS = NavCategoriesRS_cmd.Execute
NavCategoriesRS_numRows = 0

Dim Repeat_Cat__numRows
Dim Repeat_Cat__index

Repeat_Cat__numRows = -1
Repeat_Cat__index = 0
NavCategoriesRS_numRows = NavCategoriesRS_numRows + Repeat_Cat__numRows

Dim rsMain__varCat2
rsMain__varCat2 = "%"
If (Request.QueryString("Category") <> "") Then 
  rsMain__varCat2 = Request.QueryString("Category")
End If

Dim NavSuppliersRS
Dim NavSuppliersRS_cmd
Dim NavSuppliersRS_numRows

Set NavSuppliersRS_cmd = Server.CreateObject ("ADODB.Command")
NavSuppliersRS_cmd.ActiveConnection = MM_rsMain_STRING
NavSuppliersRS_cmd.CommandText = "SELECT DISTINCT S.Supplier FROM Suppliers S, NewProducts P, Categories C WHERE P.Supplier = S.SupplierID AND P.Category = C.CategoryID AND S.include Like '-1'AND C.CategoryID LIKE'" + Replace(rsMain__varCat2, "'", "''") + "' " 
NavSuppliersRS_cmd.Prepared = true

Set NavSuppliersRS = NavSuppliersRS_cmd.Execute
NavSuppliersRS_numRows = 0

Dim Repeat_sup__numRows
Dim Repeat_sup__index

Repeat_sup__numRows = -1
Repeat_sup__index = 0
NavSuppliersRS_numRows = NavSuppliersRS_numRows + Repeat_sup__numRows
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><%=page_title%> | <%=COMPANY_NAME%></title>
<%
If len(page_keywords)>0 Then
	Response.Write(vbTab & "<meta name=""Keywords"" content=""" & page_keywords & """ />" & vbCrLf)
End If
If Len(page_description)>0 Then
	Response.Write(vbTab & "<meta name=""Description"" content=""" & page_description & """ />" & vbCrLf)
End If
%>
    <meta name="viewport" content="width-device-width=1,initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="scripts/jquery-ui.js"></script>
    <script src="scripts/newproducts.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=SITE_ROOT_PATH%>styles/main.css">
    <link rel="shortcut icon" href="favicon.ico">
    <!--#include file ="analytics.inc.asp" -->
</head>
<body>
    <nav>
      <div class="nav-secondary">
       <div class="contentwrapper clearfix">
        <a class="mobile-toggle icon-dropdown-closed"><span class="icon-category-egenie"></span>Egenie</a>
	      <ul class="links-secondary submenu-secondary">
	    	<li><a href="<%=SITE_ROOT_PATH%>index.asp" class="icon-home"><span>Home</span></a></li>
            <li><a href="<%=SITE_ROOT_PATH%>pay-weekly.asp">Pay Weekly</a></li>
	    	<li><a href="<%=SITE_ROOT_PATH%>faqs.asp">FAQs</a></li>
	    	<li><a href="<%=SITE_ROOT_PATH%>about.asp">About</a></li>
	    	<li><a href="<%=SITE_ROOT_PATH%>contact.asp">Contact</a></li>
	      </ul>
	    </div>
	 </div>
	 <div class="nav-support">
	    <div class="contentwrapper clearfix">
	     <a href="<%=SITE_ROOT_PATH%>index.asp" class="logo"></a>
         <p class="strapline">Your Pay Weekly Electrical Store</p>
	     <a class="mobile-toggle icon-dropdown-closed"><span class="icon-category-contactegenie"></span>Contact</a>
	     <ul class="links-support submenu-support">
	    	<li class="search">
	    	</li>
	    	<li class="alignleft callback icon-callback"><p><a href="call.asp" class="requestcallback">Callback Request</a></p></li>
	    	<li class="alignleft contact icon-contact">
	    		<p class="tel"><a href="tel:03450702337">0345 0702337</a></p>
	    	    <p class="advisor">To speak to an advisor</p>
	    	</li>
	      </ul>
	     </div>
	  </div>
	  <div class="nav-products">
	     <div class="contentwrapper clearfix">
	      <ul class="links-products">
	    	<li><a href="#" class="icon-dropdown-closed dd-televisions mobile-toggle"><span class="icon-category-entertainment"></span>TV &amp; Entertainment</a>
	    		  <div class="submenu-tvs links-">
	    		    <div class="contentwrapper">
	    		     <div class="menu-column">
	    		      <h2><span class="icon-subcategory-televisions"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=A">Televisions</a></h2>
                       	  <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=A">
                       	    <img src="images/pi-plasma.png" class="image-product" />
                       	  </a>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><span class="icon-subcategory-blueray"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=F">Blu-Ray</a></h2>
	    		        <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=F">
	    		         <img src="images/pi-blueray.png" class="image-product" />
	    		        </a>                       
	    		    </div>
	    		    <div class="menu-column">
	    		      <h2><span class="icon-subcategory-homecinema"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=I">Home Cinema</a></h2>
	    		        <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=F">
	    		         <img src="images/pi-homecinema.png" class="image-product" />
	    		        </a>                       
	    		    </div>
	    		  </div>
	    		</div>
	    	</li>
    	    <li><a href="#" class="icon-dropdown-closed dd-appliances mobile-toggle"><span class="icon-category-laundry"></span>Laundry</a>
	    		  <div class="submenu-homelaundry links-">
	    		   <div class="contentwrapper">
					 <div class="menu-column">
	    		      <h2><span class="icon-subcategory-washingmachines"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">Washing Machines</a></h2>       
	    		       	 <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">
	    		          <img src="images/pi-washingmachine.png" class="image-product" />
	    		        </a>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><span class="icon-subcategory-tumbledryers"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=D">Tumble Dryers</a></h2>
	    		       <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">
	    		        <img src="images/pi-tumbledryer.png" class="image-product" />
                       </a>
	    		     </div>
	    		  </div>
	    		</div>
	    	</li>
    	    <li><a href="#" class="icon-dropdown-closed dd-appliances mobile-toggle"><span class="icon-category-refrigeration"></span>Refrigeration</a>
	    		  <div class="submenu-homelaundry links-">
	    		   <div class="contentwrapper">
					 <div class="menu-column">
	    		      <h2><span class="icon-subcategory-fridgefreezers"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=L">Refrigeration</a></h2>    		       
	    		       	 <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">
	    		          <img src="images/pi-refrigeration.png" class="image-product" />
	    		        </a>
	    		     </div>
	    		  </div>
	    		</div>
	    	</li>
    	<li><a href="#" class="icon-dropdown-closed dd-appliances mobile-toggle"><span class="icon-category-dishwasher"></span>Dishwashers</a>
	    		  <div class="submenu-homelaundry links-">
	    		   <div class="contentwrapper">
					 <div class="menu-column">
	    		      <h2><span class="icon-subcategory-dishwashers"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">Dishwashers</a></h2>
	    		       	 <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">
	    		          <img src="images/pi-dishwasher.png" class="image-product" />
	    		        </a>
	    		     </div>
	    		  </div>
	    		</div>
	    	</li>
    	<li><a href="#" class="icon-dropdown-closed dd-appliances mobile-toggle"><span class="icon-category-cookersvacuum"></span>Cookers &amp; Vacuum</a>
	    		  <div class="submenu-homelaundry links-">
	    		   <div class="contentwrapper">
					 <div class="menu-column">
	    		      <h2><span class="icon-subcategory-cookers"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZZ">Cookers</a></h2>
	    		       	 <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">
	    		          <img src="images/pi-cooker.png" class="image-product" />
	    		        </a>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><span class="icon-subcategory-microwaves"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZZ">Microwaves</a></h2>
	    		       <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">
	    		        <img src="images/pi-microwave.png" class="image-product" />
                       </a>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><span class="icon-subcategory-vacuums"></span><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=M">Vacuums</a></h2>
	    		       <a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">
	    		        <img src="images/pi-vacuum.png" class="image-product" />
                       </a>
	    		     </div>
	    		  </div>
	    		</div>
	    	</li>
	      </ul>
	     </div>	    
	    </div>
    </nav>
    <!--  include file="lightbox.callback.inc.asp //-->

    <div class="wrapper">
       <a href="#" id="togglemenu" class="icon-menu">Menu</a>
          <div class="headermobile clearfix">
            <!-- <a href="<%=SITE_ROOT_PATH%>index.asp"><img src="logo.png" class="logo" alt="Value Site"></a> //-->
            <a href="<%=SITE_ROOT_PATH%>index.asp" class="logo"></a>
            <!-- <p class="tel large"><span class="icon-callus"></span><a href="tel:03450702337">0345 0702337</a></p>  //-->
           </div>
           
           
          