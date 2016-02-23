<!--#include file="includes/config.asp" -->
<%
page_title = "Apply Online"
%>
<!--#include file="includes/header.inc.asp" -->
<div class="contentwrapper">
  <div class="row clearfix">
       <div class="module clearfix">
         <div class="col-12">
  

<h1>Application - Complete</h1>

<%
		Dim ttl, fnme, snme, pttl, pfnme, psnme, pmnme,htype, flt, hse, hseno, str, dis, twn, cty, pcode, Year1, Month1, flt2, hse2, hseno2, str2, dis2, twn2, cty2, pcode2, SecYrs, SecMths
		Dim flt3, hse3, hseno3, str3, dis3, twn3, cty3, pcode3, dob1,dob2,dob3,mar, res, tel, eml, cac, srt, acc, banky, bankm
		Dim mast, visa , amex, dine, store, cheq, empl, empyrs, empmth, occ, wtel
		Dim objCDO
		Set FS=Server.CreateObject("Scripting.FileSystemObject")
Set RS=FS.OpenTextFile("c:\Plesk\VHOSTS\forbes-rentals.co.uk\Private\Audit.txt",1,false) 
fcount=RS.ReadLine
RS.Close
fcount=fcount+1
Set RS=FS.OpenTextFile("c:\Plesk\VHOSTS\forbes-rentals.co.uk\Private\Audit.txt",2,false)
RS.Write fcount
RS.Close

