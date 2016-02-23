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
  <div class="contentwrapper mainbody">
   <div class="row clearfix">
    <div class="col-12">         
     <ul class="progressbar">
        <li class="personal completedstep">Personal<br /> Details</li>
        <li class="address completedstep">Address<br /> Details</li>
        <li class="payment activestep">Finance &amp; Employment<br /> Details</li>
      </ul>
  </div>
</div> 	  
<div class="row clearfix">
   <div class="col-4 col-expanded float-right">
    </div>    
    <div class="col-8 col-expanded float-left"> 
    <div class="module-box clearfix">
      <form action="apply-complete.asp" method="get" name="form1" onSubmit="return ValidateRequiredFields();" >
   
   <h2>Financial Details</h2>
   
       <div class="col-12">
   			<h4 class="prompt">Do you have a UK Current Bank Account?</h4>
        </div>
        <div class="col-3">
	    	<label for="Current AC">Please Select</label>
        </div>
       <div class="col-9 col-expanded">
           <input type="radio" name="CurrentAC" id="CurrentAC" value="Y">Yes
           <input type="radio" name="CurrentAC" id="CurrentAC" value="N">No
       </div>
    
    
     <div class="col-12">
   			<h4 class="prompt">Do you have a UK Debit or Credit Card?</h4>
        </div>
        <div class="col-3">
	    	<label for="Current AC">Please Select</label>
        </div>
       <div class="col-9 col-expanded">
           <input type="radio" name="DebitCredit" id="DebitCredit" value="Y">Yes
           <input type="radio" name="DebitCredit" id="DebitCredit" value="N">No
			</select>
       </div> 
   
   
   
   
   
   
     <hr />
    
    <h2>Employment Details</h2>
    <p><strong>Fields marked with <span>*</span> are mandatory</strong></p>
    
    
    
    
  
    
    
    
    
    
    
    
    
    
    
    
    <div class="col-3 col-expanded">
      <label for="Employer">Employer</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="Employer" type="text" id="Employer" size="45" maxlength="100">
      </div>
    <div class="col-12">
      <h4 class="prompt">Time With Employer</h4>
      </div>
    <div class="col-3 col-expanded">
      <label for "years">Years</label>
      </div>
    <div class="col-3 col-expanded">
      <input name="EmpYrs" type="text" id="EmpYrs" size="5" maxlength="2" class="small">
      </div>
    <div class="col-3 col-expanded">
      <label for "months">Months</label>
      </div>
    <div class="col-3 col-expanded">
      <input name="EmpMths" type="text" id="EmpMths" size="5" maxlength="2" class="small">
      </div>		
    <div class="col-3 col-expanded">
      <label for="occupation">Occupation</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="Occupation" type="text" id="Occupation" size="45" maxlength="100">
      </div>		
    <div class="col-3 col-expanded">
      <label for="WorkPhone">Work Telephone Number</label>
      </div>
    <div class="col-9 col-expanded">
      <input name="WorkPhone" type="text" id="WorkPhone" size="45" maxlength="100">
      </div>
    
    <div class="col-3 col-expanded">
      <label for="">Found us through?</label>
      </div>
    <div class="col-9 col-expanded">
      <select name="Leaf1" id="Leaf1">
        <option value="Unselected">Please Select..</option>
        <option value="Radio Advert">Radio Advert</option>
        <option value="Yellow Pages Advert">Yellow Pages Advert</option>
        <option value="Google">Google</option>
        <option value="Yahoo">Yahoo</option>
        <option value="MSN">MSN</option>
        <option value="YELL.COM">Yell.com</option>
        <option value="Other Search Engine">Other Search Engine</option>
        </select>
      </div>
    
    <div class="col-3 col-expanded">
      <label for="">Not Used</label>
      </div>
    <div class="col-9 col-expanded">
      <select name="Leaf2" id="Leaf2">
        <option value="Unselected">Not Used..</option>
        </select>
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
    
    <input name="Flat" type="hidden" class="textbox" id="Flat"  value="<%=Request.Querystring("Flat")%>">         
    <input name="House" type="hidden" class="textbox" id="House"  value="<%=Request.Querystring("House")%>">         
    <input name="HouseNo" type="hidden" class="textbox" id="HouseNo"  value="<%=Request.Querystring("HouseNo")%>">         
    <input name="Street" type="hidden" class="textbox" id="Street"  value="<%=Request.Querystring("Street")%>">  
    <input name="District" type="hidden" class="textbox" id="District" value="<%=Request.Querystring("District")%>">      
    <input name="Town" type="hidden" class="textbox" id="Town"  value="<%=Request.Querystring("Town")%>">      
    <input name="County" type="hidden" id="County" value="<%=Request.Querystring("County")%>">
    <input name="pcode" type="hidden" id="pcode" value="<%=Request.Querystring("pcode")%>">
    <input name="FirstYrs" type="hidden" id="FirstYrs" value="<%=Request.Querystring("FirstYrs")%>">
    <input name="FirstMths" type="hidden" id="FirstMths" value="<%=Request.Querystring("FirstMths")%>">
    
    <input name="Flat2" type="hidden" class="textbox" id="Flat2"  value="<%=Request.Querystring("Flat2")%>">
    <input name="House2" type="hidden" class="textbox" id="House2"  value="<%=Request.Querystring("House2")%>">
    <input name="HouseNo2" type="hidden" class="textbox" id="HouseNo2"  value="<%=Request.Querystring("HouseNo2")%>">
    <input name="Street2" type="hidden" class="textbox" id="Street2"  value="<%=Request.Querystring("Street2")%>">
    <input name="District2" type="hidden" class="textbox" id="District2" value="<%=Request.Querystring("District2")%>">
    <input name="Town2" type="hidden" class="textbox" id="Town2"  value="<%=Request.Querystring("Town2")%>">
    <input name="County2" type="hidden" id="County2" value="<%=Request.Querystring("County2")%>">
    <input name="Postcode2" type="hidden" id="Postcode2" value="<%=Request.Querystring("Postcode2")%>">
    <input name="SecYrs" type="hidden" id="SecYrs" value="<%=Request.Querystring("SecYrs")%>">
    <input name="SecMths" type="hidden" id="SecMths" value="<%=Request.Querystring("SecMths")%>">
    <input name="Flat3" type="hidden" class="textbox" id="Flat3"  value="<%=Request.Querystring("Flat3")%>">
    <input name="House3" type="hidden" class="textbox" id="House3"  value="<%=Request.Querystring("House3")%>">
    <input name="HouseNo3" type="hidden" class="textbox" id="HouseNo3"  value="<%=Request.Querystring("HouseNo3")%>">
    <input name="Street3" type="hidden" class="textbox" id="Street3"  value="<%=Request.Querystring("Street3")%>">
    <input name="District3" type="hidden" class="textbox" id="District3" value="<%=Request.Querystring("District3")%>">
    <input name="Town3" type="hidden" class="textbox" id="Town3"  value="<%=Request.Querystring("Town3")%>">
    <input name="County3" type="hidden" id="County3"  value="<%=Request.Querystring("County3")%>">
    <input name="Postcode3" type="hidden" id="Postcode3" value="<%=Request.Querystring("Postcode3")%>">
    <input name="advisor" type="hidden" value= "<%=Request.Querystring("advisor") %>">
    
    
     <div class="col-12 buttons formnav buttons">
       <input type="submit" name="Submit" value="Submit" class="button-next">
       <input type="hidden" name="isSubmittedp5" value="yes">
   
      </div>
     </form>
    </div>
   </div>
  </div>
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.apply.inc.asp" -->