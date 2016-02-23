<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/connGazza.asp" -->
<%
Posty =  Request.Form("Pcode")
TC = Request.Form("AgreeTC")
Length = len(Posty)
ADV = Request.Form("advisor")
result = False
%>
<%
do until (Length = 0)
NewStr = Left(Posty,Length)
Dim rsGazza__varPcode
rsGazza__varPcode = "AB11"
If Posty <> "" Then 
  rsGazza__varPcode = NewStr
End If
%>
<%
Dim rsGazza
Dim rsGazza_numRows
Set rsGazza = Server.CreateObject("ADODB.Recordset")
rsGazza.ActiveConnection = MM_connGazza_STRING
rsGazza.Source = "SELECT *  FROM gazetteer  WHERE code = '" + Replace(rsGazza__varPcode, "'", "''") + "'"
rsGazza.CursorType = 0
rsGazza.CursorLocation = 2
rsGazza.LockType = 1
rsGazza.Open()

rsGazza_numRows = 0
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>PostCodeChecker</title>
<%

	If rsGazza.EOF then
		Length=Length-1
	Else
 
	Exit Do
%>

</head>

<%
End If
rsGazza.Close()
Set rsGazza = Nothing
loop
%>
<body>
<% If Length <> 0 then %>
<%
Response.write(Posty)
Response.write(TC)
Response.write(ADV)


 If (rsGazza.Fields.Item("cango")) = "True" then %>
<%= Response.Redirect("AreaCovered.asp") %>
<script>form1.submit()</script>
<% Else %>
<%= Response.Redirect("AreaNotCovered.asp") %>
<% End If %>
<% Else %>
<%= Response.Redirect("PostcodeUnrecognised.asp") %>
<% End If %>


</body>
</html>