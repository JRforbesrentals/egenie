<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="includes/config.asp" -->
<%
Dim rsMain
Dim rsMain_cmd
Dim rsMain_numRows

Set rsMain_cmd = Server.CreateObject ("ADODB.Command")
rsMain_cmd.ActiveConnection = MM_rsMain_STRING
rsMain_cmd.CommandText = "SELECT P.*, S.Supplier, C.Category FROM NewProducts P, Suppliers S, Categories C WHERE P.Supplier = S.SupplierID AND P.Category = C.CategoryID" 
rsMain_cmd.Prepared = true

Set rsMain = rsMain_cmd.Execute
rsMain_numRows = 0
%>

<%
Dim rsPricelist__varProd
rsPricelist__varProd = "1"
If (Request.QueryString("prodid") <> "") Then 
  rsPricelist__varProd = Request.QueryString("prodid")
End If
%>
<%
Dim rsPricelist
Dim rsPricelist_cmd
Dim rsPricelist_numRows

Set rsPricelist_cmd = Server.CreateObject ("ADODB.Command")
rsPricelist_cmd.ActiveConnection = MM_rsMain_STRING
rsPricelist_cmd.CommandText = "SELECT * FROM NewProducts WHERE prodid = ?" 
rsPricelist_cmd.Prepared = true
rsPricelist_cmd.Parameters.Append rsPricelist_cmd.CreateParameter("param1", 200, 1, 20, rsPricelist__varProd) ' adVarChar

Set rsPricelist = rsPricelist_cmd.Execute
rsPricelist_numRows = 0
%>

<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rsPricelist_total
Dim rsPricelist_first
Dim rsPricelist_last

' set the record count
rsPricelist_total = rsPricelist.RecordCount

' set the number of rows displayed on this page
If (rsPricelist_numRows < 0) Then
  rsPricelist_numRows = rsPricelist_total
Elseif (rsPricelist_numRows = 0) Then
  rsPricelist_numRows = 1
End If

' set the first and last displayed record
rsPricelist_first = 1
rsPricelist_last  = rsPricelist_first + rsPricelist_numRows - 1

' if we have the correct record count, check the other stats
If (rsPricelist_total <> -1) Then
  If (rsPricelist_first > rsPricelist_total) Then
    rsPricelist_first = rsPricelist_total
  End If
  If (rsPricelist_last > rsPricelist_total) Then
    rsPricelist_last = rsPricelist_total
  End If
  If (rsPricelist_numRows > rsPricelist_total) Then
    rsPricelist_numRows = rsPricelist_total
  End If
End If
%>
<%
Dim MM_paramName 
%>
<%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = rsPricelist
MM_rsCount   = rsPricelist_total
MM_size      = rsPricelist_numRows
MM_uniqueCol = "prodid"
MM_paramName = "prodid"
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Specific Record: handle detail parameter

If (MM_paramIsDefined And MM_rsCount <> 0) Then

  ' get the value of the parameter
  MM_param = Request.QueryString(MM_paramName)

  ' find the record with the unique column value equal to the parameter value
  MM_offset = 0
  Do While (Not MM_rs.EOF)
    If (CStr(MM_rs.Fields.Item(MM_uniqueCol).Value) = MM_param) Then
      Exit Do
    End If
    MM_offset = MM_offset + 1
    MM_rs.MoveNext
  Loop

  ' if not found, set the number of records and reset the cursor
  If (MM_rs.EOF) Then
    If (MM_rsCount < 0) Then
      MM_rsCount = MM_offset
    End If
    If (MM_size < 0 Or MM_size > MM_offset) Then
      MM_size = MM_offset
    End If
    MM_offset = 0

    ' reset the cursor to the beginning
    If (MM_rs.CursorType > 0) Then
      MM_rs.MoveFirst
    Else
      MM_rs.Close
      MM_rs.Open
    End If
  End If

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rsPricelist_first = MM_offset + 1
rsPricelist_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rsPricelist_first > MM_rsCount) Then
    rsPricelist_first = MM_rsCount
  End If
  If (rsPricelist_last > MM_rsCount) Then
    rsPricelist_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)


page_title = (rsPricelist.Fields.Item("make").Value) & " " & (rsPricelist.Fields.Item("model").Value) & " " & (rsPricelist.Fields.Item("type").Value)
%>

  <%