Set RS=Nothing
Set FS=Nothing
		ttl = Request.Querystring("Title")
		AppString =  chr(34) & ttl & chr(34)
		fnme = Request.Querystring("Forename")
		AppString = AppString & "," & chr(34) & fnme & chr(34)
		mnme = Request.Querystring("MiddleName")
		AppString = AppString & "," & chr(34) & mnme & chr(34)
		snme = Request.Querystring("Surname")
		AppString = AppString & "," & chr(34) & snme & chr(34)
		pttl = Request.Querystring("FormerTitle")
		AppString = AppString & "," & chr(34) & pttl & chr(34)
		pfnme = Request.Querystring("FormerForename")
		AppString = AppString & "," & chr(34) & pfnme & chr(34)
		pmnme = Request.Querystring("FormerMiddleName")
		AppString = AppString & "," & chr(34) & pmnme & chr(34)
		psnme = Request.Querystring("FormerSurname")
		AppString = AppString & "," & chr(34) & psnme & chr(34)
		
		htype = Request.Querystring("HomeType")
		AppString = AppString & "," & chr(34) & htype & chr(34)
		flt = Request.Querystring("Flat")
		AppString = AppString & "," & chr(34) & Trim(flt) & chr(34)
		hse = Request.Querystring("House")
		AppString = AppString & "," & chr(34) & hse & chr(34)
		str = Request.Querystring("Street")
		AppString = AppString & "," & chr(34) & str & chr(34)
		dis = Request.Querystring("District")
		AppString = AppString & "," & chr(34) & dis & chr(34)
		twn = Request.Querystring("Town")
		AppString = AppString & "," & chr(34) & twn & chr(34)
		cty = Request.Querystring("County")
		AppString = AppString & "," & chr(34) & cty & chr(34)
		pcode = Request.Querystring("pcode")
		AppString = AppString & "," & chr(34) & pcode & chr(34)
		Year1 = Request.Querystring("FirstYrs")
		AppString = AppString & "," & chr(34) & Year1 & chr(34)
		Month1 = Request.Querystring("FirstMths")
		AppString = AppString & "," & chr(34) & Month1 & chr(34)
		
		flt2 = Request.Querystring("Flat2")
		AppString = AppString & "," & chr(34) & Trim(flt2) & chr(34)
		hse2 = Request.Querystring("House2")
		AppString = AppString & "," & chr(34) & hse2 & chr(34)
		str2 = Request.Querystring("Street2")
		AppString = AppString & "," & chr(34) & str2 & chr(34)
		dis2 = Request.Querystring("District2")
		AppString = AppString & "," & chr(34) & dis2 & chr(34)
		twn2 = Request.Querystring("Town2")
		AppString = AppString & "," & chr(34) & twn2 & chr(34)
		cty2 = Request.Querystring("County2")
		AppString = AppString & "," & chr(34) & cty2 & chr(34)
		pcode2 = Request.Querystring("Postcode2")
		AppString = AppString & "," & chr(34) & pcode2 & chr(34)
		Year2 = Request.Querystring("SecYrs")
		AppString = AppString & "," & chr(34) & Year2 & chr(34)
		Month2 = Request.Querystring("SecMths")
		AppString = AppString & "," & chr(34) & Month2 & chr(34)
		
		flt3 = Request.Querystring("Flat3")
		AppString = AppString & "," & chr(34) & Trim(flt3) & chr(34)
		hse3 = Request.Querystring("House3")
		AppString = AppString & "," & chr(34) & hse3 & chr(34)
		str3 = Request.Querystring("Street3")
		AppString = AppString & "," & chr(34) & str3 & chr(34)
		dis3 = Request.Querystring("District3")
		AppString = AppString & "," & chr(34) & dis3 & chr(34)
		twn3 = Request.Querystring("Town3")
		AppString = AppString & "," & chr(34) & twn3 & chr(34)
		cty3 = Request.Querystring("County3")
		AppString = AppString & "," & chr(34) & cty3 & chr(34)
		pcode3 = Request.Querystring("Postcode3")
		AppString = AppString & "," & chr(34) & pcode3 & chr(34)
		
		dob1 = Request.Querystring("DOB1")
		AppString = AppString & "," & chr(34) & dob1 & chr(34)
		dob2 = Request.Querystring("DOB2")
		AppString = AppString & "," & chr(34) & dob2 & chr(34)
		dob3 = Request.Querystring("DOB3")
		AppString = AppString & "," & chr(34) & dob3 & chr(34)
		mar = Request.Querystring("Marital")
		AppString = AppString & "," & chr(34) & mar & chr(34)
		res = Request.Querystring("Resident")
		AppString = AppString & "," & chr(34) & res & chr(34)
		tel = Request.Querystring("Phone")
		AppString = AppString & "," & chr(34) & tel & chr(34)
		eml = Request.Querystring("email")
		AppString = AppString & "," & chr(34) & eml & chr(34)
		cac = Request.Querystring("Current AC")
		AppString = AppString & "," & chr(34) & cac & chr(34)
		srt1 = Request.Querystring("Sort1")
		srt2 = Request.Querystring("Sort2")
		srt3 = Request.Querystring("Sort3")
		srt = srt1 & "-" &srt2 & "-" & srt3
		AppString = AppString & "," & chr(34) & srt & chr(34)
		acc = Request.Querystring("Account")
		AppString = AppString & "," & chr(34) & acc & chr(34)
		banky = Request.Querystring("BankYrs")
		AppString = AppString & "," & chr(34) & banky & chr(34)
		bankm = Request.Querystring("BankMths")
		AppString = AppString & "," & chr(34) & bankm & chr(34)
		mast = Request.Querystring("Mastercard")
		AppString = AppString & "," & chr(34) & mast & chr(34)
		visa = Request.Querystring("Visa")
		AppString = AppString & "," & chr(34) & visa & chr(34)
		amex = Request.Querystring("Amex")
		AppString = AppString & "," & chr(34) & amex & chr(34)
		dine = Request.Querystring("Diners")
		AppString = AppString & "," & chr(34) & dine & chr(34)
		store = Request.Querystring("Storecard")
		AppString = AppString & "," & chr(34) & store & chr(34)
		cheq = Request.Querystring("Cheque")
		AppString = AppString & "," & chr(34) & cheq & chr(34)
		empl = Request.Querystring("Employer")
		AppString = AppString & "," & chr(34) & empl & chr(34)
		empyrs = Request.Querystring("EmpYrs")
		AppString = AppString & "," & chr(34) & empyrs & chr(34)
		empmth = Request.Querystring("EmpMths")
		AppString = AppString & "," & chr(34) & empmth & chr(34)
		occ = Request.Querystring("Occupation")
		AppString = AppString & "," & chr(34) & occ & chr(34)
		wtel = Request.Querystring("WorkPhone")
		AppString = AppString & "," & chr(34) & wtel & chr(34)
		AppString = AppString & "," & chr(34) & fcount & chr(34)
		Leaf = "egenie |"& Request.Querystring("Leaf1") & Request.Querystring("Leaf2") & Request.Querystring("Leaf3")
		AppString = AppString & "," & chr(34) & Leaf & chr(34)
		hseno = Request.Querystring("HouseNo")
		AppString = AppString & "," & chr(34) & hseno & chr(34)
		hseno2 = Request.Querystring("HouseNo2")
		AppString = AppString & "," & chr(34) & hseno2 & chr(34)
		hseno3 = Request.Querystring("HouseNo3")
		AppString = AppString & "," & chr(34) & hseno3 & chr(34)
		product = Request.Querystring("prod") 
		AppString = AppString & "," & chr(34) & product & " Current Acc: " & Request.Querystring("CurrentAC") & " Debit / Credit Card: " & Request.Querystring("DebitCredit") & chr(34)
		adv = Request.Querystring("advisor")
		AppString = AppString & "," & chr(34) & "XYZ" & chr(34)
		
		CheckSum=0
		For i = 1 to Len(AppString)
		Checksum = Checksum+asc(mid(AppString,i,1))+i
		Next 
		
		AppString = AppString &","& Checksum

		
		
		
		'Encode Appstring
		'******************************
