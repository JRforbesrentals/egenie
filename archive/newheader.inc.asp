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
	
	<link rel="stylesheet" href="<%=SITE_ROOT_PATH%>styles/styleTest.css?123" />
	<!--[if lt IE 7]><link rel="stylesheet" href="<%=SITE_ROOT_PATH%>styles/ie6.css" /><![endif]-->
	<!--[if lt IE 9]><link rel="stylesheet" href="<%=SITE_ROOT_PATH%>styles/ie8.css" /><![endif]-->
	<script src="https://ajax.googleapis.com/ajax/libs/mootools/1.3.2/mootools-yui-compressed.js"></script>
	<script src="<%=SITE_ROOT_PATH%>scripts/common.js"></script>
<%=page_head%>
<!--#include file ="analytics.inc.asp" -->
</head>

<body>

<div id="wrap">

<div id="header">
	<a href="<%=SITE_ROOT_PATH%>" id="logo"><img src="<%=SITE_ROOT_PATH%>images/forbes-rentals.png" alt="<%=COMPANY_NAME%>" width="554" height="40" /></a>
	
	<div id="telephone"><%=COMPANY_TEL%></div>
</div>

<div id="nav">
<ul>
<li><a href="<%=SITE_ROOT_PATH%>index.asp">Home</a>
<ul>



<a href="listing.asp?Category=A">Plasma TV<span><strong>Plasma TVs have gas-filled chambers that emit light that produce better contrast</strong>
<br><img src="images/side-menu-plasma.png" alt="Plasma TV" /><br/></span></a>


<a href="listing.asp?Category=B">LCD TV<span><strong>LCD televisions use a layer of liquid crystals to produce high quality pictures</strong>
<br><img src="images/side-menu-LCD.png" alt="LCD TV" /><br/></span></a>
>
       
<a href="listing.asp?Category=C">LED TV<span><strong>LCD TV with LED backlighting to produce bright sharp images with depth of colour</strong>
<br><img src="images/side-menu-LED.png" alt="LED TV" /><br/></span></a>




	


</ul>
</li>

</ul>

<ul>
<li><a href="<%=SITE_ROOT_PATH%>index.asp">Home</a>
<ul>

<ul>

<a href="listing.asp?Category=A">Plasma TV<span><strong>Plasma TVs have gas-filled chambers that emit light that produce better contrast</strong>
<br><img src="images/side-menu-plasma.png" alt="Plasma TV" /><br/></span></a>

<ul>
</ul>
<a href="listing.asp?Category=B">LCD TV<span><strong>LCD televisions use a layer of liquid crystals to produce high quality pictures</strong>
<br><img src="images/side-menu-LCD.png" alt="LCD TV" /><br/></span></a>

<ul>
</ul>        
<a href="listing.asp?Category=C">LED TV<span><strong>LCD TV with LED backlighting to produce bright sharp images with depth of colour</strong>
<br><img src="images/side-menu-LED.png" alt="LED TV" /><br/></span></a>

<ul>
</ul>

</ul>	


</ul>
</li>

</ul>
</div>

