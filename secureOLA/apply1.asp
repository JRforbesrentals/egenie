<!--#include file="includes/config.asp" -->
<%
page_title = "Apply Online"
%>
<!--#include file="includes/header.apply.inc.asp" -->
  <script type="text/javascript" language="JavaScript">
<!-- Copyright 2005 Bontrager Connection, LLC
//
// Two places need to be customized.
//
//
// Place 1:
// Between the quotation marks, specify the name of 
//    your form.

var FormName = "form1";


// Place 2:
// Between the quotation marks, specify the field names 
//    that are required. List the field name separated 
//    with a comma.

var RequiredFields = "Title,Forename,Surname,Phone,DOB1,DOB2,DOB3,email";


//
// No other customization of this JavaScript is required.
//
/////////////////////////////////////////////////////////

function ValidateRequiredFields()
{
var FieldList = RequiredFields.split(",")
var BadList = new Array();
for(var i = 0; i < FieldList.length; i++) {
	var s = eval('document.' + FormName + '.' + FieldList[i] + '.value');
	s = StripSpacesFromEnds(s);
	if(s.length < 1) { BadList.push(FieldList[i]); }
	}
if(BadList.length < 1) { return true; }
var ess = new String();
if(BadList.length > 1) { ess = 's'; }
var message = new String('\n\nThe following field' + ess + ' are required:\n');
for(var i = 0; i < BadList.length; i++) { message += '\n' + BadList[i]; }
alert(message);
return false;
}

function StripSpacesFromEnds(s)
{
while((s.indexOf(' ',0) == 0) && (s.length> 1)) {
	s = s.substring(1,s.length);
	}
while((s.lastIndexOf(' ') == (s.length - 1)) && (s.length> 1)) {
	s = s.substring(0,(s.length - 1));
	}
if((s.indexOf(' ',0) == 0) && (s.length == 1)) { s = ''; }
return s;
}
// -->
</script>



<script type="text/javascript" language="JavaScript">
  var FormName = "form1";
