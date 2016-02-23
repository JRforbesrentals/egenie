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
</head>
<body>

    <nav>
      <div class="nav-secondary">
       <div class="contentwrapper clearfix">
       <a class="mobile-toggle">Value Site</a>
	    <ul class="links-secondary">
	    	<li><a href="#">About</a></li>
	    	<li><a href="#">Why Us?</a></li>
	    	<li><a href="#">Top Deals</a></li>
	    	<li><a href="#">Students</a></li>
	    	<li><a href="#">Mobility</a></li>
	    	<li><a href="#">Check location</a></li>
	    	<li><a href="#">Contact</a></li>
	    	<li><a href="#"><abbr title="Frequently Asked Questions">FAQs</abbr></a></li>
	    </ul>
	    </div>
	   </div>
	   <div class="nav-support">
	    <div class="contentwrapper clearfix">
	     <a href="<%=SITE_ROOT_PATH%>index.asp"><img src="logo.png" class="logo" alt="Value Site"></a>
	     <a class="mobile-toggle">Contact</a>
	     <ul class="links-support">
	    	<li class="search">
	    	  <form class="product-search">
	    	   <!-- <label for "products">Search Products</label> //-->
   
				<!--    	   	
					<label for="search">Search: </label>
					<input id="search">
	    	   	//-->

	    	  	<input type="text" class="search" name="products" id="project">
	    	  </form>
	    	</li>
	    	<li class="alignleft callback"><p><a href="#" class="requestcallback">Request a callback</a></p></li>
	    	<li class="alignleft contact">
	    		<p class="tel">0800 00 00 00</p>
	    	    <p class="advisor">To speak to an advisor</p>
	    	</li>
	      </ul>
	     </div>
	    </div>


	    <div class="nav-products">
	     <div class="contentwrapper clearfix">
	      <ul class="links-products">
	    	<li><a href="#" class="icon-dropdown">HOME LAUNDRY</a>
	    		  <div class="submenu-homelaundry">
	    		   <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">Laundry Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">Laundry Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">Laundry Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=J">Laundry Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>
	    		   </div>	    		     
	    		  </div>
	    	    </li>
	    	<li><a href="#" class="icon-dropdown">DISHWASHERS</a>
	    		  <div class="submenu-dishwashers">
	    		  <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">Dishwashers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">Dishwashers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">Dishwashers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=K">Dishwashers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>
	    		   </div>
	    		 </div>
	    	</li>
	    	<li><a href="#" class="icon-dropdown">FRIDGES</a>
	    		  <div class="submenu-fridges">
	    		   <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=L">Fridges Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=L">Fridges Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=L">Fridges Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=L">Fridges Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>		    				    		  
	    		   </div>
	    		  </div>
	    	</li>
	    	<li><a href="#" class="icon-dropdown">COOKERS</a>
	    		  <div class="submenu-cookers">
	    		   <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZZ">Cookers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZZ">Cookers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZZ">Cookers Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZZ">Cookers ategory</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>
	    		   </div>
	    		  </div>
	    	</li>
	    	<li><a href="#" class="icon-dropdown">TVs</a>
	    		  <div class="submenu-tvs">
	    		   <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=A">TVs Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=B">TVs Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=C">TVs Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=F">TVs Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>
	    		  </div>
	    		</div>
	    	</li>
	    	<li><a href="#" class="icon-dropdown">SCOOTERS</a>	    	   
	    		  <div class="submenu-scooters">
	    		   <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZC">Scooters Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZC">Scooters Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZC">Scooters Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZC">Scooters Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>	
	    		   </div>	
		    	  </div>
	    	</li>
	    	<li><a href="#" class="icon-dropdown">ACCESSORIES</a>
	    		  <div class="submenu-accessories">
	    		   <div class="contentwrapper">
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZE">Other Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZE">Other Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
                    </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZE">Other Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		     </div>
	    		    <div class="menu-column">
	    		      <h2><a href="<%=SITE_ROOT_PATH%>listing.asp?Category=ZE">Other Category</a></h2>
	    		       <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae aliquam massa.</p>
                       <div class="image-category"></div>
	    		    </div>
	    		   </div> 			
	    		  </div>
	    	</li>
	      </ul>
	     </div>	    
	    </div>
    </nav>
    	<div class="lightBoxModal">
   			<span class="close">X</span>
   			<h1>Weekly TV Request Callback</h1>
             <form action="" method="post" name="formCallBack" id="formCallBack">            
               <div class="col-3 col-expanded">                  
                    <label for="Email">Email Address</label>
               </div>
               <div class="col-9 col-expanded">
                    <input name="Email" type="text" id="Email" maxlength="100" />
                </div>
               <div class="col-3 col-expanded">                  
                    <label for="Name">Name</label>
               </div>
               <div class="col-9 col-expanded">
                    <input name="Name" type="text" id="Name" maxlength="100" />
                </div>
               <div class="col-3 col-expanded">                  
                    <label for="Telephone_Number">Telephone Number</label>
               </div>
               <div class="col-9 col-expanded">
                    <input name="Telephone_Number" type="text" id="Telephone_Number" maxlength="40" />
                </div>
               <div class="col-3 col-expanded">                  
                    <label for="CallTime">Preferred Call Time</label>
               </div>
               <div class="col-9 col-expanded">
                    <input name="CallTime" type="text" id="CallTime" maxlength="100" />
                </div>
               <div class="col-3 col-expanded">                  
                    <label for="HowHelp">How Can We Help?</label>
               </div>
               <div class="col-9 col-expanded">
                    <textarea name="HowHelp" type="text" id="HowHelp" rows="4" cols="50" maxlength="400" /></textarea>
                </div>  
               <div class="col-12 formnav-blank">
				<input type="submit" name="Submit" value="Call Me" class="button-submit" />
                <input type="hidden" name="isSubmitted" value="yes" />
			   </div>
             </form>
    	</div>
    <div class="wrapper">
       <a href="#" id="togglemenu" class="icon-menu">Menu</a>
          <div class="headermobile clearfix">
            <a href="<%=SITE_ROOT_PATH%>index.asp"><img src="logo.png" class="logo" alt="Value Site"></a>
      		<p class="tel large"><span class="icon-callus"></span>0800 00 00 00</p>
     	  </div> 