If len(page_keywords)>0 Then
	Response.Write(vbTab & "<meta name=""Keywords\"" content=""" & page_keywords & """ />" & vbCrLf)
End If
If Len(page_description)>0 Then
	Response.Write(vbTab & "<meta name=""Description"" content=""" & page_description & """ />" & vbCrLf)
End If
%>
<!--#include file="includes/header.inc.asp" --> 
  <div class="wrapper">
  	<a href="#" id="togglemenu" class="icon-menu">Menu</a>
       	  <div class="headermobile clearfix">
            <a href="index.asp"><img src="images/forbes-rentals-logo.png" class="forbeslogo" alt="Forbes Rentals" /></a>
      		<p class="tel large">0800 00 63 00</p>
     	  </div>
  <div class="contentwrapper">
<div class="row clearfix">
       <div class="module clearfix">
       
       <div class="col-3 col-expanded"> 
       
       
       	<div class="module-cta">
          <h3 class="features">Product Features</h3>
             <ul class="features-list">
<%
Dim i
For i=1 to 15
If (rsPricelist.Fields.Item("style" & i).Value) <>"" Then
Response.Write "<li>" & (rsPricelist.Fields.Item("style" & i).Value) & "</li>" & vbCrLf
End If
Next
%>
	 </ul>		
            
	<% If Not(rsPricelist.Fields.Item("specialprice").Value)=0 Then %><p class="special">Special Rate</p><p class="rentaltype">Weekly Rental</p>
    <p class="rentalprice"><%= FormatCurrency((rsPricelist.Fields.Item("Specialprice").Value), 2, -2, -2, -2) %></p>
		<% Else %><p>Weekly Rental<br />
        <p class="rentalprice" title="Monthly <%= FormatCurrency((rsPricelist.Fields.Item("rprice").Value*52/12), 2, -2, -2, -2) %>"><%= FormatCurrency((rsPricelist.Fields.Item("rprice").Value), 2, -2, -2, -2) %><% If (rsPricelist.Fields.Item("Category").Value) = "ZC" Then %> excl VAT <% End If %></p>
	<% End If %>
		
            
		<% If Not(rsPricelist.Fields.Item("specialprice").Value)=0 Then %>
            
			<p class="small">Normal Price: <del><%= FormatCurrency((rsPricelist.Fields.Item("rprice").Value), 2, -2, -2, -2) %></del>
		<% End If %>
	</p>
<% If Not(rsPricelist.Fields.Item("Aprice").Value)=0 Then %>
			<p>As an Add On Rental: <strong><%= FormatCurrency((rsPricelist.Fields.Item("Aprice").Value), 2, -2, -2, -2) %></strong></p>
<% End If %>
			<form id="applyNowForm" method="post" action="apply.asp">
				<input type="hidden" name="product" value="<%=(rsPricelist.Fields.Item("make").Value) & " " & (rsPricelist.Fields.Item("model").Value) & " " & (rsPricelist.Fields.Item("type").Value)%>" />
				<input type="submit" name="apply" id="apply" value="Apply Now" class="button-product" />
			</form>
            
            
           
       </div>
     </div>
     <div class="col-6 col-expanded">       
             <hgroup>
                <h1><%=(rsPricelist.Fields.Item("make").Value) & " " & (rsPricelist.Fields.Item("type").Value)%></h1>
                <h2><%=(rsPricelist.Fields.Item("model").Value)%></h2>
             </hgroup>		
			 <img src="<%=(rsPricelist.Fields.Item("imageBig").Value) %>" alt="<%=(rsPricelist.Fields.Item("make").Value)%> &nbsp;<%=(rsPricelist.Fields.Item("model").Value)%>" class="centered" />
            <p><%=(rsPricelist.Fields.Item("ProductDescription").Value)%></p>
            <p class="centered"><strong>Rent this:</strong></p>			
			<a href="apply.asp" class="button-rentproduct"><%=(rsPricelist.Fields.Item("Make").Value)%>&nbsp;<%=(rsPricelist.Fields.Item("Model").Value)%></a> 
            <p class="centered"><strong>from Forbes Rentals today.</strong></p>
            
			
		
		</div> 
		<div class="col-3 col-expanded">	

   
   
    <!--#include file="includes/product-aside.inc.asp" -->
   
   
   
<%
currentPage = "http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL") & "?" & Request.Querystring
%>
	
	
    
    

 </div>
</div>
</div>


<%
Dim RecentlyViewed

RecentlyViewed = Session("recent") 
If IsArray(RecentlyViewed) Then
%>
<div class="row clearfix">
  <div class="module clearfix">
    <div class="col-12">
      <h3>Recently Viewed</h3>
      
  <%
	Response.Write Join( RecentlyViewed, vbCrLf )
%>
      
      
  <%
End If

//If Request.ServerVariables("Script_Name") = "product.asp" then
	
	If Not IsArray(RecentlyViewed) Then 
		RecentlyViewed = Array("","","","") ' initialize array
	End If
	RecentlyViewed(0) = RecentlyViewed(1) 
	RecentlyViewed(1) = RecentlyViewed(2) 
	RecentlyViewed(2) = "<div class=""col-3 centered""><a href=""product.asp?prodid=" & request("prodid") & """><img src=""" & (rsPricelist.Fields.Item("imageSmall").Value) & """ alt=""" & (rsPricelist.Fields.Item("type").Value) & """ /></a><p class=""small"">" & (rsPricelist.Fields.Item("make").Value) & " " & (rsPricelist.Fields.Item("type").Value) & "</p></div>" 
	Session("recent") = RecentlyViewed 
//End If
%>
      
      
      
      
      
      </div>	
    </div>
</div>


















<%
rsPricelist.Close()
Set rsPricelist = Nothing


rsMain.Close()
Set rsMain = Nothing
%>
         
    </div> <!-- contentwrapper //-->
<!--#include file="includes/footer.inc.asp" -->      