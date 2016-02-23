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
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><%=page_title%> | <%=COMPANY_NAME%></title>
<%
If len(page_keywords)>0 Then
  Response.Write(vbTab & "<meta name=""Keywords"" content=""" & page_keywords & """ />" & vbCrLf)
End If
If Len(page_description)>0 Then
  Response.Write(vbTab & "<meta name=""Description"" content=""" & page_description & """ />" & vbCrLf)
End If
%>
<meta name="viewport" content="width-device-width=1,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="scripts/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="styles/main.css">
</head>
<body>
    <nav class="apply">
	   <div class="nav-support">
	    <div class="contentwrapper clearfix">
	     <a href="<%=SITE_ROOT_PATH%>index.asp" class="logo"></a>
	     </div>
	    </div>
    </nav>
    <div class="wrapper">
       <a href="#" id="togglemenu" class="icon-menu">Menu</a>
          <div class="headermobile clearfix">
            <a href="<%=SITE_ROOT_PATH%>index.asp"><img src="logo.png" class="logo" alt="<%=COMPANY_NAME%>"></a>
      		<p class="tel large"><span class="icon-callus"></span>0800 00 00 00</p>
    </div> 