<%
	
 Dim objOLAMail
     
  Set objOLAMail = CreateObject("CDO.Message")
     
  objOLAMail.Subject = "Egenie Quick Enquiry"
  objOLAMail.From = "onlineapp@forbesoffers.co.uk"
  objOLAMail.To = "jason.rigby@forbes-rentals.co.uk"
'  objOLAMail.Cc = "stephen.edwards@forbes-rentals.co.uk"

   objOLAMail.TextBody = " QuickFullName: " & Request.Form("QuickFullName") & " Email: " & Request.Form("QuickEmail") & " QuickTel: " & Request.Form("QuickTel") & " How Can We Help?: " & Request.Form("QuickHowHelp")  
    
' objOLAMail.TextBody = dataString	
	
  ' Configure external mail server settings...

  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.livemail.co.uk"
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="onlineapp@forbesoffers.co.uk"
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="Forbes1926"
  objOLAMail.Configuration.Fields.Update 
  objOLAMail.Send 
  set objOLAMail = nothing

%>