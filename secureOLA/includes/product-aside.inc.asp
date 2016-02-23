<%
 
Dim rsList__varList
rsList__varList = "B"
If (Request.querystring("Category") <> "") Then 
  rsList__varList = Request.querystring("Category")
  Session("Cat")=Request.querystring("Category")
  Else 
   rsList__varList = Session("Cat")
End If
 
%>
<%
Dim rsList
Dim rsList_cmd
Dim rsList_numRows

Set rsList_cmd = Server.CreateObject ("ADODB.Command")
rsList_cmd.ActiveConnection = MM_rsMain_STRING
rsList_cmd.CommandText = "SELECT P.*, S.Supplier, S.buttonup, C.Category FROM NewProducts P, Suppliers S, Categories C WHERE P.Supplier = S.SupplierID AND P.Category = C.CategoryID AND [current]=-1 AND P.Category Like ?" 
rsList_cmd.Prepared = true
rsList_cmd.Parameters.Append rsList_cmd.CreateParameter("param1", 200, 1, 255, rsList__varList) ' adVarChar

Set rsList = rsList_cmd.Execute
rsList_numRows = 0
%>
<%
Dim HLooper1__numRows
HLooper1__numRows = -3
Dim HLooper1__index
HLooper1__index = 0
rsList_numRows = rsList_numRows + HLooper1__numRows
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rsList_first = MM_offset + 1
rsList_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rsList_first > MM_rsCount) Then
    rsList_first = MM_rsCount
  End If
  If (rsList_last > MM_rsCount) Then
    rsList_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = MM_keepMove & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If
%>

<aside class="toggler">
	<h2 class="toggle-link tl-related icon-toggle-dropdown-open">Similar Products</h2>
	<ul class="toggle-box tb-related tb-open">
          			<%
					startrw = 0
					endrw = HLooper1__index
					numberColumns = 1
					numrows = -1
					while((numrows <> 0) AND (Not rsList.EOF))
						startrw = endrw + 1
						endrw = endrw + numberColumns
 						%>
            			    
            			<%
						While ((startrw <= endrw) AND (Not rsList.EOF))
						%>
		<li><a href="product.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "prodid=" & rsList.Fields.Item("prodid").Value%>"><%=(rsList.Fields.Item("Make").Value)%>&nbsp;<%=(rsList.Fields.Item("Model").Value)%></a></li>
						<%
						startrw = startrw + 1
						rsList.MoveNext()
						Wend
						%>

          				<%
 						numrows=numrows-1
 					Wend
 					%>
	</ul>
</aside>
<%
rsList.Close()
Set rsList = Nothing
%>
