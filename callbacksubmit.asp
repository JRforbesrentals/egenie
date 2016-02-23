<%
	
 Dim objOLAMail
     
  Set objOLAMail = CreateObject("CDO.Message")
     
  objOLAMail.Subject = "Egenie Call Me Back"
  objOLAMail.From = "onlineapp@forbesoffers.co.uk"
  objOLAMail.To = "jason.rigby@forbes-rentals.co.uk"
'  objOLAMail.Cc = "stephen.edwards@forbes-rentals.co.uk"
 ' objOLAMail.TextBody = "Name: " & Request.Form("Email")

   objOLAMail.TextBody = "Name: " & Request.Form("Name") & " Email: " & Request.Form("Email") & " Tel: " & Request.Form("Tel") & " Call Back Time: " & Request.Form("CallTime") & " How Can We Help?: " & Request.Form("HowHelp")  
    
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
