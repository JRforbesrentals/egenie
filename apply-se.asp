<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="includes/config.asp" -->
<%
page_title = "Apply Online"

If Request.Querystring("isSubmittedQ") = "yes" Then

	If Request.Querystring("AgreeTC") = "yes" Then %>
	
	<form name="form1" method="post" action="ApplyPostCodeCheck.asp" onSubmit="javascript:pageTracker._linkByPost(this)">
      <input name="pcode" type="hidden" value= "<%=Request.Querystring("Pcode") %>" >      
      <input name="AgreeTC" type="hidden" value= "<%=Request.Querystring("AgreeTC") %>">

	  <input type="hidden" name="product" value="<%=Request.Querystring("product")%>" />
	  <input type="hidden" name="rprice" value="<%=Request.Querystring("rprice")%>">
      <input type="hidden" name="productImage" value="<%=Request.Querystring("productImage")%>">

	  
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
      <div class="module-box">
         	    <%
			If Request.Form("product") <> "" Then
				Response.Write "<p>You're applying to rent a <strong>" & Request.Form("product") & "</strong></p>"
				Response.Write "<p class=""centered"">Weekly Price:</p><p class=""centered price-"">" & Request.Form("rprice") & "</p>"         
				Response.Write "<img src=""" & "../../" & Request.Form("productImage") &  """ />" 
			End If
		%>
	  </div>
    </div>
    
    <div class="col-8 col-expanded float-left"> 
      <div class="module-box">
<p class="instructive">To qualify for the 2.5% online discount we need to perform a credit check. Please enter as much detail as possible and have your information to hand before you start. Once finished one of our sales advisors will be in touch to complete your application. Please read the Terms &amp; Conditions below and enter your postcode to begin.</p>

	<form action="apply-se.asp" method="get" id="applyForm">
	  <div>
	    <label for="Pcode" class="nofloat">Your Postcode</label>
	    <input name="Pcode" type="text" id="Pcode" class="main" />
	    <div class="discount">
	      <p>Apply Online Now for a 2.5% discount</p>          
	      </div>
	    <input name="advisor" type="hidden" id="advisor" value="www">
	    <input name="isSubmittedQ" type="hidden" value="yes">



	    <input name="apply" type="submit" id="apply" value="Apply" class="button-primary">
	    </div>
	  <div class="col-12">
	    <div class="row">
	      <label for="readterms" class="readterms">I agree to the Terms &amp; Conditions <% Response.write(txt)%></label>
	      <input name="AgreeTC" type="checkbox" id="AgreeTC" value="yes" class="checkboxterms" />


	      </div>
	    </div>
	  
	  
	  
	  
	  
	  <div class="terms">
	    <!--    <div class="col-12"> //-->
	    <hr>
	    <h5>Terms &amp; Conditions</h5>
	    <h6 class="toggle-link icon-toggle-dropdown toggle-terms">Permission to Perform a Credit Check</h6>
	    <div class="toggle-box toggle-terms">
	      <p>Under the terms of the data protection act, we hereby notify you that, using information you provide, we will make a search with a credit reference agency.</p>
	      <p>This search will be held on file, we will monitor and record information relating to your payment history and such records will be made available to credit reference agencies who will share that information with other businesses, in assessing applications for credit and fraud prevention. The information you provide may also be used for debtor tracing.</p>
	      <p>For more information please click here or contact us on 01737 647240 for more details.</p>
	      </div>
	    <h6 class="toggle-link icon-toggle-dropdown toggle-terms">Contract Terms</h6>
	    <div class="toggle-box">
	      <p>Available to persons aged 18 and over, subject to status and installation conditions.  Specifications may change and are subject to availability.  Same day servicing is offered when contacted before 10am Mon to Sat.  Rental payment is one month in advance and new customers are required to pay a one off &pound;20 administration charge. Rentals prices quoted include VAT at the current rate except *mobility scooters which are VAT exclusive. For payments other than by direct debit a surcharge of £1 per month is applicable. Minimum period of hire is 24 months.</p>
	      <p>Smart TV services require a broadband connection. (Many manufacturers recommend minimum of 2-3MB for Services, some functionality may require automatic software updates/upgrades)  Freeview may not be available in all areas.</p>
	      <p>*Mobility scooter rental is VAT exempt if you have a disability, written details on request.</p>
	      </div>
	    <h6 class="toggle-link icon-toggle-dropdown toggle-terms">Contract Terms for Student Rentals</h6>
	    <div class="toggle-box toggle-terms">
	      <p>We offer a minimum rental contract of nine months, which includes installation, delivery and service calls. Student applications available to persons aged over 18 and under 23 years of age, subject to status and installation conditions.</p>
	      <p>A refundable deposit of &pound;35 plus a &pound;20 administration charge (the administration charge is a one of payment for new customers) is payable with the first months rental payment on delivery. The deposit will be repaid to you after the nine month period of hire has been completed and goods have been returned in good condition with all the payments having been met. Rental prices quoted include 20% VAT.</p>
	      <p>You, as the applicant, must be present to sign and show Two Forms of ID (preferably passport) + NUS Card and give Two Points of Contact - one should be a parent or guardian. The University details and courses are also required for verification.</p>
	      </div>  
	    </div>
	  </form>	
 
	
	</div>  
   </div>
  </div>
    
</div> <!-- contentwrapper //-->
<!--#include file="includes/footer.inc.asp" -->    