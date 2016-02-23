<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="secureOLA/includes/config.asp" -->
<%
page_title = "Apply Online"

If Request.Querystring("isSubmittedQ") = "yes" Then

	If Request.Querystring("AgreeTC") = "yes" Then %>
	



<script type="text/javascript" language="JavaScript">
	var FormName = "form1";
</script>









	<form name="form1" method="get" action="ApplyPostCodeCheck.asp" onSubmit="javascript:pageTracker._linkByPost(this)">
      <input name="pcode" type="hidden" value= "<%=Request.Querystring("Pcode") %>" >      
      <input name="AgreeTC" type="hidden" value= "<%=Request.Querystring("AgreeTC") %>">

	  <input type="hidden" name="product" value="<%=Request.Querystring("product") %>" />
	  <input type="hidden" name="rprice" value="<%=Request.Querystring("rprice") %>" />
	  <input type="hidden" name="productImage" value="<%=Request.Querystring("productImage") %>" />	  
	</form>
<script>form1.submit()</script>
	
<%
		Else
		txt="<span class=""error""><- please confirm</span>"
	End If
End if
%>
<!--#include file="includes/header.apply.inc.asp" -->
  <div class="contentwrapper mainbody">
   <div class="row clearfix">
    <div class="col-12">         
	  <ul class="progressbar">
		<li class="address activestep">Address<br /> Details</li>
        <li class="personal notstartedstep">Personal<br /> Details</li>
        <li class="payment notstartedstep">Employment</li> 
      </ul>
  </div>
</div> 	  
 <div class="row clearfix">
   <div class="col-4 col-expanded float-right">
      
         	    <%
			If Request.Form("product") <> "" Then
				Response.Write "<p class=""centered"">You're applying to rent a <strong>" & Request.Form("product") & "</strong></p>"
				Response.Write "<p class=""producttype-apply centered"">Weekly Price:</p><p class=""centered price-apply"">&pound;" & Request.Form("rprice") & "</p>"
				Response.Write "<img src=""" & "../../" & Request.Form("productImage") &  """ />" 
			End If
		%>
	  
    </div>
    
    <div class="col-8 col-expanded float-left"> 
      <div class="module-box">
    <h1>Application To Pay Weekly</h1>

<p class="instructive">We need to perform a credit check. Please enter as much detail as possible and have your information to hand before you start. Once finished one of our sales advisors will be in touch to complete your application. Please read the Terms &amp; Conditions below and enter your postcode to begin.</p>
	<form action="apply-se.asp" method="get" id="applyForm">
	  <label for="Pcode" class="nofloat">Your Postcode</label>
	  <input name="Pcode" type="text" id="Pcode" class="main" />
	  <input name="advisor" type="hidden" id="advisor" value="www">
	  <input name="isSubmittedQ" type="hidden" value="yes">

	  <input type="hidden" name="product" value="<%=Request.Querystring("product") %>" />
	  <input type="hidden" name="productImage" value="<%=Request.Querystring("productImage") %>" />
	  <input type="hidden" name="rprice" value="<%=Request.Querystring("rprice") %>" />

	  <input name="apply" type="submit" id="apply" value="Apply" class="button-primary">

	  
	  
	  <div class="col-12">
	    <div class="row">
	      <label for="readterms" class="readterms">I agree to the Terms &amp; Conditions <% Response.write(txt)%></label>
	      <input name="AgreeTC" type="checkbox" id="AgreeTC" value="yes" class="checkboxterms" />
	      </div>
	    </div>
	  
	    <h5 class="terms">Terms &amp; Conditions</h5>
	    <h6 class="toggle-link-terms"><span class="icon-toggle"></span>Permission to Perform a Credit Check</h6>
	    <div class="toggle-box-terms">
           <p>Under the terms of the data protection act, we hereby notify you that, using information you provide, we will make a search with a credit reference agency.</p>
           <p>This search will be held on file, we will monitor and record information relating to your payment history and such records will be made available to credit reference agencies who will share that information with other businesses, in assessing applications for credit and fraud.</p> <p>prevention. The information you provide may also be used for debtor tracing.</p>
           <p>For more information please click here or contact us on XXXXXXXXXX TBC for more details.</p>
	      </div>
	    <h6 class="toggle-link-terms"><span class="icon-toggle"></span>Contract Terms</h6>
	    <div class="toggle-box-terms">
            <p>Available to persons aged 18 and over, subject to status and installation conditions.  Specifications may change and are subject to availability.  Same day servicing is offered when requested before 10am Mon to Sat.  Rentals are payable one week in advance for weekly rental agreements and one month in advance for monthly rental agreements and new customers are required to pay a one off &pound;15 administration charge. Rental prices quoted include VAT at the current rate.</p>
            <p>The minimum period of hire is 12 months for refurbished products and 18 months for new products.</p>
            <p>For payments other than by debit card a surcharge of &pound;1 per month is applicable.</p>
            <p>The applicant must be present for installation to sign the hire agreement and provide the I.D. agreed during the application process.</p>
            <p>Smart TV services require a broadband connection and many manufacturers recommend minimum of 2-3MB for Services. Some functionality may require automatic software updates/upgrades.  Freeview may not be available in all areas.</p>
	      </div>	    
	    </div>    
	  </form>
     
   </div>
  </div>
    
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.apply.inc.asp" -->