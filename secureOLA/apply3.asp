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
       <hgroup class="form">
         <h1>Application - Step 3</h1>
         <h2>Previous Address Details</h2>
       </hgroup>
		
		<%
			if Request.Querystring("FirstYrs") > 3 then 
		%>
	<form action="apply4.asp" method="get" name="form1" onSubmit="" >
	  <div class="col-3 col-expanded">
	    <label for="Flat2">Flat</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Flat2" type="text" id="Flat2"  value="" size="45" maxlength=13>
	    </div>	
	  
	  <div class="col-3 col-expanded">
	    <label for="House2">House Name</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="House2" type="text" id="House2"  value="" size="45" maxlength=13>
	    </div>	
	  <div class="col-3 col-expanded">
	    <label for="HouseNo2">House No</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="HouseNo2" type="text" id="HouseNo2"  value="" size="45" maxlength=4>
	    </div>
	  <div class="col-3 col-expanded">
	    <label for="Street2">Address</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="Street2" type="text" id="Street2"  value="" size="40" maxlength=40>
	    </div>
	  <div class="col-3 col-expanded">
	    <label for="District2">District</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="District2" type="text" id="District2" size="40" maxlength=40>
	    </div>
	  <div class="col-3 col-expanded">
	    <label for="Town2">Town</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="Town2" type="text" id="Town2"  value="" size="40" maxlength=40>
	    </div>
	  <div class="col-3 col-expanded">
	    <label for="County2">County</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="County2" type="text" id="County2" size="45" maxlength="100">
	    </div>
	  <div class="col-3 col-expanded">
	    <label for="Postcode2">Postcode</label>
	    </div>	
	  <div class="col-9 col-expanded">	
	    <input name="Postcode2" type="text" id="Postcode2" size="45" maxlength="100">
	    </div>
	  <div class="col-12">
	    <h4 class="prompt"><label for="Sec">How long had you lived at this address</label></h4>
	    </div>
	  <div class="col-3">
	    <label for="Sec">Years</label>
	    </div>
	  <div class="col-3">
	    <input name="SecYrs" type="text" id="SecYrs" size="5" maxlength="2">
	    </div>
	  <div class="col-3">
	    <label for="SecMths">Months</label>
	    </div>
	  <div class="col-3">
	    <input name="SecMths" type="text" id="SecMths" size="5" maxlength="2">
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
			  <input name="District" type="hidden" id="District"  value="<%=Request.Querystring("District")%>">      
			  <input name="Town" type="hidden" id="Town"  value="<%=Request.Querystring("Town")%>">      
			  <input name="County" type="hidden" id="County" value="<%=Request.Querystring("County")%>">
			  <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
			  <input name="FirstYrs" type="hidden" id="FirstYrs" value="<%=Request.Querystring("FirstYrs")%>">
			  <input name="FirstMths" type="hidden" id="FirstMths" value="<%=Request.Querystring("FirstMths")%>"> 
			  <input name="Advisor" type="hidden" value= "<%=Request.Querystring("advisor") %>">
			  <div class="col-12 formnav buttons">
	    <input type="submit" name="Submit" value="Next" class="button-next">
	    <input type="hidden" name="isSubmitted" value="yes">
	    </div>	
	  
	  </form>
	
	<script>form1.submit()</script>
	
<%
Else
%>
	<p>As you lived at your address for less than 4 years please enter your previous address </p>
    <p><strong>Fields marked with <span>*</span> are mandatory</strong></p> 
      
	<form action="apply4.asp" method="get" name="form1" onSubmit="return ValidateRequiredFields();" >
	  
	  <div class="col-3">
	    <label for="Flat2">Flat</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Flat2" type="text" id="Flat2"  value="" size="45" maxlength=13>
	    </div>
	  <div class="col-3">
	    <label for="House2">House Name</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="House2" type="text" id="House2"  value="" size="45" maxlength=13>
	    </div>
	  <div class="col-3">
	    <label for="HouseNo2">House No</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="HouseNo2" type="text" id="HouseNo2"  value="" size="45" maxlength=4>
	    </div>
	  <div class="col-3">
	    <label for="Street2">Address</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Street2" type="text" id="Street2"  value="" size="40" maxlength=40>
	    </div>
	  <div class="col-3">
	    <label for="District2">District</label>
	    </div>
	  <div class="col-9 col-expanded">	
	    <input name="District2" type="text" id="District2" size="40" maxlength=40>
	    </div>
	  <div class="col-3">
	    <label for="Town2">Town</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Town2" type="text" id="Town2"  value="" size="40" maxlength=40>
	    </div>
	  <div class="col-3">
	    <label for="County2">County</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="County2" type="text" id="County2" size="45" maxlength="100">
	    </div>
	  <div class="col-3">
	    <label for="Postcode2">Postcode</label>
	    </div>
	  <div class="col-9 col-expanded">
	    <input name="Postcode2" type="text" id="Postcode2" size="45" maxlength="100">
	    </div>
	  <div class="col-12">
	    <h4 class="prompt">How long had you lived at this address</h4>
	    </div>
	  <div class="col-3">
	    <label for "SecYrs">Years</label>
	    </div>
	  <div class="col-3">
	    <input name="SecYrs" type="text" id="SecYrs" size="5" maxlength="2" class="small"> 
	    </div>
	  <div class="col-3">
	    <label for "SecMths">Months</label>
	    </div>   
	  <div class="col-3">
	    <input name="SecMths" type="text" id="SecMths" size="5" maxlength="2" class="small">
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
		  <input name="District" type="hidden" id="District"  value="<%=Request.Querystring("District")%>">      
		  <input name="Town" type="hidden" id="Town"  value="<%=Request.Querystring("Town")%>">      
		  <input name="County" type="hidden" id="County" value="<%=Request.Querystring("County")%>">
		  <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
		  <input name="FirstYrs" type="hidden" id="FirstYrs" value="<%=Request.Querystring("FirstYrs")%>">
		  <input name="FirstMths" type="hidden" id="FirstMths" value="<%=Request.Querystring("FirstMths")%>"> 
	  
	  <div class="col-12 buttons formnav buttons">
	    <input type="submit" name="Submit" value="Next" class="button-next">
	    <input type="hidden" name="isSubmitted" value="yes">
	    </div>  
	  </form>

<%
End if
%>
	</div>
   </div>
  </div>
    
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.apply.inc.asp" -->