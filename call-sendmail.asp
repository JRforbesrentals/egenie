<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="includes/config.asp" -->
<%
page_title = "Egenie Call Back"
page_keywords = ""
page_description = ""
%>
<!--#include file="includes/header.inc.asp" -->
    <div class="contentwrapper mainbody clearfix">
       <div class="row clearfix">
         <div class="col-12">
           <div class="module-box">
               
<%
	
 Dim objOLAMail
     
  Set objOLAMail = CreateObject("CDO.Message")
     
  objOLAMail.Subject = "Egenie - Call Me Back Enquiry"
  objOLAMail.From = "onlineapp@forbesoffers.co.uk"
  objOLAMail.To = "jason.rigby@forbes-rentals.co.uk"
 ' objOLAMail.Cc = ""
  objOLAMail.TextBody = "Name: " & Request.Form("Name") & "  Email: " & Request.Form("Email") & "  Tel: " & Request.Form("Telephone_Number") & " Preferred Call Time: " & Request.Form("CallTime")  & " Existing Customer?: " & Request.Form("Existing") & " How Can We Help?: " & Request.Form("HowHelp")
    
  ' Configure external mail server settings...

  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.livemail.co.uk"
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="onlineapp@forbesoffers.co.uk"
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="Forbes1926"

 
  objOLAMail.Configuration.Fields.Update
      
  objOLAMail.Send
     
  set objOLAMail = nothing

response.redirect("call-ack.asp")

%>







            
               
               
                <div class="clearfix"></div>
           </div>
         </div>
      </div>
    </div>
<!--#include file="includes/footer.inc.asp" -->