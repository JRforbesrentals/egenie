<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/rsMain.asp" -->
<!--#include file ="includes/config.asp" -->
<%
page_title = ""
page_description = ""
%>


<%
Dim rsMain
Dim rsMain_cmd
Dim rsMain_numRows

Set rsMain_cmd = Server.CreateObject ("ADODB.Command")
rsMain_cmd.ActiveConnection = MM_rsMain_STRING
rsMain_cmd.CommandText = "SELECT P.*, S.Supplier, C.Category, C.CatText, C.CatImage, C.CatTitle, C.include FROM NewProducts P, Suppliers S, Categories C WHERE P.Supplier = S.SupplierID AND P.Category = C.CategoryID AND [current]=-1 AND [C.include]=-1 AND [P.Key]=-1" 
rsMain_cmd.Prepared = true

Set rsMain = rsMain_cmd.Execute
rsMain_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
rsMain_numRows = rsMain_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rsMain_total
Dim rsMain_first
Dim rsMain_last

' set the record count
rsMain_total = rsMain.RecordCount

' set the number of rows displayed on this page
If (rsMain_numRows < 0) Then
  rsMain_numRows = rsMain_total
Elseif (rsMain_numRows = 0) Then
  rsMain_numRows = 1
End If

' set the first and last displayed record
rsMain_first = 1
rsMain_last  = rsMain_first + rsMain_numRows - 1

' if we have the correct record count, check the other stats
If (rsMain_total <> -1) Then
  If (rsMain_first > rsMain_total) Then
    rsMain_first = rsMain_total
  End If
  If (rsMain_last > rsMain_total) Then
    rsMain_last = rsMain_total
  End If
  If (rsMain_numRows > rsMain_total) Then
    rsMain_numRows = rsMain_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (rsMain_total = -1) Then

  ' count the total records by iterating through the recordset
  rsMain_total=0
  While (Not rsMain.EOF)
    rsMain_total = rsMain_total + 1
    rsMain.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (rsMain.CursorType > 0) Then
    rsMain.MoveFirst
  Else
    rsMain.Requery
  End If

  ' set the number of rows displayed on this page
  If (rsMain_numRows < 0 Or rsMain_numRows > rsMain_total) Then
    rsMain_numRows = rsMain_total
  End If

  ' set the first and last displayed record
  rsMain_first = 1
  rsMain_last = rsMain_first + rsMain_numRows - 1
  
  If (rsMain_first > rsMain_total) Then
    rsMain_first = rsMain_total
  End If
  If (rsMain_last > rsMain_total) Then
    rsMain_last = rsMain_total
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

Set MM_rs    = rsMain
MM_rsCount   = rsMain_total
MM_size      = rsMain_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
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
rsMain_first = MM_offset + 1
rsMain_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rsMain_first > MM_rsCount) Then
    rsMain_first = MM_rsCount
  End If
  If (rsMain_last > MM_rsCount) Then
    rsMain_last = MM_rsCount
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
<%
Dim testimonialData
Dim testimonialData_cmd
Dim testimonialData_numRows

Set testimonialData_cmd = Server.CreateObject ("ADODB.Command")
testimonialData_cmd.ActiveConnection = MM_rsMain_STRING
testimonialData_cmd.CommandText = "SELECT * FROM Testimonials" 
testimonialData_cmd.Prepared = true

Set testimonialData = testimonialData_cmd.Execute
testimonialData_numRows = 0
%>
<!--#include file="includes/header.inc.asp" -->
<!--#include file="includes/carousel.inc.asp" -->
   <div class="contentwrapper mainbody">

	  <!--#include file="includes/steps.inc.asp" -->
      
      
      <div class="row clearfix">
       <div class="col-12"> 
		 <h1><span class="egenie"><em>e</em>genie</span> - Your Pay Weekly Electrical Store</h1>
         <p><span class="egenie"><em>e</em>genie</span> provides the very best pay weekly pricing on a range of large screen televisions, Blu-ray players, home cinema and kitchen laundry and cooking appliances.</p>
       
       
       </div>
       </div>
       
       <div class="row clearfix">
          <div class="col-4 col-expanded">
            <div class="module-box no-bottom-margin module-filled usp">
              <p class="usps"><span class="icon-usps-prices"></span>Our prices are inclusive of service and repairs.</p>
            </div>
          </div>
          <div class="col-4 col-expanded">
            <div class="module-box no-bottom-margin module-filled usp">
              <p class="usps"><span class="icon-usps-pay"></span>What you see is what you pay.</p>   
            </div>
          </div>
          <div class="col-4 col-expanded">
            <div class="module-box no-bottom-margin module-filled usp">
              <p class="usps"><span class="icon-usps-delivery"></span>Super fast next day delivery<a href="#terms">*</a>.</p>
            </div>
          </div>
       </div>
       

       <div class="row clearfix">
         <div class="col-12"> 
			<h2 class="textLeft choose">Choose your product</h2>   
         </div>
       </div>
       <div class="row clearfix">
         <div class="col-8 col-expanded"> 
              