'   Crypt.asp
'******************************

Dim g_Key

g_CryptThis = AppString
Const g_KeyLocation = "c:\Plesk\VHOSTS\forbes-rentals.co.uk\Private\key.txt "
 g_Key = ReadKeyFromFile(g_KeyLocation)
 
Do While Len(AppString) > Len(g_Key)
     g_key = g_key & g_key
   Loop 
	
AppDataEncoded = EnCrypt(g_CryptThis)

Function EnCrypt(strCryptThis)
   Dim strChar, iKeyChar, iStringChar, i
   for i = 1 to Len(strCryptThis)
      iKeyChar = Asc(mid(g_Key,i,1))
      iStringChar = Asc(mid(strCryptThis,i,1))
      ' *** uncomment below to encrypt with addition,
      ' iCryptChar = iStringChar + iKeyChar
      iCryptChar = iKeyChar Xor iStringChar
      strEncrypted =  strEncrypted & Chr(iCryptChar)
   next
   EnCrypt = strEncrypted
End Function
Function ReadKeyFromFile(strFileName)
   Dim keyFile, fso, f
   set fso = Server.CreateObject("Scripting.FileSystemObject") 
   set f = fso.GetFile(strFileName) 
   set ts = f.OpenAsTextStream(1, -2)

   Do While not ts.AtEndOfStream
     keyFile = keyFile & ts.ReadLine
   Loop 

   ReadKeyFromFile =  keyFile
End Function



Set RS=Nothing
Set FS=Nothing

Set FS=Server.CreateObject("Scripting.FileSystemObject")
Set RS=FS.OpenTextFile ("c:\Plesk\VHOSTS\forbes-rentals.co.uk\Private\AppEnc.txt",2,false)
RS.Write AppDataEncoded
RS.Close

Set RS=Nothing
Set FS=Nothing

' Sending the email


Dim objOLAMail
     
  Set objOLAMail = CreateObject("CDO.Message")
     
  objOLAMail.Subject = "EgenieOnLineApplication"
  objOLAMail.From = "onlineapp@forbesoffers.co.uk"
  objOLAMail.To = "webtestdata@forbes-rentals.co.uk"
 ' objOLAMail.Cc = "steve.roberts@forbes-rentals.co.uk"
  objOLAMail.Bcc = "jason.rigby@forbes-rentals.co.uk"
  objOLAMail.TextBody = "Egenie OnLine Application."
  
  objOLAMail.AddAttachment "c:\Plesk\VHOSTS\forbes-rentals.co.uk\Private\AppEnc.txt"
    
  ' Configure external mail server settings...

  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2

  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.livemail.co.uk"
  
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
  
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="onlineapp@forbesoffers.co.uk"
  
  objOLAMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="Forbes1926"

 
  objOLAMail.Configuration.Fields.Update
      
  objOLAMail.Send
     
  set objOLAMail = nothing





Session.Abandon()

response.redirect("http://www.forbes-rentals.co.uk/forbes.staging/egenie.staging/webapp-complete.asp")

%>

      
<p>Thank you for applying online. Once your application has been processed by eGenies, one of our friendly trained staff will call to advise you on our Pay Weekly Products.</p>












          </div>         
       </div>
     </div>
    </div> <!-- contentwrapper //-->
<!--#include file="includes/footer.inc.asp" -->