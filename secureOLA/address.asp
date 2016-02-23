<!--#include file="includes/config.asp" -->
<%
page_title = "Apply Online"
%>
<!--#include file="includes/header.inc.new.asp" -->
  <div class="contentwrapper">
   <div class="row clearfix">
    <div class="col-12">         
     <ul class="progressbar">
<li class="address activestep">Address<br /> Details</li>
        <li class="personal notstartedstep">Personal<br /> Details</li>
        <li class="employment notstartedstep">Employment</li>
  </ul>
  </div>
</div> 	  
<div class="row clearfix">
 <div class="module clearfix">
   <div class="col-8">
<form action="personal.asp" method="get" name="form1" onSubmit="return ValidateRequiredFields();" >
  <div class="module clearfix">         
    <div class="col-12">
      <h2>Address Details</h2>
      <p><strong>Fields marked with <span>*</span> are mandatory</strong></p>    
      </div>	
    <div class="col-3 col-expanded">
      <label for="HomeType">House Type</label>
      </div>
    <div class="col-9 col-expanded">
      <select name="HomeType">
        <option value="H">House</option>
        <option value="B">Bungalow</option>
        <option value="M">Maisonette</option>
        <option value="F">Flat</option>
        <option value="C">Mobile Home</option>
        <option value="R">Room</option>
        </select>
      </div>
    <div class="col-3 col-expanded">
      <label for="Flat">Flat</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="Flat" type="text" id="Flat" value="" size="45" maxlength="13">
      </div>		
    <div class="col-3 col-expanded">
      <label for="House">House Name</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="House" type="text" id="House" value="" size="45" maxlength="13">
      </div>
    <div class="col-3 col-expanded">
      <label for="HouseNo">House No.</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="HouseNo" type="text" id="HouseNo" value="" size="45" maxlength="4">
      </div>			
    <div class="col-3 col-expanded">
      <label for="Street">Address</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="Street" type="text" id="Street" value="" size="40" maxlength="40">
      </div>			
    <div class="col-3 col-expanded">
      <label for="District">District</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="District" type="text" id="District" size="40" maxlength="40">
      </div>			
    <div class="col-3 col-expanded">
      <label for="Town">Town</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="Town" type="text" id="Town" value="" size="40" maxlength="40">
      </div>			
    <div class="col-3 col-expanded">
      <label for="County">County</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="County" type="text" id="County" size="45" maxlength="100">
      </div>			
    <div class="col-3 col-expanded">
      <label for="pcode">Postcode</label>
      </div>
    <div class="col-9 col-expanded">
      <%= Request.QueryString("pcode") %>
      </div>	
    <div class="col-12">
      <h4 class="prompt">How long have you live at this address?</h4>
      </div>        
    <div class="col-3">
      <label for="howlongyears">Years<span>*</span></label>
      </div>
    <div class="col-3">
      <!-- <input type="text" id="howlongyears" class="moreDetailsNeeded"> //-->
      <input name="FirstYrs" type="text" id="FirstYrs" size="5" maxlength="2" class="small">
      </div>
    <div class="col-3">
      <label for="howlongmonths">Months<span>*</span></label>
      </div>
    <div class="col-3">
      <!--    <input type="text" id="howlongmonths"> //-->
      <input name="FirstMths" type="text" id="FirstMths" size="5" maxlength="2" class="small"> months
      </div>
    
    <div class="col-12 formnav">
      <!--	<input type="reset" name="Submit2" value="Reset"> //-->
      <!--	<a href="appl.asp" class="button-back">Back</a> //-->
      <input type="submit" name="Submit" value="Next" class="button-next">
      <input type="hidden" name="isSubmitted" value="yes">
      </div>
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
  <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
  <input name="Advisor" type="hidden" value= "<%=Request.Querystring("advisor") %>">
</form>
	</div>
    <div class="col-4 col-collapsing">
	    <img src="../images/CallJanice.jpg" alt="Call Janice" class="centered" />
    </div>
	<div class="col-4 col-right col-expanded"> </div>  
   </div>
  </div>
    
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.inc.new.asp" -->