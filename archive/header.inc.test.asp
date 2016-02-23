<%
Dim NavCategoriesRS
Dim NavCategoriesRS_cmd
Dim NavCategoriesRS_numRows

Set NavCategoriesRS_cmd = Server.CreateObject ("ADODB.Command")
NavCategoriesRS_cmd.ActiveConnection = MM_rsMain_STRING
NavCategoriesRS_cmd.CommandText = "SELECT * FROM Categories WHERE include Like '-1'" 
NavCategoriesRS_cmd.Prepared = true

Set NavCategoriesRS = NavCategoriesRS_cmd.Execute
NavCategoriesRS_numRows = 0

Dim Repeat_Cat__numRows
Dim Repeat_Cat__index

Repeat_Cat__numRows = -1
Repeat_Cat__index = 0
NavCategoriesRS_numRows = NavCategoriesRS_numRows + Repeat_Cat__numRows

Dim rsMain__varCat2
rsMain__varCat2 = "%"
If (Request.QueryString("Category") <> "") Then 
  rsMain__varCat2 = Request.QueryString("Category")
End If

Dim NavSuppliersRS
Dim NavSuppliersRS_cmd
Dim NavSuppliersRS_numRows

Set NavSuppliersRS_cmd = Server.CreateObject ("ADODB.Command")
NavSuppliersRS_cmd.ActiveConnection = MM_rsMain_STRING
NavSuppliersRS_cmd.CommandText = "SELECT DISTINCT S.Supplier FROM Suppliers S, NewProducts P, Categories C WHERE P.Supplier = S.SupplierID AND P.Category = C.CategoryID AND S.include Like '-1'AND C.CategoryID LIKE'" + Replace(rsMain__varCat2, "'", "''") + "' " 
NavSuppliersRS_cmd.Prepared = true

Set NavSuppliersRS = NavSuppliersRS_cmd.Execute
NavSuppliersRS_numRows = 0

Dim Repeat_sup__numRows
Dim Repeat_sup__index

Repeat_sup__numRows = -1
Repeat_sup__index = 0
NavSuppliersRS_numRows = NavSuppliersRS_numRows + Repeat_sup__numRows


Dim TestimonialsRS
Dim TestimonialsRS_cmd
Dim TestimonialsRS_numRows

Set TestimonialsRS_cmd = Server.CreateObject ("ADODB.Command")
TestimonialsRS_cmd.ActiveConnection = MM_rsMain_STRING
TestimonialsRS_cmd.CommandText = "SELECT * FROM Testimonials" 
TestimonialsRS_cmd.Prepared = true

Set TestimonialsRS = TestimonialsRS_cmd.Execute
TestimonialsRS_numRows = 0

Dim Repeat_tes__numRows
Dim Repeat_tes__index

Repeat_tes__numRows = -1
Repeat_tes__index = 0
TestimonialsRS_numRows = TestimonialsRS_numRows + Repeat_tes__numRows

%>
<!DOCTYPE html>
<html lang="en-GB">

<head>

	<meta charset="utf-8" />
<%
If len(page_keywords)>0 Then
	Response.Write(vbTab & "<meta name=""Keywords\"" content=""" & page_keywords & """ />" & vbCrLf)
End If
If Len(page_description)>0 Then
	Response.Write(vbTab & "<meta name=""Description"" content=""" & page_description & """ />" & vbCrLf)
End If
%>
	<title><%=page_title%> | <%=COMPANY_NAME%></title>
	
	<link rel="stylesheet" href="<%=SITE_ROOT_PATH%>styles/global.css?123" />
	<!--[if lt IE 7]><link rel="stylesheet" href="<%=SITE_ROOT_PATH%>styles/ie6.css" /><![endif]-->
	<!--[if lt IE 9]><link rel="stylesheet" href="<%=SITE_ROOT_PATH%>styles/ie8.css" /><![endif]-->
	<script src="https://ajax.googleapis.com/ajax/libs/mootools/1.3.2/mootools-yui-compressed.js"></script>
	<script src="<%=SITE_ROOT_PATH%>scripts/common.js"></script>
<%=page_head%>

</head>

<body>

<div id="wrap">

<div id="header">
	<a href="<%=SITE_ROOT_PATH%>" id="logo"><img src="<%=SITE_ROOT_PATH%>images/forbes-rentals.gif" alt="<%=COMPANY_NAME%>" width="554" height="40" /></a>
	
	<div id="telephone"><%=COMPANY_TEL%></div>
</div>

<div id="nav">
	<ul>
		<li><a href="<%=SITE_ROOT_PATH%>index.asp">Home</a>
        <ul>
        <li><a href="<%=SITE_ROOT_PATH%>washing-machine-rental.asp">Washing Machine</a></li>
		<li><a href="<%=SITE_ROOT_PATH%>LED-Technology.asp">LED Technology</a></li>
        <li><a href="<%=SITE_ROOT_PATH%>LCD-Technology.asp">LCD Technology</a></li>
        <li><a href="<%=SITE_ROOT_PATH%>Plasma-Technology.asp">Plasma Technology</a></li>
		<li><a href="<%=SITE_ROOT_PATH%>fridge-rental.asp">Fridge Rental</a></li>
        <li><a href="<%=SITE_ROOT_PATH%>dishwasher-rental.asp">Dishwasher</a></li>
        <li><a href="<%=SITE_ROOT_PATH%>cooker-rental.asp">Cooker Rental</a></li>
        
        
	</ul></li>
		<li><a href="#">Products</a>
			<ul>
<% 
While ((Repeat_Cat__numRows <> 0) AND (NOT NavCategoriesRS.EOF))
	Response.Write(vbTab & vbTab & vbTab & vbTab & "<li><a href=""listing.asp?Category=" & (NavCategoriesRS.Fields.Item("CategoryID").Value) & """>" &(NavCategoriesRS.Fields.Item("Category").Value) & "</a></li>" & vbCrLf)
	Repeat_Cat__index=Repeat_Cat__index+1
	Repeat_Cat__numRows=Repeat_Cat__numRows-1
	NavCategoriesRS.MoveNext()
Wend
%>			
<li><a href="<%=SITE_ROOT_PATH%>listing2.asp?Make=Value">Value Range</a></li>
</ul>
		</li>
		<li><a href="<%=SITE_ROOT_PATH%>why-rent.asp">Why Rent?</a></li>
		<li><a href="<%=SITE_ROOT_PATH%>apply.asp">Apply Now</a></li>
		<li><a href="<%=SITE_ROOT_PATH%>support.asp">Support</a></li>
		<li><a href="<%=SITE_ROOT_PATH%>contact.asp">Contact</a></li>
        <li><a href="<%=SITE_ROOT_PATH%>scooter.asp">Mobility</a></li>
        <li><a href="http://www.forbes-rentals.co.uk/B2B/">Business Solutions</a></li>
        <li><a href="http://www.forbes-rentals.co.uk/B2B/Hotel-TV.asp">Hotel TV</a></li>
	</ul>
</div>
