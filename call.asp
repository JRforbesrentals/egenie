<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="includes/config.asp" -->
<%
page_title = "About Egenie"
page_keywords = ""
page_description = ""
%>
<!--#include file="includes/header.inc.asp" -->
<div class="contentwrapper mainbody clearfix">
       <div class="row clearfix">
         <div class="col-12">
           <div class="module-box">
               <p class="egenie-strapline"><span class="egenie"><em>e</em>genie</span> - Making Home Appliances and Televisions Affordable</p>
               <h1 class="no-bottom-margin"><span class="egenie"><em>e</em>genie</span> Call Me Back</h1>
			   <p><em class="oblique large">Please leave your contact details and preferred time for us to call you. Or call <span class="egenie"><em>e</em>genie</span> on <a href="tel:03450702337" class="largefont">0345 0702337</a></em></p>


                    <form action="call-sendmail.asp" method="post" name="form1" id="form1">
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
                        <div class="col-12">
                         <fieldset>
                           <div class="col-3 col-expanded">                  
                              <legend>Query Type</legend>
                           </div>                
                           <div class="col-9 col-expanded">
          		              <div class="col-4 col-expanded col-nopad">
                                <input type="radio" id="sales" name="colorRadio" value="Sales">
                                <label for="rental" class="nofloat">Sales Enquiry</label>
                              </div>
                              <div class="col-4 col-expanded col-nopad">
                                <input type="radio" id="repairssupport" name="colorRadio" value="Repairs / Support">
                                <label for="repairssupport" class="nofloat">Repairs / Support</label>
                              </div>
                              <div class="col-4 col-expanded col-nopad">
                              </div>       
                          </div>
                         </fieldset>
				        </div>
                        <div class="col-3 col-expanded">                  
                            <label for="Existing">Existing Customer?</label>
                        </div>
                        <div class="col-9 col-expanded">
                            <input name="Existing" type="checkbox" id="Existing" value="yes" />
                        </div>
                        
                        <div class="clearfix"></div>
                    
                        <div class="col-3 col-expanded">                  
                            <label for="HowHelp">How Can We Help?</label>
                        </div>
                        <div class="col-9 col-expanded">
                            <textarea name="HowHelp" type="text" id="HowHelp" rows="4" cols="50"  maxlength="400" /></textarea>
                        </div>                   
                    
                    
                        <div class="col-12 formnav-blank">
                            <div class="col-3 col-expanded"></div>
                            <div class="col-9 col-expanded">                
					           <input type="submit" name="Submit" value="Call Me" class="button-callback" />
                	           <input type="hidden" name="isSubmitted" value="yes" />
                            </div>
			             </div>                
                    
                    
                    
                    
                    
                    
                    </form>
                <div class="clearfix"></div>
 
            </div>
          </div>
        </div>
      </div>
<!--#include file="includes/footer.inc.asp" -->