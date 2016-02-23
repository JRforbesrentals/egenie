<!--#include file="includes/config.asp" -->
<%
page_title = "Apply Online"
%>
<!--#include file="includes/header.apply.inc.asp" -->
  <div class="contentwrapper mainbody">
   <div class="row clearfix">
    <div class="col-12">         
     <ul class="progressbar">
		<li class="personal completedstep">Personal<br /> Details</li>
        <li class="address activestep">Address<br /> Details</li>
        <li class="payment notstartedstep">Employment</li>
  </ul>
</div>
</div> 	  
<div class="row clearfix">
   <div class="col-4 col-expanded float-right">
       <!--
      <div class="module-box">
              <%
      If Request.Form("product") <> "" Then
        Response.Write "<p>You're applying to rent a <strong>" & Request.Form("product") & "</strong></p>"          
        Response.Write "<img src=""" & "../../" & Request.Form("productImage") &  """ />" 
      End If
    %>
    </div>
    //-->
    </div>
    
    <div class="col-8 col-expanded float-left"> 
      <div class="module-box clearfix">
	     <h1>Application - Step 4</h1>
	
    
    <%
		if Request.Querystring("FirstYrs") > 3 then 
	%>
  
	<form action="apply5.asp" method="get" name="form1" onSubmit="" >
	  
	  <div class="col-3">
	    <label for="Flat3">Flat</label>
	    <input name="Flat3" type="text" id="Flat3"  value="" size="45" maxlength=13>
	    </div>
	  
	  <div class="col-3">
	    <label for="House3">House Name</label>
	    <input name="House3" type="text" id="House3"  value="" size="45" maxlength=13>
	    </div>
	  
	  <div class="col-3">
	    <label for="HouseNo3">House No</label>
	    <input name="HouseNo3" type="text" id="HouseNo3"  value="" size="45" maxlength=4>
	    </div>
	  
	  <div class="col-3">	
	    <label for="Street3">Address</label>
	    <input name="Street3" type="text" id="Street3"  value="" size="40" maxlength=40>
	    </div>
	  
	  <div class="col-3">
	    <label for="District3">District</label>
	    <input name="District3" type="text" id="District3" size="40" maxlength=40>
	    </div>
	  
	  <div class="col-3">	
	    <label for="Town3">Town</label>
	    <input name="Town3" type="text" id="Town3"  value="" size="40" maxlength=40>
	    </div>
	  
	  <div>
	    <label for="County3">County</label>
	    <input name="County3" type="text" id="County3" size="45" maxlength="100">
	    </div>
	  
	  <div class="col-3">
	    <label for="Postcode3">Postcode</label>
	    <input name="Postcode3" type="text" id="Postcode3" size="45" maxlength="100">
	    </div>
	  
		  <input name="Title" type="hidden" id="Title" value="<%=Request.Querystring("Title") %>">
		  <input name="Forename" type="hidden" id="Forename" value="<%=Request.Querystring("Forename")%>">
		  <input name="MiddleName" type="hidden" id="MiddleName" value="<%=Request.Querystring("MiddleName")%>">
		  <input name="Surname" type="hidden" id="Surname" value="<%=Request.Querystring("Surname")%>">
		  <input name="FormerTitle" type="hidden" id="FormerTitle" value="<%=Request.Querystring("FormerTitle")%>">
		  <input name="FormerForename" type="hidden" id="FormerForename" value="<%=Request.Querystring("FormerForename")%>">
		  <input name="FormerMiddleName" type="hidden" id="FormerMiddleName" value="<%=Request.Querystring("FormerMiddleName")%>">
		  <input name="FormerSurname" type="hidden" id="FormerSurname" value="<%=Request.Querystring("FormerSurname")%>">
		  <input name="DOB1" type="hidden" id="DOB1" value="<%=Request.Querystring("DOB1")%>">
		  <input name="DOB2" type="hidden" id="DOB2" value="<%=Request.Querystring("DOB2")%>">
		  <input name="DOB3" type="hidden" id="DOB3" value="<%=Request.Querystring("DOB3")%>">
		  <input name="Marital" type="hidden" id="Marital" value="<%=Request.Querystring("Marital")%>">
		  <input name="Resident" type="hidden" id="Resident" value="<%=Request.Querystring("Resident")%>">
		  <input name="Phone" type="hidden" id="Phone" value="<%=Request.Querystring("Phone")%>">
		  <input name="email" type="hidden" id="email" value="<%=Request.Querystring("email")%>">
		  <input name="prod" type="hidden" id="prod" value="<%=Request.Querystring("prod")%>">
		  <input name="HomeType" type="hidden" id="HomeType" value="<%=Request.Querystring("HomeType")%>">
		  
		  <input name="Flat" type="hidden" id="Flat"  value="<%=Request.Querystring("Flat")%>">         
		  <input name="House" type="hidden" id="House"  value="<%=Request.Querystring("House")%>">         
		  <input name="HouseNo" type="hidden" id="HouseNo"  value="<%=Request.Querystring("HouseNo")%>">         
		  <input name="Street" type="hidden" id="Street"  value="<%=Request.Querystring("Street")%>">        
		  <input name="District" type="hidden" id="District" value="<%=Request.Querystring("District")%>">
		  <input name="Town" type="hidden" id="Town"  value="<%=Request.Querystring("Town")%>">      
		  <input name="County" type="hidden" id="County" value="<%=Request.Querystring("County")%>">
		  <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
		  <input name="FirstYrs" type="hidden" id="FirstYrs" value="<%=Request.Querystring("FirstYrs")%>">
		  <input name="FirstMths" type="hidden" id="FirstMths" value="<%=Request.Querystring("FirstMths")%>">
		  
		  <input name="Flat2" type="hidden" id="Flat2"  value="<%=Request.Querystring("Flat2")%>">
		  <input name="House2" type="hidden" id="House2"  value="<%=Request.Querystring("House2")%>">
		  <input name="HouseNo2" type="hidden" id="HouseNo2"  value="<%=Request.Querystring("HouseNo2")%>">
		  <input name="Street2" type="hidden" id="Street2"  value="<%=Request.Querystring("Street2")%>">
		  <input name="District2" type="hidden" id="District2" value="<%=Request.Querystring("District2")%>">
		  <input name="Town2" type="hidden" id="Town2"  value="<%=Request.Querystring("Town2")%>">
		  <input name="County2" type="hidden" id="County2" value="<%=Request.Querystring("County2")%>">
		  <input name="Postcode2" type="hidden" id="Postcode2" value="<%=Request.Querystring("Postcode2")%>">
		  <input name="SecYrs" type="hidden" id="SecYrs" value="<%=Request.Querystring("SecYrs")%>">
		  <input name="SecMths" type="hidden" id="SecMths" value="<%=Request.Querystring("SecMths")%>">
		  <input name="Advisor" type="hidden" value= "<%=Request.Querystring("advisor") %>">
		  
		  <input type="reset" name="Submit2" value="Reset">
		  <input type="submit" name="Submit" value="Next">
		  <input type="hidden" name="isSubmitted" value="yes">
	  
	  </form>

	<script>form1.submit()</script>
  
<%
Else

if Request.Querystring("SecYrs") > 3 then 
%>

	<form action="apply5.asp" method="get" name="form1" onSubmit="" >
	  
	  <div class="col-3">
	    <label for="Flat3">Flat</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Flat3" type="text" id="Flat3"  value="" size="45" maxlength=13>
	    </div>
	  
	  <div class="col-3">	
	    <label for="House3">House Name</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="House3" type="text" id="House3"  value="" size="45" maxlength=13>
	    </div>
	  
	  <div class="col-3">	
	    <label for="HouseNo3">House No</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="HouseNo3" type="text" id="HouseNo3"  value="" size="45" maxlength=4>
	    </div>
	  
	  <div class="col-3">
	    <label for="Street3">Address</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Street3" type="text" id="Street3"  value="" size="40" maxlength=40>
	    </div>	
	  
	  <div class="col-3">
	    <label for="District3">District</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="District3" type="text" id="District3" size="40" maxlength=40>
	    </div>	
	  
	  <div class="col-3">
	    <label for="Town3">Town</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Town3" type="text" id="Town3"  value="" size="40" maxlength=40>
	    </div>	
	  
	  <div class="col-3">
	    <label for="County3">County</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="County3" type="text" id="County3" size="45" maxlength="100">
	    </div>	
	  
	  <div class="col-3">
	    <label for="Postcode3">Postcode</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Postcode3" type="text" id="Postcode3" size="45" maxlength="100">
	    </div>	
	  
		  <input name="Title" type="hidden" id="Title" value="<%=Request.Querystring("Title") %>">
		  <input name="Forename" type="hidden" id="Forename" value="<%=Request.Querystring("Forename")%>">
		  <input name="MiddleName" type="hidden" id="MiddleName" value="<%=Request.Querystring("MiddleName")%>">
		  <input name="Surname" type="hidden" id="Surname" value="<%=Request.Querystring("Surname")%>">
		  <input name="FormerTitle" type="hidden" id="FormerTitle" value="<%=Request.Querystring("FormerTitle")%>">
		  <input name="FormerForename" type="hidden" id="FormerForename" value="<%=Request.Querystring("FormerForename")%>">
		  <input name="FormerMiddleName" type="hidden" id="FormerMiddleName" value="<%=Request.Querystring("FormerMiddleName")%>">
		  <input name="FormerSurname" type="hidden" id="FormerSurname" value="<%=Request.Querystring("FormerSurname")%>">
		  <input name="DOB1" type="hidden" id="DOB1" value="<%=Request.Querystring("DOB1")%>">
		  <input name="DOB2" type="hidden" id="DOB2" value="<%=Request.Querystring("DOB2")%>">
		  <input name="DOB3" type="hidden" id="DOB3" value="<%=Request.Querystring("DOB3")%>">
		  <input name="Marital" type="hidden" id="Marital" value="<%=Request.Querystring("Marital")%>">
		  <input name="Resident" type="hidden" id="Resident" value="<%=Request.Querystring("Resident")%>">
		  <input name="Phone" type="hidden" id="Phone" value="<%=Request.Querystring("Phone")%>">
		  <input name="email" type="hidden" id="email" value="<%=Request.Querystring("email")%>">
		  <input name="prod" type="hidden" id="prod" value="<%=Request.Querystring("prod")%>">
		  <input name="HomeType" type="hidden" id="HomeType" value="<%=Request.Querystring("HomeType")%>">
		  
		  <input name="Flat" type="hidden" id="Flat"  value="<%=Request.Querystring("Flat")%>">         
		  <input name="House" type="hidden" id="House"  value="<%=Request.Querystring("House")%>">         
		  <input name="HouseNo" type="hidden" id="HouseNo"  value="<%=Request.Querystring("HouseNo")%>">         
		  <input name="Street" type="hidden" id="Street"  value="<%=Request.Querystring("Street")%>">        
		  <input name="District" type="hidden" id="District" value="<%=Request.Querystring("District")%>">
		  <input name="Town" type="hidden" id="Town"  value="<%=Request.Querystring("Town")%>">      
		  <input name="County" type="hidden" id="County" value="<%=Request.Querystring("County")%>">
		  <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
		  <input name="FirstYrs" type="hidden" id="FirstYrs" value="<%=Request.Querystring("FirstYrs")%>">
		  <input name="FirstMths" type="hidden" id="FirstMths" value="<%=Request.Querystring("FirstMths")%>">
		  
		  <input name="Flat2" type="hidden" id="Flat2"  value="<%=Request.Querystring("Flat2")%>">
		  <input name="House2" type="hidden" id="House2"  value="<%=Request.Querystring("House2")%>">
		  <input name="HouseNo2" type="hidden" id="HouseNo2"  value="<%=Request.Querystring("HouseNo2")%>">
		  <input name="Street2" type="hidden" id="Street2"  value="<%=Request.Querystring("Street2")%>">
		  <input name="District2" type="hidden" id="District2" value="<%=Request.Querystring("District2")%>">
		  <input name="Town2" type="hidden" id="Town2"  value="<%=Request.Querystring("Town2")%>">
		  <input name="County2" type="hidden" id="County2" value="<%=Request.Querystring("County2")%>">
		  <input name="Postcode2" type="hidden" id="Postcode2" value="<%=Request.Querystring("Postcode2")%>">
		  <input name="SecYrs" type="hidden" id="SecYrs" value="<%=Request.Querystring("SecYrs")%>">
		  <input name="SecMths" type="hidden" id="SecMths" value="<%=Request.Querystring("SecMths")%>">
		  
		  <input type="reset" name="Submit2" value="Reset">
		  <input type="submit" name="Submit" value="Next">
		  <input type="hidden" name="isSubmitted" value="yes">
	  
	  </form>

	<script>form1.submit()</script>

<%
Else
%>
  
	<h2>Previous Address Details</h2>
	<p>As you lived at your address for less than 4 years please enter your previous address</p>
      
	<form action="apply5.asp" method="get" name="form1" onSubmit="return ValidateRequiredFields();" >
	  
	  <div class="col-3">
	    <label for="Flat3">Flat</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Flat3" type="text" id="Flat3"  value="" size="45" maxlength=13>
	    </div>
	  
	  <div class="col-3">
	    <label for="House3">House Name</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="House3" type="text" id="House3"  value="" size="45" maxlength=13>
	    </div>	
	  
	  <div class="col-3">
	    <label for="HouseNo3">House No</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="HouseNo3" type="text" id="HouseNo3"  value="" size="45" maxlength=4>
	    </div>	
	  
	  <div class="col-3">
	    <label for="Street3">Address</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Street3" type="text" id="Street3"  value="" size="40" maxlength=40>
	    </div>	
	  
	  <div class="col-3">
	    <label for="District3">District</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="District3" type="text" id="District3" size="40" maxlength=40>
	    </div>	
	  
	  <div class="col-3">	
	    <label for="Town3">Town</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Town3" type="text" id="Town3"  value="" size="40" maxlength=40>
	    </div>
	  
	  <div class="col-3">
	    <label for="County3">County</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="County3" type="text" id="County3" size="45" maxlength="100">
	    </div>	
	  
	  <div class="col-3">
	    <label for="Postcode3">Postcode</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Postcode3" type="text" id="Postcode3" size="45" maxlength="100">
	    </div>
	  <!-- </div> //-->
	  <input name="Title" type="hidden" id="Title" value="<%=Request.Querystring("Title") %>">
	  <input name="Forename" type="hidden" id="Forename" value="<%=Request.Querystring("Forename")%>">
	  <input name="MiddleName" type="hidden" id="MiddleName" value="<%=Request.Querystring("MiddleName")%>">
	  <input name="Surname" type="hidden" id="Surname" value="<%=Request.Querystring("Surname")%>">
	  <input name="FormerTitle" type="hidden" id="FormerTitle" value="<%=Request.Querystring("FormerTitle")%>">
	  <input name="FormerForename" type="hidden" id="FormerForename" value="<%=Request.Querystring("FormerForename")%>">
	  <input name="FormerMiddleName" type="hidden" id="FormerMiddleName" value="<%=Request.Querystring("FormerMiddleName")%>">
	  <input name="FormerSurname" type="hidden" id="FormerSurname" value="<%=Request.Querystring("FormerSurname")%>">
	  <input name="DOB1" type="hidden" id="DOB1" value="<%=Request.Querystring("DOB1")%>">
	  <input name="DOB2" type="hidden" id="DOB2" value="<%=Request.Querystring("DOB2")%>">
	  <input name="DOB3" type="hidden" id="DOB3" value="<%=Request.Querystring("DOB3")%>">
	  <input name="Marital" type="hidden" id="Marital" value="<%=Request.Querystring("Marital")%>">
	  <input name="Resident" type="hidden" id="Resident" value="<%=Request.Querystring("Resident")%>">
	  <input name="Phone" type="hidden" id="Phone" value="<%=Request.Querystring("Phone")%>">
	  <input name="email" type="hidden" id="email" value="<%=Request.Querystring("email")%>">
	  <input name="prod" type="hidden" id="prod" value="<%=Request.Querystring("prod")%>">
	  <input name="HomeType" type="hidden" id="HomeType" value="<%=Request.Querystring("HomeType")%>">
	  
	  <input name="Flat" type="hidden" id="Flat"  value="<%=Request.Querystring("Flat")%>">         
	  <input name="House" type="hidden" id="House"  value="<%=Request.Querystring("House")%>">         
	  <input name="HouseNo" type="hidden" id="HouseNo"  value="<%=Request.Querystring("HouseNo")%>">         
	  <input name="Street" type="hidden" id="Street"  value="<%=Request.Querystring("Street")%>">        
	  <input name="District" type="hidden" id="District" value="<%=Request.Querystring("District")%>">
	  <input name="Town" type="hidden" id="Town"  value="<%=Request.Querystring("Town")%>">      
	  <input name="County" type="hidden" id="County" value="<%=Request.Querystring("County")%>">
	  <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
	  <input name="FirstYrs" type="hidden" id="FirstYrs" value="<%=Request.Querystring("FirstYrs")%>">
	  <input name="FirstMths" type="hidden" id="FirstMths" value="<%=Request.Querystring("FirstMths")%>">
	  
	  <input name="Flat2" type="hidden" id="Flat2"  value="<%=Request.Querystring("Flat2")%>">
	  <input name="House2" type="hidden" id="House2"  value="<%=Request.Querystring("House2")%>">
	  <input name="HouseNo2" type="hidden" id="HouseNo2"  value="<%=Request.Querystring("HouseNo2")%>">
	  <input name="Street2" type="hidden" id="Street2"  value="<%=Request.Querystring("Street2")%>">
	  <input name="District2" type="hidden" id="District2" value="<%=Request.Querystring("District2")%>">
	  <input name="Town2" type="hidden" id="Town2"  value="<%=Request.Querystring("Town2")%>">
	  <input name="County2" type="hidden" id="County2" value="<%=Request.Querystring("County2")%>">
	  <input name="Postcode2" type="hidden" id="Postcode2" value="<%=Request.Querystring("Postcode2")%>">
	  <input name="SecYrs" type="hidden" id="SecYrs" value="<%=Request.Querystring("SecYrs")%>">
	  <input name="SecMths" type="hidden" id="SecMths" value="<%=Request.Querystring("SecMths")%>">
	  
	  <div class="col-12 buttons formnav buttons">
	    <!-- <input type="reset" name="Submit2" value="Reset"> //-->
	    <input type="submit" name="Submit" value="Next"  class="button-next">
	    <input type="hidden" name="isSubmitted" value="yes">
	    </div>
	  </form>
<%
End If
end if
%>
    </div>
   </div>
  </div>
    
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.apply.inc.asp" -->