<% If rsMain.BOF or rsMain.EOF Then
response.write("<p>Sorry but no products match your search.  Please try again.</p>")
response.write(Request.QueryString("Category"))
Else
%>


     
      
  <%
          startrw = 0
          endrw = HLooper1__index
          numberColumns = 4
          numrows =-1
          while((numrows <> 0) AND (Not rsMain.EOF))
            startrw = endrw + 1
            endrw = endrw + numberColumns
            tdw = numberColumns/4

            While ((startrw <= endrw) AND (Not rsMain.EOF))
            %>
      
      
      <article class="module-product-box clearfix">
        <div class="mod-container">
         <h2 class="centered">
          <a href="product.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "prodid=" & rsMain.Fields.Item("prodid").Value & "&amp;Category=A" %>">
              <%=(rsMain.Fields.Item("CatTitle").Value)%> Rental <%=(rsMain.Fields.Item("Make").Value)%> <br><span class="small"><%=(rsMain.Fields.Item("Model").Value)%></span></a>
            </a>
         </h2>

             <a href="product.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "prodid=" & rsMain.Fields.Item("prodid").Value & "&amp;Category=A" %>">
               <img src = "../../<%=(rsMain.Fields.Item("imageSmall").Value)%>" alt= "<%=rsMain.Fields.Item("Make").Value%>" class="centered" />
             </a>
  <div class="product-desc">
  <% If Not(rsMain.Fields.Item("specialprice").Value)=0 Then %>
    <p class="producttype- specialprice"><%=(rsMain.Fields.Item("specialoffer").Value)%></p>
    <div class="price- centered">
      <p><%= FormatCurrency((rsMain.Fields.Item("Specialprice").Value), 2, -2, -2, -2) %></p>
      <span class="small rpw">rpw</span>
    </div>
    <% Else %>
    <p class="producttype-">Pay Weekly</p>
     <div class="price- centered"><p><%= FormatCurrency((rsMain.Fields.Item("rprice").Value), 2, -2, -2, -2) %></p>
        <span class="small rpw">rpw</span>
     </div>
    <% End If %>
    <% If Not(rsMain.Fields.Item("specialprice").Value)=0 Then %>     
          <p class="small normalprice centered">Normal Price: <del><%= FormatCurrency((rsMain.Fields.Item("rprice").Value), 2, -2, -2, -2) %></del></p>
          <% End If %>
        <form id="applyNowForm" method="post" action="apply.asp" class="product-buttons clearfix">
            <input type="hidden" name="product" value="<%=(rsMain.Fields.Item("make").Value) & " " & (rsMain.Fields.Item("model").Value) & " " & (rsMain.Fields.Item("type").Value) %>" />
            <input type="hidden" name="productImage" value="<%=(rsMain.Fields.Item("imageBig").Value)%>">
            <input type="hidden" name="rprice" value="<%=(FormatCurrency((rsMain.Fields.Item("rprice").Value), 2, -2, -2, -2))%>">
            <input type="submit" name="applyFromHome" id="applyFromHome" value="Apply Now" class="button-apply" />
            <a href="product.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "prodid=" & rsMain.Fields.Item("prodid").Value & "&amp;Category=A" %>" class="button-moreinfo" />Details</a> 
        </form>   
    </div>  
    </div>
  </article>                         

      
      
      <%
            startrw = startrw + 1
            rsMain.MoveNext()
            Wend

            numrows=numrows-1
          Wend
  
          %>
      
      
  <%
rsMain.Close()
Set rsMain = Nothing
End If
%>
 </div>

          <div class="col-4 col-expanded">
           <!-- include file="includes/usp.inc.asp //-->
           
           <!--#include file="includes/benefits.inc.asp" -->
           <!--#include file="includes/quickenquiry.inc.asp" -->
           <!--    testimonial include removed //-->
          </div>
         
 
            
           
          <!-- include file="includes/promomodule.inc.asp //-->
          
          
          
        </div>
        
        
        
  <hr>      
<p class="small alignleft bottom-padding"><a name="terms">*Application and approval by 12pm preceding day, subject to Monday to Saturday delivery. Restricted to location.</p>
        
        
        
        
        
        
        
        
        
    <!--  <div class="row clearfix"> //-->

    <!--  </div> //-->
        
        
        
        
        
        </div>
      </div>
<!--#include file="includes/footer.inc.asp" -->
   <!-- <script src="scripts/carousel.js"></script> //-->

</body>
</html>