</script>




















 <div class="contentwrapper mainbody">
   <div class="row clearfix">
    <div class="col-12">         
    <ul class="progressbar">
        <li class="personal activestep">Personal<br /> Details</li>
        <li class="address notstartedstep">Address<br /> Details</li>
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
        Response.Write "<p class=""centered"">Weekly Price:</p><p class=""centered price-"">" & Request.Form("rprice") & "</p>"          
        Response.Write "<img src=""" & "../../../" & Request.Form("productImage") &  """ />" 


      End If
    %>
    </div>
    //-->
    </div>
    
    <div class="col-8 col-expanded float-left"> 
      <div class="module-box clearfix">
<form action="apply2.asp" method="get" name="form1" onSubmit="return ValidateRequiredFields();" >

  <!-- <div class="module clearfix">         
       <div class="col-12">	//-->
  <hgroup class="form">
    <h1>Application - Step 1</h1>
    <h2>Personal Details</h2>
    </hgroup>
  <p><strong>Fields marked with <span>*</span> are mandatory</strong></p> 
  <!--  </div> //-->
  
  
  <div class="col-3 col-expanded">
    <label for="Title">Title</label>
    </div>
  <div class="col-9 col-expanded">
    <select name="Title" id="Title">
      <option value="Mr">Mr</option>
      <option value="Mrs">Mrs</option>
      <option value="Miss">Miss</option>
      <option value="Ms">Ms</option>
      <option value="Dr">Dr</option>
      <option value="Sir">Sir</option>
      <option value="Lady">Lady</option>
      <option value="Lord">Lord</option>
      <option value="FR">Father</option>
      <option value="Sister">Sister</option>
      <option value="Prof">Professor</option>
      </select>
    </div>
  
  <div class="col-3 col-expanded">
    <label for="Forename"><span>*</span>First Name</label>
    </div>
  <div class="col-9 col-expanded">
    <input type="text" name="Forename" id="Forename" value="" />
    </div>
  
  <div class="col-3 col-expanded">
    <label for="MiddleName">Middle Name</label>
    </div>
  <div class="col-9 col-expanded">
    <input type="text" name="MiddleName" id="MiddleName" value="" />
    </div>
  
  <div class="col-3 col-expanded">
    <label for="Surname"><span>*</span>Surname</label>
    </div>
  <div class="col-9 col-expanded">
    <input type="text" name="Surname" id="Surname" value="" />
    </div>
  <div class="col-12">
    <h4 class="prompt">Please only complete Former name details if applicable</h4>
    </div>
  <div class="col-3 col-expanded">
    <label for="FormerTitle">Former Title</label>
    </div>
  <div class="col-9 col-expanded">
    <select name="FormerTitle" id="FormerTitle">
      <option value="Mr">Mr</option>
      <option value="Mrs">Mrs</option>
      <option value="Miss">Miss</option>
      <option value="Ms">Ms</option>
      <option value="Dr">Dr</option>
      <option value="Sir">Sir</option>
      <option value="Lady">Lady</option>
      <option value="Lord">Lord</option>
      <option value="FR">Father</option>
      <option value="Sister">Sister</option>
      <option value="Prof">Professor</option>
      </select>
    </div>
  <div class="col-3 col-expanded">
    <label for="FormerForename">Former First Name</label>
    </div>
  <div class="col-9 col-expanded">
    <input type="text" name="FormerForename" id="FormerForename" value="" />
    </div>
  
  <div class="col-3 col-expanded">
    <label for="FormerMiddleName">Former Middle Name</label>
    </div>
  <div class="col-9 col-expanded">
    <input type="text" name="FormerMiddleName" id="FormerMiddleName" value="" />
    </div>
  
  <div class="col-3 col-expanded">
    <label for="FormerSurname">Former Surname</label>
    </div>
  <div class="col-9 col-expanded">
    <input type="text" name="FormerSurname" id="FormerSurname" value="" />
    </div>
  <div class="col-12">
    <hr>
  </div>
  <div id="dob" class="col-3">
    <label for="DOB">Date of Birth <span>*</span><br><em class="small">e.g. 01/01/1955</em></label>
    </div>
  <div class="col-3">
    <input name="DOB1" type="text" id="DOB1" size="2" maxlength="2" class="small">
    </div>
  <div class="col-3">
    <input name="DOB2" type="text" id="DOB2" size="2" maxlength="2" class="small">
    </div>
  <div class="col-3">
    <input name="DOB3" type="text" id="DOB3" size="4" maxlength="4" class="small">
  </div>
  <div class="col-3 col-expanded">
    <label for="Marital">Marital Status</label>
    </div>
  <div class="col-9 col-expanded">
    <select name="Marital" id="Marital">
      <option value="M">Married</option>
      <option value="S">Single</option>
      <option value="D">Divorced</option>
      <option value="W">Widowed</option>
      <option value="X">Separated</option>
      <option value="P">Partner</option>
      </select>
  </div>
  <div class="col-3 col-expanded">
    <label for="Resident">Resident Status</label>
  </div>
  <div class="col-9 col-expanded">
    <select name="Resident" id="Resident">
      <option value="O">Owned</option>
      <option value="U">Rented-Unfurnished</option>
      <option value="F">Rented-Furnished</option>
      <option value="T">Tied</option>
      <option value="P">With Parents</option>
      </select>
  </div>
  <div class="col-3 col-expanded">
    <label for="Phone">Telephone <span>*</span></label>
    </div>
  <div class="col-9 col-expanded">
    <input name="Phone" type="text" value="" size="40" maxlength="40">
  </div>
  <div class="col-3 col-expanded">
    <label for="email">Email <span>*</span></label>
  </div>
  <div class="col-9 col-expanded">
    <input name="email" type="text" value="" size="40" maxlength="40">
  </div>
  <div class="col-3 col-expanded">
    <label for="prod">Interested in?</label>	
  </div>
  <div class="col-9 col-expanded">
    <select name="prod" id="prod">
      <option value="unselected">Please Select</option>
      <option value="Domestic Appliance">Domestic Appliance</option>
      <option value="Television">Television</option>
      <option value="Home Cinema">Home Cinema</option>
      <option value="Mobility Scooter">Mobility Scooter</option>
    </select>
  </div>
  <input name="pcode" type="hidden" id="pcode" value="<%=Request.form("PostCodeSubmitted")%>">
  <input name="Agree" type="hidden" id="Agree" value="<%=Request.form("AgreedTC")%>">





        <input type="hidden" name="product" value="<%=Request.Querystring("product")%>" />
    <input type="hidden" name="rprice" value="<%=Request.Querystring("rprice")%>">
      <input type="hidden" name="productImage" value="<%=Request.Querystring("productImage")%>">
  
  <div class="col-3 col-expanded">
  </div>
  <div class="col-9 col-expanded">
    <input name="Advisor" type="text" value= "<%=Request.Form("advisor") %>">
  </div>
  <div class="col-12 formnav">
    <!-- <div class="buttons"> //-->
    <!--<input type="reset" name="Submit2" value="Reset">//-->
    <input type="submit" name="Submit" value="Next" class="button-next">
    <input type="hidden" name="isSubmittedp1" value="yes">
    

    </div>
   </form>
	  </div>    
   </div>
  </div>
    
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.apply.inc.asp" -->